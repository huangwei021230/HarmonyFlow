import { Operator, OperatorType } from './Operator';
import HashMap from '@ohos.util.HashMap';
import { keySourceListData, keySourceListType } from '../KeyboardKeyData';
import Deque from '@ohos.util.Deque';
import { Index } from '../../pages/Index';


export class OperatorCheck{
  private N: number = 10;
  private enlargeN: number = 3;
  private static instance: OperatorCheck;
  operatorQueue: Deque<Operator>; // 改为队列
  enlargeItemQueue: Deque<string>; // 放大字符的deque

  private constructor() {
    this.operatorQueue = new Deque<Operator>(); // 改为队列
    this.enlargeItemQueue = new Deque<string>();
  }
  public static getInstance(): OperatorCheck{
    if(!OperatorCheck.instance){
      OperatorCheck.instance = new OperatorCheck();
    }
    return OperatorCheck.instance;
  }
  private isDigit(character: string): boolean{
    return new RegExp('/^\d$/').test(character);
  }
  private isCharacter(character: string): boolean{
    return new RegExp('/^[a-zA-Z]$/').test(character);
  }

  public pushText(text: string){
    console.log("Operator: Text")
    // if (this.isDigit(text)) {
    //   OperatorCheck.getInstance().operatorQueue.enqueue(new Operator(OperatorType.number, text));
    // } else if (this.isCharacter(text)) {
    //   OperatorCheck.getInstance().operatorQueue.enqueue(new Operator(OperatorType.character, text));
    // } else {
    // }
    OperatorCheck.getInstance().operatorQueue.insertEnd(new Operator(OperatorType.character, text));
    this.queueCheck(); // 修改调用的方法名
  }

  public pushBackSpace(){
    console.log("Operator: backSpace")
    OperatorCheck.getInstance().operatorQueue.insertEnd(new Operator(OperatorType.backSpace, "backSpace"));
    this.queueCheck(); // 修改调用的方法名
  }

  private queueCheck() {
    if (OperatorCheck.getInstance().operatorQueue.length > this.N) {
      OperatorCheck.getInstance().operatorQueue.popFirst(); // 修改为出队操作
    }
    console.log("114514: " + OperatorCheck.getInstance().operatorQueue.getLast()?.text)

    if (OperatorCheck.getInstance().operatorQueue.getLast()?.type == OperatorType.backSpace) {
      console.log("queue check begin")
      let nowChar = this.getMostFrequentChar();
      // TODO: 传值给对应组件
      for (let index = 0; index < keySourceListData.length; index++) {
        if (keySourceListData[index].content == nowChar) {
          if(keySourceListData[index].width == 51) break;
          keySourceListData[index].width  = 51;
          this.enlargeItemQueue.insertEnd(keySourceListData[index].content);
          this.enlargeItemCheck();
          break;
        }
      }
    }
  }

  private enlargeItemCheck(){
    if(OperatorCheck.getInstance().enlargeItemQueue.length > this.enlargeN){
      OperatorCheck.getInstance().enlargeItemQueue.popFirst();
    }
    console.log("114514: " + OperatorCheck.getInstance().enlargeItemQueue.getLast());
  }

  private getMostFrequentChar(){
    let charCountMap: HashMap<string, number> = new HashMap();
    console.log("114514 size: " + this.operatorQueue.length);
    // 遍历 operatorStack，统计字符出现次数
    for (let index = 0; index < this.operatorQueue.length; index++) {
      if(this.operatorQueue[index].type != OperatorType.backSpace) {
        const element: Operator = this.operatorQueue[index];
        charCountMap.set(element.text, (charCountMap.get(element.text) || 0) + 1);
      }
    }
    let mostFrequentChar: string | undefined;
    let maxCount = 0;
    charCountMap.forEach((count?: number, character?: string) => {
      if (count != null && count > maxCount) {
        mostFrequentChar = character;
        maxCount = count;
      }
    });
    console.log("most frequent char: " + mostFrequentChar)
    return mostFrequentChar;
  }
}