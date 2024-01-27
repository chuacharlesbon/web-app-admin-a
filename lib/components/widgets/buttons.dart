import 'package:captiveportal/utils/theme.dart';
import 'package:flutter/material.dart';

class MyFilledButton extends StatelessWidget {
  const MyFilledButton({
    super.key,
    this.buttonText,
    this.onPressed,
    this.buttonStyle,
    this.textStyle,
    this.buttonChild,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  });

  final String? buttonText;
  final Function()? onPressed;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final Widget? buttonChild;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

//   @override
//   State<MyFilledButton> createState() => _MyFilledButtonState();
// }

// class _MyFilledButtonState extends State<MyFilledButton> {

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
    return FilledButton(
      style: buttonStyle ?? MyTheme.buttonStyleTypeA(),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        children: [
          if(buttonChild == null && buttonText != null)
          Expanded(
            child: Text(
              buttonText ?? "Click Here",
              style: textStyle ?? MyTheme.textbody16(),
              textAlign: TextAlign.center,
            ),
          ),
          if(buttonChild != null && buttonText == null)
          buttonChild ?? const SizedBox()
        ],
      )
    );
  }
}