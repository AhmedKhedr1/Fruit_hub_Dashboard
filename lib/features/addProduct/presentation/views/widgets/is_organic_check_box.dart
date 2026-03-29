import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/Text_Styless.dart';
import 'package:fruit_hub_dashboard/features/addProduct/presentation/views/widgets/custom_check_box.dart';
import 'package:fruit_hub_dashboard/generated/l10n.dart';

class IsOganicCheckBox extends StatefulWidget {
  const IsOganicCheckBox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<IsOganicCheckBox> createState() => _IsOganicCheckBoxState();
}

class _IsOganicCheckBoxState extends State<IsOganicCheckBox> {
  bool isOrganic = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width - (16 * 2) - 48,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: S.current.is_organic_hint,
                  style: TextStyless.semiBold16.copyWith(
                    color: Color(0xff616A6B),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 18),
        Customcheckbox(
          isChecked: isOrganic,
          onTap: () {
            setState(() {
              isOrganic = !isOrganic;
              widget.onChanged(isOrganic);
            });
          },
        ),
      ],
    );
  }
}
