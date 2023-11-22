import 'package:currency_converter/currency.dart';

class Exchage {
  Exchage(
      {required this.amount,
      required this.to,
      required this.from,
      required this.result});

  String? amount;
  Currency? to;
  Currency? from;
  num? result;

  Exchage.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    to = json['to'];
    from = json['from'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['amount'] = amount;
    data['to'] = to;
    data['from'] = from;
    data['result'] = result;

    return data;
  }
}
