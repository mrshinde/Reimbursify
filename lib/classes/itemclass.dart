class ItemClass {
  String title;
  String sdate;
  String edate;
  double amount;
  int fav;
  int id;

  ItemClass(
      {int id,
      String title,
      String sdate,
      String edate,
      double amount,
      int fav}) {
    this.id = id;
    this.title = title;
    this.amount = amount;
    this.sdate = sdate;
    this.edate = edate;
    this.fav = fav;
  }

  Map<String, dynamic> tomap() {
    return {
      "note": title,
      "sdate": sdate,
      "edate": edate,
      "amount": amount,
      "fav": fav
    };
  }

  factory ItemClass.fromJson(Map<String, dynamic> json) {
    return ItemClass(
      title: json['title'] as String,
      sdate: json['sdate'] as String,
      edate: json['edate'] as String,
      amount: json['amount'] as double,
      fav: json['fav'] as int,
    );
  }
}
