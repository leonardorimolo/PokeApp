import 'package:flutter/material.dart';

class ShowDialogError extends StatelessWidget {
  final String message;
  const ShowDialogError({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Image.asset('assets/images/pokeball_splash.png', height: 24, width: 24),
          const SizedBox(width: 10),
          const Text('Error', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent)),
        ],
      ),
      content: Text(message, style: const TextStyle(color: Colors.black87)),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.redAccent,
          ),
          child: const Text('OK'),
        ),
      ],
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(color: Colors.red, width: 2)
      ),
    );
  }
}
