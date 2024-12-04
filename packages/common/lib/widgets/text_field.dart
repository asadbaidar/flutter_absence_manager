import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:locale/locale.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.label,
    this.value,
    this.readOnly = true,
  });

  final String? label;
  final dynamic value;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final value = this.value?.toString();
    if (readOnly && value?.notBlank == null) {
      return const SizedBox.shrink();
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: label,
              hintText: readOnly ? null : LocaleStrings.enterHere,
              border: const UnderlineInputBorder(borderSide: BorderSide.none),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            initialValue: value?.toString(),
            readOnly: readOnly,
            style: context.bodyLarge,
            minLines: 1,
            maxLines: 5,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
