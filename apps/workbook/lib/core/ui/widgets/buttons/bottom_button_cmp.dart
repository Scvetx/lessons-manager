/* Custom Widget - a button used in the bottom of the screen
*/

import 'package:flutter/material.dart';
import '../../app_styles/app_style.dart';

class BottomButtonCmp extends StatefulWidget {
  const BottomButtonCmp({
    super.key, 
    required this.title,
    this.color = defaultButtonColor,
    required this.onPressed,
  });
  final String title;
  final Color color;
  final Function? onPressed;

  @override
  State<BottomButtonCmp> createState() => _BottomButtonCmpState();
}

class _BottomButtonCmpState extends State<BottomButtonCmp> {
  bool _isLocked = false;

  void _onPressed () {
    if(_isLocked) return;
    if(widget.onPressed == null) return;
    _isLocked = true;
    _runCallBack();
    
  }
  Future<void> _runCallBack () async {
    await widget.onPressed!();
    _isLocked = false;
  }

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Material(
        elevation: 5,
        color: widget.color.withValues(alpha: 0.5),
        child: OutlinedButton(
          onPressed: _onPressed,
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(200, 42),
            side: const BorderSide(color: Colors.transparent),
            shape: const RoundedRectangleBorder(),
          ),
          child: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
}
