import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BimirLockTextField extends StatelessWidget {
  final Function(String)? onValueChange;
  final bool autoFocus;
  final BorderRadius? radius;

  final String? hint;
  final int? maxline;
  final String? initial;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  final Color? border;
  final bool readOnly;
  final bool obscure;
  final Function()? onTap;
  final Function(String)? onSubmit;
  final TextStyle? textStyle;
  final FocusNode? focusNode;
  final String? label;
  final bool enabled;
  final bool hasCopy;

  const BimirLockTextField({
    Key? key,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.onValueChange,
    this.controller,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.done,
    this.textInputType = TextInputType.name,
    this.border,
    this.readOnly = false,
    this.onTap,
    this.initial,
    this.obscure = false,
    this.onSubmit,
    this.autoFocus = false,
    this.maxline,
    this.radius,
    this.textStyle,
    this.focusNode,
    this.label,
    this.enabled = true,
    this.hasCopy = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return TextFormField(
      enabled: enabled,
      focusNode: focusNode,
      autocorrect: false,
      autofocus: autoFocus,
      onFieldSubmitted: onSubmit,
      obscureText: obscure,
      onTap: (onTap != null) ? onTap! : null,
      readOnly: readOnly,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      maxLines: (maxline != null) ? maxline : 1,
      initialValue: initial,
      validator: (validator != null) ? validator : null,
      controller: (controller != null) ? controller : null,
      onChanged: (text) {
        if (onValueChange != null) {
          onValueChange!(text);
        }
      },
      decoration: InputDecoration(
        prefixIcon: (prefixIcon != null) ? prefixIcon : null,
        suffixIcon: (suffixIcon != null) ? suffixIcon : null,
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: (radius != null) ? radius! : const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
              width: 1, color: (border == null) ? theme.colorScheme.onPrimaryContainer : border!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: (radius != null) ? radius! : const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
              width: 1, color: (border == null) ? theme.colorScheme.onPrimaryContainer : border!),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: (radius != null) ? radius! : const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(width: 1, color: theme.colorScheme.error),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: (radius != null) ? radius! : const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
              width: 1, color: (border == null) ? theme.colorScheme.onPrimaryContainer : border!),
        ),
        hintText: hint ?? "",
        hintStyle: textStyle,
        labelText: label,
        suffix: hasCopy
            ? InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () => Clipboard.setData(
                    ClipboardData(text: controller != null ? controller!.text : "")),
                child: const Icon(
                  Icons.copy,
                ),
              )
            // IconButton(
            //     padding: EdgeInsets.all(0),
            //     icon: const Icon(Icons.copy),
            //     onPressed: () => Clipboard.setData(
            //         ClipboardData(text: controller != null ? controller!.text : "")),
            //   )
            : null,
      ),
      style: textStyle,
    );
  }
}
