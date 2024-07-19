import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  final String id;
  final String type;
  final String category;
  final String name;
  final Decimal amount;
  final String currency;

  const TransactionEntity(
      {required this.id,
      required this.type,
      required this.category,
      required this.name,
      required this.amount,
      required this.currency});

  @override
  List<Object?> get props => [type, category, name, amount, currency];
}
