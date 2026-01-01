void main() {
  List<int> numbers = [5, 2, 8, 2, 1, 7];
  print(numbers.length);
  print(numbers.isEmpty);
  print(numbers.isNotEmpty);
  print(numbers.first);
  print(numbers.last);
  numbers.add(5);
  print(numbers);
  numbers.addAll([15, 20]);
  print(numbers);
  numbers.insert(1, 0);
  print(numbers);
  numbers.remove(2);
  print(numbers);
  numbers.removeAt(2);
  print(numbers);
  numbers.removeLast();
  print(numbers);
  numbers.removeRange(1, 3);
  print(numbers);
  numbers.clear();
  print(numbers);
  print("***************************");
  numbers.addAll([5, 2, 8, 2, 1, 7]);
  print(numbers);
  numbers.contains(8);
  numbers.sort();
  print(numbers);
  numbers.join("-");
  print(numbers);

  numbers.forEach((x) {
    print(x);
  });

  Set<int> ss = numbers.toSet();
  print(ss);

  List<int> ex = numbers.expand((x) => [x, x]).toList();
  print(ex);
}
