import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_copy/utils/colors.dart';

class CustomTextField extends StatefulWidget {
  String? label;
  String? hintText;
  Icon? prefixIcon;
  TextEditingController txtCtrl;
  bool? obscureText;
  IconButton? suffixButton;
  bool? IsCenter; //true is center -- false is start align
  bool? IsNum;
  bool? calculator;
  double height;
  double width;

  CustomTextField({
    this.label = "",
    required this.txtCtrl,
    this.prefixIcon,
    this.suffixButton,
    this.hintText,
    this.obscureText,
    required this.height,
    required this.width,
    this.IsCenter = false,
    this.IsNum = false,
    Key? key,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    // size provide us total height and width of our screen
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * widget.width, // use 0.8
      height: size.height * widget.height, //use 0.08
      child: TextField(
        autocorrect: false,
        maxLines: 1,
        controller: widget.txtCtrl,
        style: const TextStyle(color: textColor),
        textAlign: widget.IsCenter != false ? TextAlign.center : TextAlign.start,
        obscureText: widget.obscureText == true ? true : false,
        obscuringCharacter: '*',
        inputFormatters: widget.IsNum == true ? [FilteringTextInputFormatter.allow(RegExp('[0-9.]'))] : null,
        keyboardType: widget.IsNum == true
            ? const TextInputType.numberWithOptions(
                decimal: true,
              )
            : TextInputType.text,

        //decoration
        decoration: InputDecoration(
          filled: false,
          fillColor: bgColor,
          contentPadding: EdgeInsets.symmetric(vertical: size.height * 0.03),
          label: Center(
            widthFactor: 1.4,
            child: Text(
              widget.label == null ? "" : widget.label.toString(),
              style: const TextStyle(
                color: textColor,
              ),
            ),
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 55, minHeight: 60),
          suffixIcon: widget.suffixButton,
          prefixIcon: widget.prefixIcon,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: textColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          floatingLabelStyle: TextStyle(color: primaryColor),

          //with animation when clicked
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: borderColor),
            borderRadius: BorderRadius.circular(20.0),
          ),

          //no animation
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: borderColor),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
