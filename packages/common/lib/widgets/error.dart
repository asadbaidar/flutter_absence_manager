import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:locale/locale.dart';

class CustomError extends StatelessWidget {
  const CustomError({
    super.key,
    this.message,
    this.emptyMessage,
    this.isFailure = false,
    this.alignment = CrossAxisAlignment.center,
    this.action,
    this.onRetry,
  });

  final String? message;
  final String? emptyMessage;
  final bool isFailure;
  final CrossAxisAlignment alignment;
  final Widget? action;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment == CrossAxisAlignment.end
          ? AlignmentDirectional.centerEnd
          : alignment == CrossAxisAlignment.start
              ? AlignmentDirectional.centerStart
              : Alignment.center,
      child: Column(
        crossAxisAlignment: alignment,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isFailure
                ? message ?? ''
                : emptyMessage ?? LocaleStrings.emptyMessage(),
            style: context.bodyMedium
                ?.withColor(context.onSurfaceVariant.withOpacity(0.6)),
            textAlign: alignment == CrossAxisAlignment.end
                ? TextAlign.end
                : alignment == CrossAxisAlignment.start
                    ? TextAlign.start
                    : TextAlign.center,
          ),
          if (onRetry != null && isFailure)
            CustomOutlinedButton(
              onPressed: onRetry,
              borderColor: context.primary,
              text: LocaleStrings.retry,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              margin: const EdgeInsets.only(top: 16),
            ),
          if (action != null && !isFailure)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: action,
            ),
        ],
      ),
    );
  }
}

class DataError<T> extends StatelessWidget {
  const DataError({
    super.key,
    required this.data,
    this.emptyMessage,
    this.onRetry,
  });

  final Data<T> data;
  final String? emptyMessage;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) => CustomError(
        isFailure: data.isFailure,
        message: data.errorMessage,
        emptyMessage: emptyMessage,
        onRetry: onRetry,
      );
}

class PageError<T> extends StatelessWidget {
  const PageError({
    super.key,
    required this.data,
    this.onRetry,
  });

  final Data<T> data;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) => CustomError(
        isFailure: data.isPageFailure,
        message: data.errorMessage,
        onRetry: onRetry,
        alignment: context.isPhoneOrTablet
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.end,
      ).paddingSymmetric(vertical: 8, horizontal: 16);
}
