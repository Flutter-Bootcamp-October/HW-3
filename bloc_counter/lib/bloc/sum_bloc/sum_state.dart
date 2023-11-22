abstract class SumState{}

class ResultState extends SumState{
  final num total;
  ResultState(this.total);
}

class InitialState extends SumState{
  final String placeHolder;
  InitialState(this.placeHolder);
}

class ErrorState extends SumState{
  final String error;
  ErrorState(this.error);
}
class EmptyState extends SumState{
  final String msg = 'Enter numbers';
}