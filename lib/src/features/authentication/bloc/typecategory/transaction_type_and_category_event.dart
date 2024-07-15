part of 'transaction_type_and_category_bloc.dart';

sealed class TransactionTypeAndCategoryEvent {
  const TransactionTypeAndCategoryEvent();
}

final class ChangeTransactionTypeToExpenses extends TransactionTypeAndCategoryEvent {}
final class ChangeTransactionTypeToIncomes extends TransactionTypeAndCategoryEvent {}
