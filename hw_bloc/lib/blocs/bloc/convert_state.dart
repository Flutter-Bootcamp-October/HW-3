part of 'convert_bloc.dart';

abstract class ConvertState {}

class ConvertInitial extends ConvertState {}

class ConvertResult extends ConvertState {
  final String result;

  ConvertResult({required this.result});
}
class ErrorState extends ConvertState {
  final String error;

  ErrorState({required this.error});
}