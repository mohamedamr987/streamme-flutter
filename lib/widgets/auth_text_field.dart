import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

class AuthTextField extends StatefulWidget {
  final TextInputType keyboardType;
  final bool isPassword;
  final TextEditingController textController;
  final String labelText;
  final Widget? labelWidget;
  final String? Function(String?)? validation;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final int? maxLines;
  final int? minLines;
  final TextAlign textAlign;
  final FloatingLabelBehavior floatingLabelBehavior;
  final bool autoFocus;
  final FocusNode? focusNode;
  final Widget? prefix;
  final Widget? suffix;
  final bool isEnable;
  final bool isValidationWorking;
  final List<TextInputFormatter>? inputFormatters;
  const AuthTextField({Key? key, this.autoFocus = false,required this.keyboardType, this.minLines,this.textAlign = TextAlign.start, this.onChanged,this.isPassword =false, this.labelWidget, required this.textController, required this.labelText, this.validation,  this.onFieldSubmitted, this.maxLines, this.focusNode, this.floatingLabelBehavior = FloatingLabelBehavior.never, this.prefix, this.suffix, this.isEnable = true, this.isValidationWorking = true, this.inputFormatters}) : super(key: key);

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool isPassword = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isPassword = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: kFontColor),
      focusNode: widget.focusNode,
      autofocus: widget.autoFocus,
      textAlign: widget.textAlign,
      onChanged: widget.onChanged,
      maxLines: widget.maxLines ?? 1,
      minLines: widget.minLines ?? 1,
      enabled: widget.isEnable,
      onFieldSubmitted: widget.onFieldSubmitted,
      keyboardType: widget.keyboardType,
      obscureText: isPassword,
      controller: widget.textController,
      inputFormatters: widget.inputFormatters,
      validator: (String? text) {
        if(!widget.isValidationWorking) return null;
        if (widget.isEnable && text! == '') {
          return "Please enter ${widget.labelText}";
        }
        if (widget.validation != null) {
          return widget.validation!(text);
        }
        return null;
      },
      decoration: InputDecoration(
        floatingLabelBehavior: widget.floatingLabelBehavior,
        fillColor: const Color(0xFFF9F8FC),
        filled: true,
        suffixIcon: widget.isPassword
            ? IconButton(
                splashRadius: 7,
                onPressed: () {
                  setState(
                    () {
                      isPassword = !isPassword;
                    },
                  );
                },
                icon: Icon(
                  !isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: kIconColor,
                ),
              )
            : widget.suffix,
        label: widget.labelWidget,
        prefixIcon: widget.prefix,

        labelText: widget.labelWidget == null ? widget.labelText : null,
        labelStyle: TextStyle(
          fontSize: 12,
          color: widget.isEnable ? kFontSecondaryColor : kFontColor,
        ),
        errorStyle: const TextStyle(color: Colors.red,),
        enabledBorder: getBorderStyle( Colors.transparent, 1),
        disabledBorder: getBorderStyle( const Color(0xFFE9E9E9), 1),
        focusedBorder: getBorderStyle(const Color(0xFFE0DFE4), 2),
        errorBorder: getBorderStyle(const Color(0xFF8A1539), 1),
        focusedErrorBorder: getBorderStyle(Colors.red.shade900, 2),
      ),
    );
  }
}
