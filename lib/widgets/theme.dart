import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFff4667);
const primaryClr = bluishClr;

TextStyle get subHeadingStyle{
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.grey
    )
  );
}

TextStyle get headingStyle{
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold
    )
  );
}

TextStyle get titleStyle{
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black
    )
  );
}

TextStyle get subTitleStyle{
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black
    )
  );
}


