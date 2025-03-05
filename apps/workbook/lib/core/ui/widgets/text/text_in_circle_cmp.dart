/* Custom Widget - not clickable text in a circle
*/

import 'package:flutter/material.dart';

class TextInCircleCmp extends StatelessWidget {
  const TextInCircleCmp({
    super.key, required String text,
    this.frameColor = Colors.grey,
    this.textColor = Colors.grey,
  })
      : text = text == '' ? '?' : text;
      
  final String text;
  final Color frameColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) => DecoratedBox(
      decoration: BoxDecoration(
          border: Border.all(
            color: frameColor,
          ),
          shape: text.length < 3 ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: text.length < 3
              ? null
              : const BorderRadius.all(Radius.circular(50)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: SizedBox(
          height: text.length < 3 ? 16 : null,
          width: text.length < 3 ? 16 : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ],
            ),
        ),
      ),
    );
}
