import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/Text_Styless.dart';
import 'package:fruit_hub_dashboard/features/addProduct/presentation/views/widgets/add_product_view_body.dart';
import 'package:fruit_hub_dashboard/generated/l10n.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.current.add_product, style: TextStyless.bold23),
      ),
      body: AddProductViewBody(),
    );
  }
}
