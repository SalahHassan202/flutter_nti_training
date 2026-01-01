void main() {
  List<String> op = ["+", "-", "*", "/"];

  for (var x in op) {
    cal(a: 10, b: 20, oper: x);
  }
}

void cal({required int a, required int b, required String oper}) {
  if (oper == "+") {
    print(a + b);
  } else if (oper == "-") {
    print(a - b);
  } else if (oper == "*") {
    print(a * b);
  } else if (oper == "/") {
    print(a ~/ b);
  }
}
