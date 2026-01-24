
void main()
{
  
  Map<String, Map<String, int>> stu = 
  {
  'Ahmed': {'UI': 92,'API': 75,'OOP': 88,'Dart': 95,},
  'Fatma': {'UI': 88,'API': 95,'OOP': 90,'Dart': 88,},
  'Khaled': {'UI': 85,'API': 78,'OOP': 75,'Dart': 72,},
  'Nour': {'UI': 88,'API': 75,'OOP': 88,'Dart': 90,},
  };

  bool q1 = stu['Ahmed']!['OOP'] == stu['Nour']!['OOP'];
  print(q1);
  bool q2 = stu['Ahmed']!['Dart'] != stu['Fatma']!['Dart'];
  print(q2);
  bool q3 = stu['Ahmed']!['Dart']! > stu['Nour']!['Dart']!;
  print(q3);
  bool q4 = stu['Khaled']!['API']! < stu['Fatma']!['API']!;
  print(q4);
  bool q5 = stu['Fatma']!['OOP']! >= 90;
  print(q5);
  bool q6 = stu['Khaled']!['Dart']! <= 75;
  print(q6);
  bool q7 = stu['Ahmed']!['Dart']! > 90 && stu['Ahmed']!['UI']! > 90;
  print(q7);
  bool q8 = stu['Nour']!['Dart']! >= 90 || stu['Nour']!['API']! >= 90;
  print(q8);
  bool q9 = !(stu['Ahmed']!['API']! < 80);
  print(q9);

}

