import 'package:flutter/material.dart';
import 'package:mytime/widgets/theme.dart';

class MyInputField extends StatelessWidget {
  final String hint;
  final String title;
  // final TextEditingController controller;
  final Widget? widget;
  const MyInputField(
      {super.key,
      required this.title,
      required this.hint,
      // required this.controller,
      this.widget
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Container(
            height: 52,
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.only(left: 14, right: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0
              ),
            borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: widget==null?false:true,
                    autofocus: false,
                    // controller: controller,
                    // cursorColor: ,
                    style: subTitleStyle,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: subTitleStyle,
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0
                        )
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0
                        )
                      ),
                    ),
                  )
                ),
                widget==null?Container():Container(child: widget)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
