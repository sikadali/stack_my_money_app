import 'package:dartz/dartz.dart';
import 'package:decimal/decimal.dart';
import 'package:stack_my_money_app/src/businesslogic/entities/transaction.dart';
import 'package:stack_my_money_app/src/businesslogic/repositories/transaction_repository.dart';
import 'package:stack_my_money_app/src/core/error/failure.dart';

class CreateTransactionUseCase {
  final TransactionRepository transactionRepository;

  CreateTransactionUseCase(this.transactionRepository);

  Future<Either<Failure, TransactionEntity>> execute(
      String id, String type, String category, String name, Decimal amount, String currency) {
    return transactionRepository.createTransaction(id, type, category, name, amount, currency);
  }
}
