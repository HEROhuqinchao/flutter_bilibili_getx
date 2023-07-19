class ExcelTitle {
  String title;
  ExcelTitleValueType valueType;

  ExcelTitle(this.title, this.valueType);
}

enum ExcelTitleValueType {
  text,
  number,
  time,
}