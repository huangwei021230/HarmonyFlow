export enum OperatorType{
  backSpace = 1,
  character = 2,
  number = 3,
}


export class Operator{
  
  type: OperatorType;
  text: string;

  constructor(type: OperatorType, text: string) {
    this.type = type;
    this.text = text;
  }
}