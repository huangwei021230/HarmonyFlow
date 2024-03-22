import { Operator, OperatorType } from './Operator';

class Stack<T> {
  private items: T[] = [];
  push(item: T): void {
    this.items.push(item);
  }
  pop(): T | undefined {
    return this.items.pop();
  }
  peek(): T | undefined {
    return this.items[this.items.length - 1];
  }
  isEmpty(): boolean {
    return this.items.length === 0;
  }
  size(): number {
    return this.items.length;
  }
}

export class OperatorCheck{
  private N: number = 10;
  private static instance: OperatorCheck;
  operatorStack: Stack<Operator>;
  private constructor() {
    this.operatorStack = new Stack<Operator>();
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
    if(this.isDigit(text)){
      OperatorCheck.getInstance().operatorStack.push(new Operator(OperatorType.number, text));
    }else if(this.isCharacter(text)){
      OperatorCheck.getInstance().operatorStack.push(new Operator(OperatorType.character, text));
    }
    this.stackCheck();
  }

  public pushBackSpace(){
    console.log("Operator: backSpace")
    OperatorCheck.getInstance().operatorStack.push(new Operator(OperatorType.backSpace, "backSpace"));
    this.stackCheck();
  }

  private stackCheck(){
    if(OperatorCheck.getInstance().operatorStack.size() > this.N){
      OperatorCheck.getInstance().operatorStack.pop();
    }
    if(this.operatorStack.peek().type == OperatorType.backSpace){

    }
  }

}