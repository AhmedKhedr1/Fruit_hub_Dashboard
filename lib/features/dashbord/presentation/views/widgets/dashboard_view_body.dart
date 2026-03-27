import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/App_colors.dart';
import 'package:fruit_hub_dashboard/core/utils/Text_Styless.dart';
import 'package:fruit_hub_dashboard/core/utils/app_router.dart';
import 'package:fruit_hub_dashboard/core/widgets/Custom_Button.dart';
import 'package:fruit_hub_dashboard/features/dashbord/presentation/views/widgets/language_button.dart';
import 'package:fruit_hub_dashboard/generated/l10n.dart';
import 'package:go_router/go_router.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 62),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(alignment: Alignment.topLeft, child: LanguageButton()),
          Spacer(),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              Icons.inventory_2_outlined,
              color: AppColors.primaryColor,
              size: 60,
            ),
          ),
          SizedBox(height: 20),
          Text(S.current.product_management_title, style: TextStyless.bold23),
          SizedBox(height: 10),
          Text(
            S.current.product_management_subtitle,
            style: TextStyless.regular16,
          ),

          SizedBox(height: 24),
          CustomButton(
            title: S.current.add_product,
            onpressed: () {
              GoRouter.of(context).push(AppRouter.KAddProductView);
            },
          ),
          SizedBox(height: 222),
        ],
      ),
    );
  }
}
