import "package:dartz/dartz.dart";
import "package:decimal/decimal.dart";
import "package:stack_my_money_app/src/businesslogic/entities/transaction.dart";
import "package:stack_my_money_app/src/core/error/failure.dart";

abstract class TransactionRepository {
  Future<Either<Failure, TransactionEntity>> createTransaction(
      String id, String type, String category, String name, Decimal amount, String currency);
// Future<List<Transaction>> updateTransaction(String id);
// Future<List<Transaction>> getMostRecentTransactions(String id);
}
