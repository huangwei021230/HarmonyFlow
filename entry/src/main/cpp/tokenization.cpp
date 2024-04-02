#include "headers/tokenization.h"
namespace Tokenizer {
    std::wstring cleanText(const std::wstring &text) {
        std::wstring output;
        for (const wchar_t &cp : text) {
            if (cp == 0 || cp == 0xfffd || isControol(cp))
                continue;
            if (isWhitespace(cp))
                output += L" ";
            else
                output += cp;
        }
        return output;
    }

    bool isControol(const wchar_t &ch) {
        if (ch == L'\t' || ch == L'\n' || ch == L'\r')
            return false;
        auto cat = utf8proc_category(ch);
        if (cat == UTF8PROC_CATEGORY_CC || cat == UTF8PROC_CATEGORY_CF)
            return true;
        return false;
    }

    bool isWhitespace(const wchar_t &ch) {
        if (ch == L' ' || ch == L'\t' || ch == L'\n' || ch == L'\r')
            return true;
        auto cat = utf8proc_category(ch);
        if (cat == UTF8PROC_CATEGORY_ZS)
            return true;
        return false;
    }

    bool isPunctuation(const wchar_t &ch) {
        if ((ch >= 33 && ch <= 47) || (ch >= 58 && ch <= 64) || (ch >= 91 && ch <= 96) || (ch >= 123 && ch <= 126))
            return true;
        auto cat = utf8proc_category(ch);
        if (cat == UTF8PROC_CATEGORY_PD || cat == UTF8PROC_CATEGORY_PS || cat == UTF8PROC_CATEGORY_PE ||
            cat == UTF8PROC_CATEGORY_PC || cat == UTF8PROC_CATEGORY_PO // sometimes ¶ belong SO
            || cat == UTF8PROC_CATEGORY_PI || cat == UTF8PROC_CATEGORY_PF)
            return true;
        return false;
    }

    bool isChineseChar(const wchar_t &ch) {
        if ((ch >= 0x4E00 && ch <= 0x9FFF) || (ch >= 0x3400 && ch <= 0x4DBF) || (ch >= 0x20000 && ch <= 0x2A6DF) ||
            (ch >= 0x2A700 && ch <= 0x2B73F) || (ch >= 0x2B740 && ch <= 0x2B81F) || (ch >= 0x2B820 && ch <= 0x2CEAF) ||
            (ch >= 0xF900 && ch <= 0xFAFF) || (ch >= 0x2F800 && ch <= 0x2FA1F))
            return true;
        return false;
    }

    std::wstring tokenizeChineseChars(const std::wstring &text) {
        std::wstring output;
        for (auto &ch : text) {
            if (isChineseChar(ch)) {
                output += L' ';
                output += ch;
                output += L' ';
            } else
                output += ch;
        }
        return output;
    }

    std::wstring strip(const std::wstring &text) {
        std::wstring ret = text;
        if (ret.empty())
            return ret;
        size_t pos = 0;
        while (pos < ret.size() && isStripChar(ret[pos]))
            pos++;
        if (pos != 0)
            ret = ret.substr(pos, ret.size() - pos);
        pos = ret.size() - 1;
        while (pos != (size_t)-1 && isStripChar(ret[pos]))
            pos--;
        return ret.substr(0, pos + 1);
    }

    std::string normalize_nfd(const std::string &s) {
        std::string ret;
        char *result = (char *)utf8proc_NFD((unsigned char *)s.c_str());
        if (result) {
            ret = std::string(result);
            free(result);
            result = NULL;
        }
        return ret;
    }

    std::vector<std::wstring> split(const std::wstring &text) {
        std::vector<std::wstring> result;
        size_t pos = 0, found;

        while ((found = text.find_first_not_of(stripChar, pos)) != std::wstring::npos) {
            pos = text.find_first_of(stripChar, found);
            if (pos == std::wstring::npos) {
                result.push_back(text.substr(found));
                break;
            }
            result.push_back(text.substr(found, pos - found));
        }

        return result;
    }

    std::wstring runStripAccents(const std::wstring &text) {
        // Strips accents from a piece of text.
        std::wstring nText;
        try {
            nText = convertToUnicode(normalize_nfd(convertFromUnicode(text)));
        } catch (std::bad_cast &e) {
            std::cerr << "bad_cast" << std::endl;
            return L"";
        }

        std::wstring output;
        for (auto &ch : nText) {
            auto cat = utf8proc_category(ch);
            if (cat == UTF8PROC_CATEGORY_MN)
                continue;
            output += ch;
        }
        return output;
    }

    std::vector<std::wstring> runSplitOnPunc(const std::wstring &text) {
        size_t i = 0;
        bool startNewWord = true;
        std::vector<std::wstring> output;
        while (i < text.size()) {
            wchar_t ch = text[i];
            if (isPunctuation(ch)) {
                output.push_back(std::wstring(&ch, 1));
                startNewWord = true;
            } else {
                if (startNewWord)
                    output.push_back(std::wstring());
                startNewWord = false;
                output[output.size() - 1] += ch;
            }
            i++;
        }
        return output;
    }


    bool isStripChar(const wchar_t &ch) { return stripChar.find(ch) != std::wstring::npos; }

    std::vector<std::wstring> whitespaceTokenize(const std::wstring &text) {
        std::wstring rtext = strip(text);
        if (rtext.empty())
            return std::vector<std::wstring>();
        return split(text);
    }

    std::wstring join(const std::vector<std::wstring> &vec, const std::wstring &separator) {
        std::wostringstream oss;
        if (!vec.empty()) {
            auto it = vec.begin();
            oss << *it++;
            while (it != vec.end()) {
                oss << separator << *it++;
            }
        }
        return oss.str();
    }

    std::shared_ptr<Vocab> loadVocab(const std::string &vocabFile) {
        std::shared_ptr<Vocab> vocab(new Vocab);
        size_t index = 0;
        std::ifstream ifs(vocabFile, std::ifstream::in);
        std::string line;
        while (getline(ifs, line)) {
            std::wstring token = convertToUnicode(line);
            if (token.empty())
                break;
            token = strip(token);
            (*vocab)[token] = index;
            index++;
        }
        return vocab;
    }

    BasicTokenizer::BasicTokenizer(bool doLowerCase) : mDoLowerCase(doLowerCase) {}

    std::vector<std::wstring> BasicTokenizer::tokenize(const std::string &text) const {
        std::wstring nText = convertToUnicode(text);
        nText = cleanText(nText);

        nText = tokenizeChineseChars(nText);

        const std::vector<std::wstring> &origTokens = whitespaceTokenize(nText);
        std::vector<std::wstring> splitTokens;
        for (std::wstring token : origTokens) {
            if (mDoLowerCase) {
                token = tolower(token);
                token = runStripAccents(token);
            }
            const auto &tokens = runSplitOnPunc(token);
            splitTokens.insert(splitTokens.end(), tokens.begin(), tokens.end());
        }
        return whitespaceTokenize(join(splitTokens, L" "));
    }

    WordpieceTokenizer::WordpieceTokenizer(const std::shared_ptr<Vocab> vocab, const std::wstring &unkToken,
                                           size_t maxInputCharsPerWord)
        : mVocab(vocab), mUnkToken(unkToken), mMaxInputCharsPerWord(maxInputCharsPerWord) {}

    std::vector<std::wstring> WordpieceTokenizer::tokenize(const std::wstring &text) const {
        std::vector<std::wstring> outputTokens;
        for (auto &token : whitespaceTokenize(text)) {
            if (token.size() > mMaxInputCharsPerWord) {
                outputTokens.push_back(mUnkToken);
            }
            bool isBad = false;
            size_t start = 0;
            std::vector<std::wstring> subTokens;
            while (start < token.size()) {
                size_t end = token.size();
                std::wstring curSubstr;
                bool hasCurSubstr = false;
                while (start < end) {
                    std::wstring substr = token.substr(start, end - start);
                    if (start > 0)
                        substr = L"##" + substr;
                    if (mVocab->find(substr) != mVocab->end()) {
                        curSubstr = substr;
                        hasCurSubstr = true;
                        break;
                    }
                    end--;
                }
                if (!hasCurSubstr) {
                    isBad = true;
                    break;
                }
                subTokens.push_back(curSubstr);
                start = end;
            }
            if (isBad)
                outputTokens.push_back(mUnkToken);
            else
                outputTokens.insert(outputTokens.end(), subTokens.begin(), subTokens.end());
        }
        return outputTokens;
    }

    FullTokenizer::FullTokenizer(const std::string &vocabFile, bool doLowerCase)
        : mVocab(loadVocab(vocabFile)), mBasicTokenizer(BasicTokenizer(doLowerCase)),
          mWordpieceTokenizer(WordpieceTokenizer(mVocab)) {
        for (auto &v : *mVocab)
            mInvVocab[v.second] = v.first;
    }

    std::vector<std::wstring> FullTokenizer::tokenize(const std::string &text) const {
        std::vector<std::wstring> splitTokens;
        for (auto &token : mBasicTokenizer.tokenize(text))
            for (auto &subToken : mWordpieceTokenizer.tokenize(token))
                splitTokens.push_back(subToken);
        return splitTokens;
    }

    std::vector<size_t> FullTokenizer::convertTokensToIds(const std::vector<std::wstring> &text) const {
        std::vector<size_t> ret(text.size());
        for (size_t i = 0; i < text.size(); i++) {
            ret[i] = (*mVocab)[text[i]];
        }
        return ret;
    }
} // namespace Tokenizer
