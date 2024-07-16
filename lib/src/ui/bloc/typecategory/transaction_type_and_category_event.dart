part of 'transaction_type_and_category_bloc.dart';

sealed class TransactionTypeAndCategoryEvent extends Equatable{
  const TransactionTypeAndCategoryEvent();
  @override
  List<Object> get props => [];
}

final class ChangeTransactionTypeToExpenses extends TransactionTypeAndCategoryEvent {}
final class ChangeTransactionTypeToIncomes extends TransactionTypeAndCategoryEvent {}
