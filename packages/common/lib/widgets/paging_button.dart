import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:locale/locale.dart';

class PagingButton extends StatelessWidget {
  const PagingButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: CustomOutlinedButton(
          text: LocaleStrings.showMore,
          onPressed: onPressed,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
      );
}
