void mian() {
  Set<String> s1 = {"أحمد", "محمد", "سارة", "فاطمة", "علي", "نورة", "يوسف"};
  Set<String> s2 = {"محمد", "فاطمة", "خالد", "ليلى", "عمر", "يوسف"};
  Set<String> s3 = {"سارة", "خالد", "نورة", "زياد", "عمر"};

  Set<String> s4 = s1.intersection(s2);
  print(s4);
  Set<String> s5 = s1.intersection(s2).intersection(s3);
  print(s5);
  Set<String> s6 = s1.difference(s2).difference(s3);
  print(s6);

  Set<String> st = {};
  st.addAll(s1);
  st.addAll(s2);
  st.addAll(s3);
  print(st);

  bool add1 = s1.add("عبدالله");
  print("Done");

  bool add2 = s1.add("أحمد");
  print("Done");

  bool isMohamed = s2.contains("محمد");
  print(isMohamed);

  int cnt = 0;
  if (s1.contains("يوسف")) cnt++;
  if (s2.contains("يوسف")) cnt++;
  if (s3.contains("يوسف")) cnt++;

  print("counter is $cnt");
}
