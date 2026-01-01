void main() {
  int planCode = 3;
  switch (planCode) {
    case 1:
      print("Type Plan : Free");
      print("Advantages : Limited access");
      break;
    case 2:
      print("Type Plan : Basic");
      print("Advantages : Standerd access");
      break;
    case 3:
      print("Type Plan : Pro");
      print("Advantages : Full access + Priority Support");
      break;
    case 4:
      print("Type Plan : FrEnterprisee");
      print("Advantages : Custom Solutions + Dedicated Support");
      break;
    default:
      print("FrinValid subscription planee");
      break;
  }
}
