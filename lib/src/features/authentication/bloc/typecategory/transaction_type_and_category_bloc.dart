import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:stack_my_money_app/src/constants/icons.dart';
import 'package:stack_my_money_app/src/constants/text_strings.dart';

part 'transaction_type_and_category_event.dart';

part 'transaction_type_and_category_state.dart';

class TransactionTypeAndCategoryBloc
    extends Bloc<TransactionTypeAndCategoryEvent, TransactionTypeAndCategoryState> {

  TransactionTypeAndCategoryBloc()
      : super(TransactionTypeIsExpenses(_getDropdownItemsForTransactionCategoryForExpenses())) {

    on<ChangeTransactionTypeToIncomes>((event, emit) {
      emit(TransactionTypeIsIncomes(_getDropdownItemsForTransactionCategoryForIncomes()));
    });
    on<ChangeTransactionTypeToExpenses>((event, emit) {
      emit(TransactionTypeIsExpenses(_getDropdownItemsForTransactionCategoryForExpenses()));
    });
  }

  static List<Couple<IconData, String>> _getDropdownItemsForTransactionCategoryForExpenses() {
    return <Couple<IconData, String>>[
      Couple(sShoppingIcon, sShoppingText),
      Couple(sRentIcon, sRentText),
      Couple(sRestaurantIcon, sRestaurantText),
      Couple(sTransportIcon, sTransportText)
    ];
  }

  static List<Couple<IconData, String>> _getDropdownItemsForTransactionCategoryForIncomes() {
    return <Couple<IconData, String>>[
      Couple(sSalaryIcon, sSalaryText),
      Couple(sPassiveIncomesIcon, sPassiveIncomesText),
      Couple(sThirdPartyIncomesIcon, sThirdPartyIncomesText),
    ];
  }
}

class Couple<A, B> {
  final A icon;
  final B text;

  Couple(this.icon, this.text);
}
