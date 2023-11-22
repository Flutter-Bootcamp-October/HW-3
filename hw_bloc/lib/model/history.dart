List<History> listHistory = [];

class History {
  final double? price;
  final String from;
  final String to;
  final double? result;

  History(
      {required this.result,
      required this.price,
      required this.from,
      required this.to});
}
