import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class MyModal {
  static void genericOnFuncModal({
    required BuildContext ctx,
  }) {
    showDialog(
      context: ctx,
      builder: (BuildContext _) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              surfaceTintColor: Colors.transparent,
              shadowColor: Colors.transparent,
              backgroundColor: Colors.white,
              insetPadding: const EdgeInsets.all(12),
              actionsAlignment: MainAxisAlignment.center,
              content: Container(
                color: Colors.transparent,
                constraints: const BoxConstraints(maxWidth: 300),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Login successful!",
                      style: TextStyle(
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              actions: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(_, true);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.deepPurple),
                      child: Center(
                          child: Text(
                        "Ok",
                        style: TextStyle(
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      )),
                    )),
              ],
            );
          },
        );
      },
    );
  }
}