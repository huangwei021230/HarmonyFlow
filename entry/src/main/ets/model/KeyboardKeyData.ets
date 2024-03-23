/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export enum MenuType {
  NORMAL = 0,
  NUMBER = 1,
  SPECIAL = 2,
  EMOJI = 3,
  CLIPBOARD = 4
}

export enum KeyState {
  LOWER_CASE = 0,
  ONCE_UPPER_CASE = 1,
  UPPER_CASE = 2
}

export enum MenuKey {
  NUMBER_KEY = '?123',
  NORMAL_KEY = 'ABC',
  SPECIAL_KEY = '=/\<'
}

export interface keySourceListType {
  title: string,
  content: string,
  upperContent: string,
  width: number;
}

export interface sourceListType {
  content: string
}

export let keySourceListData: keySourceListType[] = [
  {
    title: '1',
    content: 'q',
    upperContent: 'Q',
    width: 36
  },
  {
    title: '2',
    content: 'w',
    upperContent: 'W',
    width: 36
  },
  {
    title: '3',
    content: 'e',
    upperContent: 'E',
    width: 36
  },
  {
    title: '4',
    content: 'r',
    upperContent: 'R',
    width: 36
  },
  {
    title: '5',
    content: 't',
    upperContent: 'T',
    width: 36
  },
  {
    title: '6',
    content: 'y',
    upperContent: 'Y',
    width: 36
  },
  {
    title: '7',
    content: 'u',
    upperContent: 'U',
    width: 36
  },
  {
    title: '8',
    content: 'i',
    upperContent: 'I',
    width: 36
  },
  {
    title: '9',
    content: 'o',
    upperContent: 'O',
    width: 36
  },
  {
    title: '0',
    content: 'p',
    upperContent: 'P',
    width: 36
  },
  {
    title: String.fromCharCode(126),
    content: 'a',
    upperContent: 'A',
    width: 36
  },
  {
    title: String.fromCharCode(33),
    content: 's',
    upperContent: 'S',
    width: 36
  },
  {
    title: '@',
    content: 'd',
    upperContent: 'D',
    width: 36
  },
  {
    title: String.fromCharCode(35),
    content: 'f',
    upperContent: 'F',
    width: 36
  },
  {
    title: '%',
    content: 'g',
    upperContent: 'G',
    width: 36
  },
  {
    title: String.fromCharCode(39),
    content: 'h',
    upperContent: 'H',
    width: 36
  },
  {
    title: '&',
    content: 'j',
    upperContent: 'J',
    width: 36
  },
  {
    title: '*',
    content: 'k',
    upperContent: 'K',
    width: 36
  },
  {
    title: '?',
    content: 'l',
    upperContent: 'L',
    width: 36
  },
  {
    title: String.fromCharCode(72),
    content: 'z',
    upperContent: 'Z',
    width: 36
  },
  {
    title: String.fromCharCode(73),
    content: 'x',
    upperContent: 'X',
    width: 36
  },
  {
    title: String.fromCharCode(175),
    content: 'c',
    upperContent: 'C',
    width: 36
  },
  {
    title: String.fromCharCode(95),
    content: 'v',
    upperContent: 'V',
    width: 36
  },
  {
    title: String.fromCharCode(58),
    content: 'b',
    upperContent: 'B',
    width: 36
  },
  {
    title: String.fromCharCode(59),
    content: 'n',
    upperContent: 'N',
    width: 36
  },
  {
    title: String.fromCharCode(47),
    content: 'm',
    upperContent: 'M',
    width: 36
  }
]


export let numberSourceListData: sourceListType[] = [
  {
    content: '1'
  },
  {
    content: '2'
  },
  {
    content: '3'
  },
  {
    content: '4'
  },
  {
    content: '5'
  },
  {
    content: '6'
  },
  {
    content: '7'
  },
  {
    content: '8'
  },
  {
    content: '9'
  },
  {
    content: '0'
  },
  {
    content: '@'
  },
  {
    content: '#'
  },
  {
    content: '$'
  },
  {
    content: '%'
  },
  {
    content: '&'
  },
  {
    content: '-'
  },
  {
    content: '+'
  },
  {
    content: '('
  },
  {
    content: ')'
  },
  {
    content: '/'
  },
  {
    content: '*'
  },
  {
    content: '"'
  },
  {
    content: "'"
  },
  {
    content: ':'
  },
  {
    content: ';'
  },
  {
    content: '!'
  },
  {
    content: '?'
  },

]

export let symbolSourceListData: sourceListType[] = [
  {
    content: '~'
  },
  {
    content: '`'
  },
  {
    content: '|'
  },
  {
    content: '\u2022'
  },
  {
    content: '\u221A'
  },
  {
    content: '\u03A0'
  },
  {
    content: '\u00F7'
  },
  {
    content: '\u00D7'
  },
  {
    content: String.fromCharCode(182)
  },
  {
    content: '\u2206'
  },
  {
    content: String.fromCharCode(163)
  },
  {
    content: '\u20ac'
  },
  {
    content: String.fromCharCode(165)
  },
  {
    content: String.fromCharCode(162)
  },
  {
    content: String.fromCharCode(94)
  },
  {
    content: '\u00B0'
  },
  {
    content: '='
  },
  {
    content: String.fromCharCode(123)
  },
  {
    content: String.fromCharCode(125)
  },
  {
    content: String.fromCharCode(44)
  },
  {
    content: String.fromCharCode(92)
  },
  {
    content: String.fromCharCode(169)
  },
  {
    content: String.fromCharCode(174)
  },
  {
    content: '\u2122'
  },
  {
    content: '\u2105'
  },
  {
    content: '['
  },
  {
    content: ']'
  },
]

export let emotion_emojis: string[] = [
  "🤐", "🤨", "😐", "😑", "😶", "🫥", "😶‍🌫️", "😏", "😒", "🙄", "😬", "😮‍💨",
  "🤥", "😌", "😔", "😪", "🤤", "😴", "😷", "🤒", "🤕", "🤢", "🤮", "🤧", "🥵",
  "🥶", "🥴", "😵", "😵‍💫", "🤯", "🤠", "🥳", "🥸", "😎", "🤓", "🧐", "😕",
  "🫤", "😟", "🙁", "☹️", "😮", "😯", "😲", "😳", "🥺", "🥹", "😦", "😧",
  "😨", "😰", "😥", "😢", "😭", "😱", "😖", "😣", "😞", "😓", "😩", "😫",
  "🥱", "😤", "😡", "😠", "🤬", "😈", "👿", "💀", "☠️", "💩", "🤡", "👹",
  "👺", "👻", "👽", "👾", "🤖", "😺", "😸", "😹", "😻", "😼", "😽", "🙀",
  "😿", "😾", "🙈", "🙉", "🙊", "💋", "💌", "💘", "💝", "💖", "💗", "💓",
  "💞", "💕", "💟", "❣️", "💔", "❤️‍🔥", "❤️‍🩹", "❤️", "🧡", "💛", "💚",
  "💙", "💜", "🤎", "🖤", "🤍", "💯", "💢", "💥", "💫", "💦", "💨", "🕳️",
  "💣", "💬", "👁️‍🗨️", "🗨️", "🗯️", "💭", "💤"
];

let handEmojis = [
  "👋", "👋🏻", "👋🏼", "👋🏽", "👋🏾", "👋🏿",
  "🤚", "🤚🏻", "🤚🏼", "🤚🏽", "🤚🏾", "🤚🏿",
  "🖐️", "🖐🏻", "🖐🏼", "🖐🏽", "🖐🏾", "🖐🏿",
  "✋", "✋🏻", "✋🏼", "✋🏽", "✋🏾", "✋🏿",
  "🖖", "🖖🏻", "🖖🏼", "🖖🏽", "🖖🏾", "🖖🏿",
  "🫱", "🫱🏻", "🫱🏼", "🫱🏽", "🫱🏾", "🫱🏿",
  "🫲", "🫲🏻", "🫲🏼", "🫲🏽", "🫲🏾", "🫲🏿",
  "🫳", "🫳🏻", "🫳🏼", "🫳🏽", "🫳🏾", "🫳🏿",
  "🫴", "🫴🏻", "🫴🏼", "🫴🏽", "🫴🏾", "🫴🏿",
  "🤌", "🤌🏻", "🤌🏼", "🤌🏽", "🤌🏾", "🤌🏿",
  "🤏", "🤏🏻", "🤏🏼", "🤏🏽", "🤏🏾", "🤏🏿",
  "✌️", "✌🏻", "✌🏼", "✌🏽", "✌🏾", "✌🏿",
  "🤞", "🤞🏻", "🤞🏼", "🤞🏽", "🤞🏾", "🤞🏿",
  "🫰", "🫰🏻", "🫰🏼", "🫰🏽", "🫰🏾", "🫰🏿",
  "🤟", "🤟🏻", "🤟🏼", "🤟🏽", "🤟🏾", "🤟🏿",
  "🤘", "🤘🏻", "🤘🏼", "🤘🏽", "🤘🏾", "🤘🏿",
  "🤙", "🤙🏻", "🤙🏼", "🤙🏽", "🤙🏾", "🤙🏿",
  "👈", "👈🏻", "👈🏼", "👈🏽", "👈🏾", "👈🏿",
  "👉", "👉🏻", "👉🏼", "👉🏽", "👉🏾", "👉🏿",
  "👆", "👆🏻", "👆🏼", "👆🏽", "👆🏾", "👆🏿",
  "🖕", "🖕🏻", "🖕🏼", "🖕🏽", "🖕🏾", "🖕🏿",
  "👇", "👇🏻", "👇🏼", "👇🏽", "👇🏾", "👇🏿",
  "☝️", "☝🏻", "☝🏼", "☝🏽", "☝🏾", "☝🏿",
  "🫵", "🫵🏻", "🫵🏼", "🫵🏽", "🫵🏾", "🫵🏿",
  "👍", "👍🏻", "👍🏼", "👍🏽", "👍🏾", "👍🏿",
  "👎", "👎🏻", "👎🏼", "👎🏽", "👎🏾", "👎🏿"
];
let animalEmojis = [
  "🐵", "🐒", "🦍", "🦧", "🐶", "🐕", "🦮", "🐕‍🦺", "🐩", "🐺", "🦊", "🦝", "🐱", "🐈", "🐈‍⬛",
  "🦁", "🐯", "🐅", "🐆", "🐴", "🐎", "🦄", "🦓", "🦌", "🦬", "🐮", "🐂", "🐃", "🐄", "🐷", "🐖",
  "🐗", "🐽", "🐏", "🐑", "🐐", "🐪", "🐫", "🦙", "🦒", "🐘", "🦣", "🦏", "🦛", "🐭", "🐁", "🐀",
  "🐹", "🐰", "🐇", "🐿️", "🦫", "🦔", "🦇", "🐻", "🐻‍❄️", "🐨", "🐼", "🦥", "🦦", "🦨", "🦘",
  "🦡", "🐾", "🦃", "🐔", "🐓", "🐣", "🐤", "🐥", "🐦", "🐧", "🕊️", "🦅", "🦆", "🦢", "🦉", "🦤",
  "🪶", "🦩", "🦚", "🦜", "🐸", "🐊", "🐢", "🦎", "🐍", "🐲", "🐉", "🦕", "🦖", "🐳", "🐋", "🐬",
  "🦭", "🐟", "🐠", "🐡", "🦈", "🐙", "🐚", "🪸", "🐌", "🦋", "🐛", "🐜", "🐝", "🪲", "🐞", "🦗",
  "🪳", "🕷️", "🕸️", "🦂", "🦟", "🪰", "🪱", "🦠", "💐", "🌸", "💮", "🪷", "🏵️", "🌹", "🥀",
  "🌺", "🌻", "🌼", "🌷", "🌱", "🪴", "🌲", "🌳", "🌴", "🌵", "🌾", "🌿", "☘️", "🍀", "🍁", "🍂",
  "🍃", "🪹", "🪺"
];
let fruitAndFoodEmojis = [
  "🍇", "🍈", "🍉", "🍊", "🍋", "🍌", "🍍", "🥭", "🍎", "🍏", "🍐", "🍑", "🍒", "🍓", "🫐", "🥝", "🍅", "🫒",
  "🥥", "🥑", "🍆", "🥔", "🥕", "🌽", "🌶️", "🫑", "🥒", "🥬", "🥦", "🧄", "🧅", "🍄", "🥜", "🫘", "🌰", "🍞",
  "🥐", "🥖", "🫓", "🥨", "🥯", "🥞", "🧇", "🧀", "🍖", "🍗", "🥩", "🥓", "🍔", "🍟", "🍕", "🌭", "🥪", "🌮",
  "🌯", "🫔", "🥙", "🧆", "🥚", "🍳", "🥘", "🍲", "🫕", "🥣", "🥗", "🍿", "🧈", "🧂", "🥫", "🍱", "🍘", "🍙",
  "🍚", "🍛", "🍜", "🍝", "🍠", "🍢", "🍣", "🍤", "🍥", "🥮", "🍡", "🥟", "🥠", "🥡", "🦀", "🦞", "🦐", "🦑",
  "🦪", "🍦", "🍧", "🍨", "🍩", "🍪", "🎂", "🍰", "🧁", "🥧", "🍫", "🍬", "🍭", "🍮", "🍯", "🍼", "🥛", "☕",
  "🫖", "🍵", "🍶", "🍾", "🍷", "🍸", "🍹", "🍺", "🍻", "🥂", "🥃", "🫗", "🥤", "🧋", "🧃", "🧉", "🧊", "🥢",
  "🍽️", "🍴", "🥄", "🔪", "🫙", "🏺"
];
let placeAndTransportEmojis = [
  "🌍", "🌎", "🌏", "🌐", "🗺️", "🗾", "🧭", "🏔️", "⛰️", "🌋", "🗻", "🏕️", "🏖️", "🏜️", "🏝️", "🏞️",
  "🏟️", "🏛️", "🏗️", "🧱", "🪨", "🪵", "🛖", "🏘️", "🏚️", "🏠", "🏡", "🏢", "🏣", "🏤", "🏥", "🏦", "🏨",
  "🏩", "🏪", "🏫", "🏬", "🏭", "🏯", "🏰", "💒", "🗼", "🗽", "⛪", "🕌", "🛕", "🕍", "⛩️", "🕋", "⛲",
  "⛺", "🌁", "🌃", "🏙️", "🌄", "🌅", "🌆", "🌇", "🌉", "♨️", "🎠", "🛝", "🎡", "🎢", "💈", "🎪", "🚂",
  "🚃", "🚄", "🚅", "🚆", "🚇", "🚈", "🚉", "🚊", "🚝", "🚞", "🚋", "🚌", "🚍", "🚎", "🚐", "🚑", "🚒",
  "🚓", "🚔", "🚕", "🚖", "🚗", "🚘", "🚙", "🛻", "🚚", "🚛", "🚜", "🏎️", "🏍️", "🛵", "🦽", "🦼", "🛺",
  "🚲", "🛴", "🛹", "🛼", "🚏", "🛣️", "🛤️", "🛢️", "⛽", "🛞", "🚨", "🚥", "🚦", "🛑", "🚧", "⚓", "🛟",
  "⛵", "🛶", "🚤", "🛳️", "⛴️", "🛥️", "🚢", "✈️", "🛩️", "🛫", "🛬", "🪂", "💺", "🚁", "🚟", "🚠",
  "🚡", "🛰️", "🚀", "🛸", "🛎️", "🧳", "⌛", "⏳", "⌚", "⏰", "⏱️", "⏲️", "🕰️", "🕛", "🕧", "🕐",
  "🕜", "🕑", "🕝", "🕒", "🕞", "🕓", "🕟", "🕔", "🕠", "🕕", "🕡", "🕖", "🕢", "🕗", "🕣", "🕘", "🕤",
  "🕙", "🕥", "🕚", "🕦", "🌑", "🌒", "🌓", "🌔", "🌕", "🌖", "🌗", "🌘", "🌙", "🌚", "🌛", "🌜", "🌡️",
  "☀️", "🌝", "🌞", "🪐", "⭐", "🌟", "🌠", "🌌", "☁️", "⛅", "⛈️", "🌤️", "🌥️", "🌦️", "🌧️", "🌨️",
  "🌩️", "🌪️", "🌫️", "🌬️", "🌀", "🌈", "🌂", "☂️", "☔", "⛱️", "⚡", "❄️", "☃️", "⛄", "☄️", "🔥",
  "💧", "🌊"
];
let celebrationAndGameEmojis = [
  "🎃", "🎄", "🎆", "🎇", "🧨", "✨", "🎈", "🎉", "🎊", "🎋", "🎍", "🎎", "🎏", "🎐", "🎑", "🧧", "🎀", "🎁",
  "🎗️", "🎟️", "🎫", "🎖️", "🏆", "🏅", "🥇", "🥈", "🥉", "⚽", "⚾", "🥎", "🏀", "🏐", "🏈", "🏉", "🎾",
  "🥏", "🎳", "🏏", "🏑", "🏒", "🥍", "🏓", "🏸", "🥊", "🥋", "🥅", "⛳", "⛸️", "🎣", "🤿", "🎽", "🎿",
  "🛷", "🥌", "🎯", "🪀", "🪁", "🎱", "🔮", "🪄", "🧿", "🪬", "🎮", "🕹️", "🎰", "🎲", "🧩", "🧸", "🪅",
  "🪩", "🪆", "♠️", "♥️", "♦️", "♣️", "♟️", "🃏", "🀄", "🎴", "🎭", "🖼️", "🎨", "🧵", "🪡", "🧶", "🪢"
];


export const emotionList: sourceListType[] = emotion_emojis.map<sourceListType>(emoji => ({ content: emoji }));
export const handList: sourceListType[] = handEmojis.map<sourceListType>(handEmoji => ({ content: handEmoji }));
export const animalList:sourceListType[] = animalEmojis.map<sourceListType>(animalEmoji => ({ content: animalEmoji }));
export const foodList:sourceListType[] = fruitAndFoodEmojis.map<sourceListType>(foodEmoji => ({ content: foodEmoji }));
export const placeAndTransportList = placeAndTransportEmojis.map<sourceListType>(emoji => ({ content: emoji }));
export const celebrationAndGameList = celebrationAndGameEmojis.map<sourceListType>(emoji => ({ content: emoji }));



export const combinedList: sourceListType[][] = [];
combinedList.push(handList);
combinedList.push(emotionList);
combinedList.push(animalList);
combinedList.push(foodList);
combinedList.push(placeAndTransportList);
combinedList.push(celebrationAndGameList);

export const clipBoardList = [
  "123", "456", "789"
]

