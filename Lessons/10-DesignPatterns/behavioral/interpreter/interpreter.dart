// TODO: review and possibly rewrite 

class Context {
  final Map<String, bool> _mapping = {};

  bool lookup(String name) {
    if (!_mapping.containsKey(name)) {
      throw Exception("Variable '$name' not assigned in context.");
    }
    return _mapping[name]!;
  }

  void assign(VariableExp variable, bool value) {
    _mapping[variable.name] = value;
  }
}

abstract class BooleanExp {
  bool evaluate(Context context);
  BooleanExp replace(String name, BooleanExp exp);
  BooleanExp copy();
}

class Constant extends BooleanExp {
  final bool _value;

  Constant(this._value);

  @override
  bool evaluate(Context context) {
    return _value;
  }

  @override
  BooleanExp replace(String name, BooleanExp exp) {
    return copy();
  }

  @override
  BooleanExp copy() {
    return Constant(_value);
  }
}

class VariableExp extends BooleanExp {
  final String name;

  VariableExp(this.name);

  @override
  bool evaluate(Context context) {
    print("VariableExp: $name");
    return context.lookup(name);
  }

  @override
  BooleanExp replace(String name, BooleanExp exp) {
    if (this.name == name) {
      return exp.copy();
    } else {
      return copy();
    }
  }

  @override
  BooleanExp copy() {
    return VariableExp(name);
  }
}

class AndExp extends BooleanExp {
  final BooleanExp _operand1;
  final BooleanExp _operand2;

  AndExp(this._operand1, this._operand2);

  @override
  bool evaluate(Context context) {
    return _operand1.evaluate(context) && _operand2.evaluate(context);
  }

  @override
  BooleanExp replace(String name, BooleanExp exp) {
    return AndExp(
      _operand1.replace(name, exp),
      _operand2.replace(name, exp),
    );
  }

  @override
  BooleanExp copy() {
    return AndExp(_operand1.copy(), _operand2.copy());
  }
}

class OrExp extends BooleanExp {
  final BooleanExp _operand1;
  final BooleanExp _operand2;

  OrExp(this._operand1, this._operand2);

  @override
  bool evaluate(Context context) {
    return _operand1.evaluate(context) || _operand2.evaluate(context);
  }

  @override
  BooleanExp replace(String name, BooleanExp exp) {
    return OrExp(
      _operand1.replace(name, exp),
      _operand2.replace(name, exp),
    );
  }

  @override
  BooleanExp copy() {
    return OrExp(_operand1.copy(), _operand2.copy());
  }
}

class NotExp extends BooleanExp {
  final BooleanExp _operand;

  NotExp(this._operand);

  @override
  bool evaluate(Context context) {
    return !_operand.evaluate(context);
  }

  @override
  BooleanExp replace(String name, BooleanExp exp) {
    return NotExp(_operand.replace(name, exp));
  }

  @override
  BooleanExp copy() {
    return NotExp(_operand.copy());
  }
}

void main() {
  final x = VariableExp("X");
  final y = VariableExp("Y");

  final context = Context();

  context.assign(x, false);
  context.assign(y, true);

  final BooleanExp expression = OrExp(
    AndExp(Constant(true), x),
    AndExp(y, NotExp(x)),
  );



  final bool result = expression.evaluate(context);
  print("Result with X=false, Y=true: $result");

  final z = VariableExp("Z");
  context.assign(z, true);
  
  final notZ = NotExp(z);

  final BooleanExp replacement = expression.replace("Y", notZ);


  final bool replacementResult = replacement.evaluate(context);

  print(
      "Result after replacing Y with (not Z) where Z=true: $replacementResult");
}