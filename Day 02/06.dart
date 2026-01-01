void main() {
  List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  nums.forEach((x) {
    if (x % 2 == 0) {
      print("$x is even");
    } else {
      print("$x is odd");
    }
  });
}
