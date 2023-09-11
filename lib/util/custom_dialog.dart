import 'package:flutter/material.dart';

void showCustomDialog(BuildContext context, String titleText, String contentText) {
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(7.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                color: const Color.fromARGB(255, 68, 50, 37),
                child: Text(
                  titleText,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 15,
                  ),
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            border: Border.all(
              color: const Color.fromARGB(255, 68, 50, 37),
              width: 7.0,
            ),
            color: const Color.fromARGB(255, 184, 149, 149),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                contentText,
                style: const TextStyle(
                  fontFamily: 'Medieval',
                  fontWeight: FontWeight.bold,
                  wordSpacing: 2,
                  color: Color.fromARGB(255, 68, 50, 37),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Voltar',
                  style: TextStyle(
                    color: Color.fromARGB(255, 68, 50, 37),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}