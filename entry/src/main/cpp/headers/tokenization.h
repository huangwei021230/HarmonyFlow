// Note: This source code is a copy from github: https://gist.github.com/luistung/ace4888cf5fd1bad07844021cb2c7ecf
#pragma once
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <unordered_map>
#include <memory>
// #include <boost/algorithm/string.hpp>
#include <utf8proc.h>

const std::wstring stripChar = L" \t\n\r\v\f";
using Vocab = std::unordered_map<std::wstring, size_t>;
using InvVocab = std::unordered_map<size_t, std::wstring>;

namespace Tokenizer {

static std::wstring cleanText(const std::wstring &text);
static bool isControol(const wchar_t &ch);
static bool isWhitespace(const wchar_t &ch);
static bool isPunctuation(const wchar_t &ch);
static bool isChineseChar(const wchar_t &ch);
static std::wstring tokenizeChineseChars(const std::wstring &text);
static bool isStripChar(const wchar_t &ch);
static std::wstring strip(const std::wstring &text);
static std::vector<std::wstring> split(const std::wstring &text);
static std::wstring runStripAccents(const std::wstring &text);
static std::vector<std::wstring> runSplitOnPunc(const std::wstring &text);
static std::shared_ptr<Vocab> loadVocab(const std::string &vocabFile);
static std::vector<std::wstring> whitespaceTokenize(const std::wstring &text);

class BasicTokenizer {
public:
    BasicTokenizer(bool doLowerCase = true);
    std::vector<std::wstring> tokenize(const std::string &text) const;

private:
    bool mDoLowerCase;
};

class WordpieceTokenizer {
public:
    WordpieceTokenizer(std::shared_ptr<Vocab> vocab, const std::wstring &unkToken = L"[UNK]",
                       size_t maxInputCharsPerWord = 200);
    std::vector<std::wstring> tokenize(const std::wstring &text) const;

private:
    std::shared_ptr<Vocab> mVocab;
    std::wstring mUnkToken;
    size_t mMaxInputCharsPerWord;
};

class FullTokenizer {
public:
    FullTokenizer(const std::string &vocabFile, bool doLowerCase = true);
    std::vector<std::wstring> tokenize(const std::string &text) const;
    std::vector<size_t> convertTokensToIds(const std::vector<std::wstring> &text) const;
    inline size_t getVocabId(const std::wstring &token) { return (*mVocab)[token]; }

private:
    std::shared_ptr<Vocab> mVocab;
    InvVocab mInvVocab;
    std::string mVocabFile;
    bool mDoLowerCase;
    BasicTokenizer mBasicTokenizer;
    WordpieceTokenizer mWordpieceTokenizer;
};

// static std::vector<std::wstring> split(const std::wstring& text) {
//     std::vector<std::wstring>  result;
//     boost::split(result, text, boost::is_any_of(stripChar));
//     return result;
// }

static std::wstring convertToUnicode(const std::string &text) {
    size_t i = 0;
    std::wstring ret;
    while (i < text.size()) {
        wchar_t codepoint;
        utf8proc_ssize_t forward =
            utf8proc_iterate((utf8proc_uint8_t *)&text[i], text.size() - i, (utf8proc_int32_t *)&codepoint);
        if (forward < 0)
            return L"";
        ret += codepoint;
        i += forward;
    }
    return ret;
}

static std::string convertFromUnicode(const std::wstring &wText) {
    char dst[64];
    std::string ret;
    for (auto ch : wText) {
        utf8proc_ssize_t num = utf8proc_encode_char(ch, (utf8proc_uint8_t *)dst);
        if (num <= 0)
            return "";
        ret += std::string(dst, dst + num);
    }
    return ret;
}

static std::wstring tolower(const std::wstring &s) {
    std::wstring ret(s.size(), L' ');
    for (size_t i = 0; i < s.size(); i++) {
        ret[i] = utf8proc_tolower(s[i]);
    }
    return ret;
}
} // namespace Tokenizer