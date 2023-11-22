abstract class SumState {}

class InitialState extends SumState {}

class ResultState extends SumState {
  final num result;
  final String BMI;
  ResultState({required this.BMI, required this.result});
}

class ErrorState extends SumState {}

class EmptyState extends SumState {}
