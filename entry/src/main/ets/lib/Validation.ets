
import { Composable, remember } from 'compose-react';
import { stringRes } from './compose'; // assuming you have a corresponding module for stringRes and curlyFormat
import { CurlyArg } from './kotlin'; // assuming you have a corresponding module for CurlyArg

export abstract class ValidationResult {
  static resultValid(hint?: string | number, ...args: CurlyArg[]): ValidationResult {
    if (typeof hint === 'number') {
      return new Valid({ hintMessageId: hint, args });
    } else if (typeof hint === 'string') {
      return new Valid({ hintMessageStr: hint, args });
    } else {
      return new Valid();
    }
  }

  static resultInvalid(error: string | number, ...args: CurlyArg[]): ValidationResult {
    if (typeof error === 'number') {
      return new Invalid({ errorMessageId: error, args });
    } else if (typeof error === 'string') {
      return new Invalid({ errorMessageStr: error, args });
    } else {
      return new Invalid();
    }
  }

  abstract isValid(): boolean;
  abstract isInvalid(): boolean;
}

export class Valid extends ValidationResult {
  constructor(private props: { hintMessageId?: number; hintMessageStr?: string; args?: CurlyArg[] }) {
    super();
  }

  hasHintMessage(): boolean {
    return !!this.props.hintMessageId || !!this.props.hintMessageStr;
  }

  @Composable
  hintMessage(): string {
    const { hintMessageId, hintMessageStr, args } = this.props;
    return hintMessageId ? stringRes(hintMessageId).curlyFormat(args) : hintMessageStr ?? '';
  }

  isValid(): boolean {
    return true;
  }

  isInvalid(): boolean {
    return false;
  }
}

export class Invalid extends ValidationResult {
  constructor(private props: { errorMessageId?: number; errorMessageStr?: string; args?: CurlyArg[] }) {
    super();
  }

  hasErrorMessage(): boolean {
    return !!this.props.errorMessageId || !!this.props.errorMessageStr;
  }

  @Composable
  errorMessage(): string {
    const { errorMessageId, errorMessageStr, args } = this.props;
    return errorMessageId ? stringRes(errorMessageId).curlyFormat(args) : errorMessageStr ?? '';
  }

  isValid(): boolean {
    return false;
  }

  isInvalid(): boolean {
    return true;
  }
}

@Composable
function rememberValidationResult<T extends any>(rule: ValidationRule<T>, value: T): ValidationResult {
  return remember(value, () => rule.validator(value));
}

export class ValidationRule<T extends any> {
  constructor(public klass: any, public propertyName: string, public validator: (value: T) => ValidationResult) {}
}

export class ValidationRuleBuilder<T extends any> {
  forKlass?: any;
  forProperty?: string;
  private validator?: (value: T) => ValidationResult;

  validator(validator: (value: T) => ValidationResult) {
    this.validator = validator;
  }

  build() {
    if (!this.forKlass || !this.forProperty || !this.validator) {
      throw new Error('Incomplete validation rule definition');
    }
    return new ValidationRule<T>(this.forKlass, this.forProperty, this.validator);
  }
}

export function ValidationRule<T extends any>(scope: (builder: ValidationRuleBuilder<T>) => void): ValidationRule<T> {
  const builder = new ValidationRuleBuilder<T>();
  scope(builder);
  return builder.build();
}

function validate<T extends any>(rule: ValidationRule<T>, value: T): ValidationResult {
  return rule.validator(value);
}
