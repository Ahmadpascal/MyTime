import 'package:flutter/material.dart';
import 'package:mytime/widgets/theme.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  const MyButton({super.key,
    required this.label,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 8),
      width: 125,
      height: 60,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: primaryClr),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
    // return GestureDetector(
    //   onTap: onTap,
    //   child: Container(
    //     width: 100,
    //     height: 60,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(20),
    //       color: primaryClr
    //     ),
    //     child: Text(
    //       label,
    //       style: const TextStyle(
    //         color: Colors.white
    //       ),
    //     ),
    //   ),
    // );
  }
}