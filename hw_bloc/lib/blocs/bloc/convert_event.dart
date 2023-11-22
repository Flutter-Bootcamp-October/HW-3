part of 'convert_bloc.dart';

abstract class ConvertEvent {}

class AddEvent extends ConvertEvent {
  final String? price;
  final String? from;
  final String? to;

  AddEvent(this.from, this.to, {
    this.price,
  });
}
