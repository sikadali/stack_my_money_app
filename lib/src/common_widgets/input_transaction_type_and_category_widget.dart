import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_my_money_app/src/common_widgets/dropdown_menu.dart';
import 'package:stack_my_money_app/src/constants/colors.dart';
import 'package:stack_my_money_app/src/features/authentication/bloc/typecategory/transaction_type_and_category_bloc.dart';

import '../utils/theme/ui_data_utils.dart';

class InputTransactionTypeAndCategoryWidget extends StatelessWidget {
  const InputTransactionTypeAndCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SDropDownMenu(
              color: isDarkMode ? sSecondaryColor : sSecondaryColor2,
              items: UIDataUtils.getDropdownItemsForTransactionType()),
          BlocBuilder<TransactionTypeAndCategoryBloc, TransactionTypeAndCategoryState>(
            builder: (context, state) {
                return SDropDownMenu(
                    color: isDarkMode ? sPrimaryColor : sPrimaryColor2,
                    items: state.items);
            },
          ),
        ],
      ),
    );
  }
}
