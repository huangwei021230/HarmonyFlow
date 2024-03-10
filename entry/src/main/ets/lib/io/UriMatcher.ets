import List from '@ohos.util.List';
import ArrayList from '@ohos.util.ArrayList';
import uri from '@ohos.uri';

export class UriMatcher{
  /**
   *  static variables
   */
  static NO_MATCH : number = -1;
  private static  EXACT : number = 0;
  private static  NUMBER : number = 1;
  private static  TEXT : number = 2;

  private mCode : number;
  private mWhich : number;
  private mText : string;
  private mChildren : List<UriMatcher>;


  constructor(code: number);
  constructor(which: number, text: string);

  constructor(arg1: number, arg2?: string) {
    if (arg2 !== undefined) {
      this.mCode = UriMatcher.NO_MATCH;
      this.mWhich = arg1;
      this.mChildren = new List<UriMatcher>();
      this.mText = arg2;
    } else {
      this.mCode = arg1;
      this.mWhich = -1;
      this.mChildren = new List<UriMatcher>();
      this.mText = "";
    }
  }

  static createChild(token: string): UriMatcher {
    switch (token) {
      case "#":
        return new UriMatcher(UriMatcher.NUMBER, "#");
      case "*":
        return new UriMatcher(UriMatcher.TEXT, "*");
      default:
        return new UriMatcher(UriMatcher.EXACT, token);
    }
  }

  addURI(authority: string, path: string, code: number){
    if(code < 0){
      console.log("code" + code + " is invalid: it must be positive")

    }
    let tokens: string[] = []
    if(path != null){
      let newPath = path;
      // Strip leading slash if present.
      if(path.length > 1 && path.charAt(0) == '/'){
        newPath = path.substring(1);
      }
      tokens = newPath.split("/");
    }

    let numTokens = tokens != null ? tokens.length : 0;
    let node: UriMatcher = this;

    for (let i = 0; i < numTokens; i++) {
      let token = i < 0 ? authority : tokens[i];
      let children = node.mChildren;
      let numChildren = children.length
      let child: UriMatcher
      let j: number
      for (j = 0; j < numChildren; j++) {
        child = children[j];
        if(token == child.mText){
          node = child
          break;
        }
      }
      if(j == numChildren){
        // Child not found, create it
        child = UriMatcher.createChild(token)
        node.mChildren.add(child)
        node = child
      }
    }

    node.mCode = code
  }

  match(uri: uri.URI){
    let pathSegments: List<string> = new List<string>();
    let pathArray = uri.path.split("/")
    for (let index = 0; index < pathArray.length; index++) {
      const element = pathArray[index];
      pathSegments.add(element)
    }
    let li = pathSegments.length
    let node: UriMatcher = this

    if(li == 0 && uri.authority == null){
      return this.mCode;
    }

    for (let i = 0; i < li; i++) {
      let u: string = i < 0 ? uri.authority : pathSegments.get(i)
      let list: List<UriMatcher> = node.mChildren
      if (list == null){
        break;
      }
      node = new UriMatcher(1)

      let lj: number = list.length
      for(let j = 0; j < lj; j++){
        let n: UriMatcher = list.get(j);
        which_switch:
        switch (n.mWhich) {
          case UriMatcher.EXACT:
            if(n.mText == u){
              node = n;
            }
            break;
          case UriMatcher.NUMBER:
            let lk: number = u.length
            for(let k = 0; k<lk; k++){
              let c = u.charAt(k);
              if(c < '0' || c > '9'){
                break which_switch;
              }
            }
            node = n;
            break;
          case UriMatcher.TEXT:
            node = n;
            break;
          default:
            break;
        }
      }
      if(node == null){
        return UriMatcher.NO_MATCH;
      }
    }
    return node.mCode;
  }


}