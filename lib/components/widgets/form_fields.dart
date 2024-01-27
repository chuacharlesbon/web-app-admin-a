import 'package:captiveportal/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyFormField extends StatelessWidget {
  const MyFormField({
    super.key,
    this.onChanged,
    this.onFieldSubmitted,
    this.keyboardType,
    this.inputFormatters,
    this.hintText,
  });

  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;

//   @override
//   State<MyFormField> createState() => _MyFormFieldState();
// }

// class _MyFormFieldState extends State<MyFormField> {

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: keyboardType ?? TextInputType.text,
      inputFormatters: inputFormatters,
      style: MyTheme.textbody14(),
      decoration: MyTheme.formFieldStyleA(
        hintText: hintText
      )
    );
  }
}