import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/helper/build_error_bar.dart';
import 'package:fruit_hub_dashboard/features/addProduct/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/features/addProduct/presentation/views/widgets/add_product_view_body.dart';
import 'package:fruit_hub_dashboard/generated/l10n.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddProductViewBodyBlocBuilder extends StatelessWidget {
  const AddProductViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(S.current.add_product_success),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is AddProductFailure) {
          return BuildErrorBar(context, state.errMessage, Colors.red);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddProductLoading ? true : false,
          child: AddProductViewBody(),
        );
      },
    );
  }
}
