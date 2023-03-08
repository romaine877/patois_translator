import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'text_widget.dart';

class FormFieldWidget extends StatefulWidget {
  const FormFieldWidget({
    this.hint,
    this.isObscured = false,
    this.controller,
    Key? key,
    this.validator,
    this.capitalization,
    this.formatter,
  }) : super(key: key);

  final String? hint;
  final bool isObscured;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextCapitalization? capitalization;
  final List<TextInputFormatter>? formatter;

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  late bool hideText;

  @override
  void initState() {
    hideText = widget.isObscured;
    super.initState();
  }

  void switchObscured() {
    setState(() {
      hideText = !hideText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        inputFormatters: widget.formatter,
        controller: widget.controller,
        obscureText: hideText,
        validator: widget.validator,
        textCapitalization: widget.capitalization ?? TextCapitalization.none,
        decoration: InputDecoration(
            suffixIcon: widget.isObscured == true
                ? GestureDetector(
                    onTap: switchObscured,
                    child: Align(
                      widthFactor: 1,
                      heightFactor: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: TextWidget(
                          hideText == true ? 'SHOW' : 'HIDE',
                          
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            hintText: widget.hint,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            )),
      ),
    );
  }
}
