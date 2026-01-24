void main() {
  Map<String, int> stu = {};

  stu['Ahmed'] = 85;
  stu['Sara'] = 92;
  stu['Ali'] = 40;
  stu['Mona'] = 78;

  stu['Sara'] = 50;

  if (stu.containsKey('Ali')) {
    print('hello ali');
  }

  stu.update('Ahmed', (val) => val + 5, ifAbsent: () => 0);

  stu['Khaled'] = 60;

  stu.forEach((name, score) {
    print("student : $name , score : $score");
  });
  stu.removeWhere(((name, score) => score < 50));
  print(stu);

  print("number of students : ${stu.length}");
}
