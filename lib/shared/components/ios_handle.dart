import 'package:flutter/material.dart';

class IosHandle extends StatelessWidget {
  const IosHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          width: 48,
          height: 5,
          decoration: ShapeDecoration(
              color: const Color(0xffCDCFD0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))),
    ]);
  }
}
