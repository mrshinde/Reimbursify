class ItemClass {
  String note;
  String date;
  String sign;
  double amount;
  ItemClass(String note, String date, String sign, double amount) {
    this.note = note;
    this.amount = amount;
    this.date = date;
    this.sign = sign;
  }
  Map<String,dynamic> tomap()
  {
    return {
      "note":note,
      "date":date,
      "sign":sign,
      "amount":amount
    };
  }
}