void main() {
  int workingHours = 42;
  int mistakes = 3;
  if (workingHours >= 40 && mistakes <= 2) {
    print("Excellent ");
    print("Bonus = 1000 EG");
  } else if (workingHours >= 40 && (mistakes >= 3 || mistakes <= 5)) {
    print("Very Good ");
    print("Bonus = 500 EG");
  } else if (workingHours >= 30 && workingHours <= 39) {
    print("Good ");
    print("Bonus = 200 EG");
  } else // (workingHours < 30)
  {
    print("pour ");
    print("No Bonus Found");
  }
}
