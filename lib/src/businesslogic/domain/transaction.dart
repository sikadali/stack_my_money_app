import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final String type;
  final String category;
  final String name;
  final Decimal amount;
  final String currency;

  const Transaction(
      {required this.type,
      required this.category,
      required this.name,
      required this.amount,
      required this.currency});

  @override
  // TODO: implement props
  List<Object?> get props => [type, category, name, amount, currency];
}
