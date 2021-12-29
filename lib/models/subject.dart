class Subject{
  late String subId;
  late String subName;
  late int credit;
  bool checked = false;

    Subject(this.subId, this.subName, this.credit, this.checked);

    static List<Subject> getSubject(){
      return [
        Subject('0001', 'Mobile App', 3, false),
        Subject('0002', 'Web App', 3, false),
        Subject('0003', 'Arts', 2, false),
        Subject('0004', 'Thai', 2, false),
        Subject('0005', 'EnglishS', 1, false),
      ];
    }
}