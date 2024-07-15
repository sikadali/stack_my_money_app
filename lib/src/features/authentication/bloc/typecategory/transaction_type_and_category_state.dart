part of 'transaction_type_and_category_bloc.dart';

sealed class TransactionTypeAndCategoryState {
  const TransactionTypeAndCategoryState();
}

final class TransactionTypeIsExpenses extends TransactionTypeAndCategoryState {}
final class TransactionTypeIsIncomes extends TransactionTypeAndCategoryState {}

