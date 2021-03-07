class User
{
  String name;
  String dob;
  double bal;
  String dp;
  User(String name,String dob,String dp,double bal)
  {
    this.name = name;
    this.dob = dob;
    this.bal = bal;
    this.dp = dp;
  }
  Map<String,dynamic> tomap()
  {
    return {
      "name":name,
      "dob":dob,
      "bal":bal,
      "dp":dp
    };
  }
}