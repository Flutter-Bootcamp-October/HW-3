part of 'convert_bloc.dart';

abstract class ConvertState {}

final class ConvertInitialState extends ConvertState {}

class DropdownUpdatedState extends ConvertState {
  final String? selectedItem;

  DropdownUpdatedState(this.selectedItem);
}

final class ResultConvertState extends ConvertState {
  final num result;
  final String? resultStr1;
  final String? resultStr2;
  final num convertNum;
  ResultConvertState(
      this.result, this.resultStr1, this.resultStr2, this.convertNum);
}

class EmptyState extends ConvertState {}
