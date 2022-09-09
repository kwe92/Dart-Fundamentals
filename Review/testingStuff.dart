void main() {
  var str = '4+5*2-2/3*4/';

  print(str[str.length - 1]);

  print(str.replaceFirst('/', '@'));

  print('sub string: ${str.substring(0, str.length - 1) + '9999'}');

  if (str.isNotEmpty && str[str.length - 1] == '/' ||
      str[str.length - 1] == 'x' ||
      str[str.length - 1] == '+' ||
      str[str.length - 1] == '-') {
    print('print2: ${str.substring(0, str.length - 1) + '+'}');
  } else {
    print('Not an operator');
  }
}
