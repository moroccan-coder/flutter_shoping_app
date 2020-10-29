 class BasePayment{

  String paymentID;
  String amount;
  DateTime paymentDate;
  String paymentMethod;

  BasePayment(
      this.paymentID, this.amount, this.paymentDate, this.paymentMethod);


  BasePayment.fromJson(Map<String,dynamic> jsonObject)
  {
    this.paymentID = jsonObject['payment_id'];
    this.amount = jsonObject['amount'];
    this.paymentDate = jsonObject['payment_date'];
    this.paymentMethod = jsonObject['payment_method'];
  }
}