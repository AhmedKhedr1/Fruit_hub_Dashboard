import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/widgets/Custom_Button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_field.dart';
import 'package:fruit_hub_dashboard/features/addProduct/presentation/views/widgets/image_field.dart';
import 'package:fruit_hub_dashboard/features/addProduct/presentation/views/widgets/is_featured_icheck_box.dart';
import 'package:fruit_hub_dashboard/generated/l10n.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomTextField(
                keyboardType: TextInputType.text,
                hint: S.current.product_name,
                maxLines: 1,
              ),
              SizedBox(height: 8),
              CustomTextField(
                keyboardType: TextInputType.number,
                hint: S.current.product_price,
                maxLines: 1,
              ),
              SizedBox(height: 8),
              CustomTextField(
                keyboardType: TextInputType.number,
                hint: S.current.product_code,
                maxLines: 1,
              ),
              SizedBox(height: 8),
              CustomTextField(
                keyboardType: TextInputType.text,
                hint: S.current.product_description,
                maxLines: 5,
              ),
              SizedBox(height: 8),
              IsFeaturedIcheckBox(onChanged: (value) {}),
              SizedBox(height: 8),
              ImageField(onFileChanged: (image) {}),
              SizedBox(height: 48),
              CustomButton(title: S.current.add_product, onpressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
