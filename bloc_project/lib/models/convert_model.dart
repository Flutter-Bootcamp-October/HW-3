class ConvertModel {
  String? from;
  String? to;
  double? toAmount;
  double? fromAmount;

  ConvertModel({this.from, this.to, this.toAmount, this.fromAmount});

  ConvertModel.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    toAmount = json['toAmount'];
    fromAmount = json['fromAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from'] = from;
    data['to'] = to;
    data['toAmount'] = toAmount;
    data['fromAmount'] = fromAmount;
    return data;
  }
}
