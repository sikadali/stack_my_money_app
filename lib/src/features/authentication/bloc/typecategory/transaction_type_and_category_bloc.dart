import 'package:bloc/bloc.dart';

part 'transaction_type_and_category_event.dart';

part 'transaction_type_and_category_state.dart';

class TransactionTypeAndCategoryBloc
    extends Bloc<TransactionTypeAndCategoryEvent, TransactionTypeAndCategoryState> {
  TransactionTypeAndCategoryBloc() : super(TransactionTypeIsExpenses()) {
    on<ChangeTransactionTypeToIncomes>((event, emit) {
      emit(TransactionTypeIsIncomes());
    });
    on<ChangeTransactionTypeToExpenses>((event, emit) {
      emit(TransactionTypeIsExpenses());
    });
  }
}
