// 定义枚举 IncognitoMode
export enum IncognitoMode {
  FORCE_OFF,
  FORCE_ON,
  DYNAMIC_ON_OFF
}

// 定义标签和描述信息的类型
export interface IncognitoModeLabel {
  label: string;
  description: string;
}

export class IncognitoModeLabelComponent{
  mode: IncognitoMode
  label: IncognitoModeLabel
  showDescriptionOnlyIfSelected: boolean
}



// 定义枚举对应的标签和描述信息
const IncognitoModeLabels: IncognitoModeLabelComponent[] = [
  {
    mode: IncognitoMode.FORCE_OFF,
    label: { label: "Force Off", description: "Always browse in normal mode." },
    showDescriptionOnlyIfSelected: true
  },
  {
    mode: IncognitoMode.FORCE_ON,
    label: { label: "Force On", description: "Always browse in incognito mode." },
    showDescriptionOnlyIfSelected: true
  },
  {
    mode: IncognitoMode.DYNAMIC_ON_OFF,
    label: { label: "Dynamic On/Off", description: "Toggle between normal and incognito mode based on settings." },
    showDescriptionOnlyIfSelected: true
  }
];




// // 输出枚举列表
// function listEntries() {
//   return IncognitoModeLabels.map(({ mode, label }) => ({
//     key: IncognitoMode[mode],
//     label: label.label,
//     description: label.description,
//     showDescriptionOnlyIfSelected: true
//   }));
// }
//
//
// // Usage:
// const entries = listEntries();
