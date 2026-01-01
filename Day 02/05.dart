void main() {
  List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int size = nums.length;
  for (int i = 0; i < size; i++) {
    if (nums[i] % 2 == 0) {
      print("${nums[i]} is even");
    } else {
      print("${nums[i]} is odd");
    }
  }
}
