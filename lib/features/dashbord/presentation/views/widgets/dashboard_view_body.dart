import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_router.dart';
import 'package:fruit_hub_dashboard/core/widgets/Custom_Button.dart';
import 'package:fruit_hub_dashboard/generated/l10n.dart';
import 'package:go_router/go_router.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            title: S.current.add_product,
            onpressed: () {
              GoRouter.of(context).push(AppRouter.KAddProductView);
            },
          ),
        ],
      ),
    );
  }
}
