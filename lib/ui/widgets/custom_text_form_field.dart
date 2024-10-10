import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:notes_app/constants.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({super.key, required this.hint, this.maxLines = 1,this.onSaved,this.onChanged});

  final String hint;
  final int maxLines;
  void Function(String?)? onSaved;
   void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if(value?.isEmpty ?? true){
return "field is required";
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          8,
        ),
        borderSide: BorderSide(
          color: color ?? Colors.white,
        ));
  }
}
