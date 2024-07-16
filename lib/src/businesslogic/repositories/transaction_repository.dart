import 'package:stack_my_money_app/src/businesslogic/domain/transaction.dart';

abstract class TransactionRepository {
  Future<Either<Transaction, Failure>> createTransaction(String id);
  // Future<List<Transaction>> updateTransaction(String id);
  // Future<List<Transaction>> getMostRecentTransactions(String id);
}