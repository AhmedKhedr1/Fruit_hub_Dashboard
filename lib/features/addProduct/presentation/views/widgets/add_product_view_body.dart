import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/widgets/Custom_Button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_field.dart';
import 'package:fruit_hub_dashboard/features/addProduct/presentation/views/widgets/image_field.dart';
import 'package:fruit_hub_dashboard/features/addProduct/presentation/views/widgets/is_featured_check_box.dart';
import 'package:fruit_hub_dashboard/features/addProduct/domain/entities/add_product_input_entitiy.dart';
import 'package:fruit_hub_dashboard/features/addProduct/presentation/views/widgets/is_organic_check_box.dart';
import 'package:fruit_hub_dashboard/generated/l10n.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String name, code, description;
  late num price, expiryMonth, numberOfCalories, unitAmount;
  File? image;
  bool isFeatured = false;

  bool isOrganic = false;

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
                onSaved: (value) {
                  name = value!;
                },
                validatormessage: S.current.field_required,
              ),
              SizedBox(height: 8),
              CustomTextField(
                keyboardType: TextInputType.number,
                hint: S.current.product_price,
                maxLines: 1,
                onSaved: (value) {
                  price = num.parse(value!);
                },
                validatormessage: S.current.field_required,
              ),
              SizedBox(height: 8),
              CustomTextField(
                keyboardType: TextInputType.number,
                hint: S.current.product_code,
                maxLines: 1,
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
                validatormessage: S.current.field_required,
              ),
              SizedBox(height: 8),
              CustomTextField(
                keyboardType: TextInputType.text,
                hint: S.current.expiry_date_hint,
                maxLines: 1,
                onSaved: (value) {
                  expiryMonth = num.parse(value!);
                },
                validatormessage: S.current.field_required,
              ),
              SizedBox(height: 8),
              CustomTextField(
                keyboardType: TextInputType.text,
                hint: S.current.calories_hint,
                maxLines: 1,
                onSaved: (value) {
                  numberOfCalories = num.parse(value!);
                },
                validatormessage: S.current.field_required,
              ),
              SizedBox(height: 8),
              CustomTextField(
                keyboardType: TextInputType.text,
                hint: S.current.amount_hint,
                maxLines: 1,
                onSaved: (value) {
                  unitAmount = num.parse(value!);
                },
                validatormessage: S.current.field_required,
              ),
              SizedBox(height: 8),
              CustomTextField(
                keyboardType: TextInputType.text,
                hint: S.current.product_description,
                maxLines: 5,
                onSaved: (value) {
                  description = value!;
                },
                validatormessage: S.current.field_required,
              ),
              SizedBox(height: 8),
              IsFeaturedIcheckBox(
                onChanged: (value) {
                  isFeatured = value;
                },
              ),
              SizedBox(height: 8),
              IsOganicCheckBox(
                onChanged: (value) {
                  isOrganic = value;
                },
              ),
              SizedBox(height: 8),
              ImageField(
                onFileChanged: (value) {
                  image = value;
                },
              ),
              SizedBox(height: 24),
              CustomButton(
                title: S.current.add_product,
                onpressed: () {
                  if (image != null) {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      AddProductInputEntitiy input = AddProductInputEntitiy(
                        name: name,
                        code: code,
                        description: description,
                        price: price,
                        image: image!,
                        isFeatured: isFeatured,
                        expirationMonths: expiryMonth.toInt(),
                        numOfCalories: numberOfCalories.toInt(),
                        unitAmount: unitAmount.toInt(),
                        isOrganic: isOrganic, revews: [],
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    shoeError(context);
                  }
                },
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

void shoeError(BuildContext context) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(S.current.please_select_image)));
}
