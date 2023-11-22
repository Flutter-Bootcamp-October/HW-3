abstract class ConverterState {
  final String result;

  ConverterState({required this.result});
}

final class ConvertState extends ConverterState {
  ConvertState({required super.result});
}

final class ErrorState extends ConverterState {
  ErrorState({required super.result});
}
