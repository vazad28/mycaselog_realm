import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, top: 30, bottom: 10),
          height: 50,
          width: 60,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  backgroundColor: WidgetStateProperty.all<Color>(
                      const Color.fromARGB(255, 57, 56, 78))),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.arrow_back_ios_new_outlined)),
        ),
        const Expanded(child: SizedBox()),
        Container(
          margin: const EdgeInsets.only(right: 20, top: 30, bottom: 10),
          height: 50,
          width: 70,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  backgroundColor: WidgetStateProperty.all<Color>(
                      const Color.fromARGB(255, 57, 56, 78))),
              onPressed: onPressed,
              child: const Text('Save')),
        ),
      ],
    );
  }
}
