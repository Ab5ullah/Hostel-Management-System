import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  final bool? autocorrect;
  final bool? inputFilled;
  final bool? obsecureText;
  final bool? inputSuggestion;
  final bool? readOnly;
  final InputBorder? border,
      focusedBorder,
      enabledBorder,
      errorBorder,
      disabledBorder;
  final int? maxLines, minLines, maxLength;
  final Color? inputFillColor;
  final Widget? prefixIcon, suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final TextInputType? inputKeyboardType;
  final TextInputAction? inputAction;
  final TextStyle? inputLabelStyle, inputHintStyle, inputTextStyle;
  final String? inputLabel, inputHint, initialValue;
  final TextCapitalization? inputCapitalization;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  const MyFormField(
      {super.key,
      this.autocorrect,
      this.inputFilled,
      this.obsecureText,
      this.inputSuggestion,
      this.readOnly,
      this.border,
      this.focusedBorder,
      this.enabledBorder,
      this.errorBorder,
      this.disabledBorder,
      this.maxLines,
      this.minLines,
      this.maxLength,
      this.inputFillColor,
      this.prefixIcon,
      this.suffixIcon,
      this.contentPadding,
      this.controller,
      this.inputKeyboardType,
      this.inputAction,
      this.inputLabelStyle,
      this.inputHintStyle,
      this.inputTextStyle,
      this.inputLabel,
      this.inputHint,
      this.initialValue,
      this.inputCapitalization,
      this.validator,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      readOnly: readOnly ?? false,
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      onChanged: onChanged,
      controller: controller,
      obscureText: obsecureText ?? false,
      validator: validator,
      autocorrect: autocorrect ?? false,
      enableSuggestions: inputSuggestion ?? false,
      keyboardType: inputKeyboardType,
      textInputAction: inputAction,
      textCapitalization: inputCapitalization ?? TextCapitalization.none,
      style: inputTextStyle,
      decoration: InputDecoration(
        labelText: inputLabel,
        labelStyle: inputLabelStyle,
        hintText: inputHint,
        hintStyle: inputHintStyle,
        filled: inputFilled,
        fillColor: inputFillColor,
        border: border,
        focusedBorder: focusedBorder,
        enabledBorder: enabledBorder,
        errorBorder: errorBorder,
        disabledBorder: disabledBorder,
        contentPadding: contentPadding,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
