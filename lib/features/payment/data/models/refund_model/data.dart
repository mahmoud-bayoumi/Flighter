class Data {
  String? paymentintentId;
  String? amount;

  Data({this.paymentintentId, this.amount});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        paymentintentId: json['paymentintentId'] as String?,
        amount: json['amount'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'paymentintentId': paymentintentId,
        'amount': amount,
      };
}
