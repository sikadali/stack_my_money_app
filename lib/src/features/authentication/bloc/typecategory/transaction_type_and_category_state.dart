part of 'transaction_type_and_category_bloc.dart';

sealed class TransactionTypeAndCategoryState extends Equatable {
  final List<Couple> items;
  const TransactionTypeAndCategoryState(this.items);

  @override
  List<Object> get props => [items];
}

final class TransactionTypeIsExpenses extends TransactionTypeAndCategoryState {
  const TransactionTypeIsExpenses(super.items);
}

final class TransactionTypeIsIncomes extends TransactionTypeAndCategoryState {
  const TransactionTypeIsIncomes(super.items);
}
