/* Custom Widget - a listRow used in ListCmp custom widget
*/

import 'package:flutter/material.dart';

class ListRowCmp extends StatelessWidget {
  const ListRowCmp({super.key, required this.row});
  final Widget row;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 45, 
    width: MediaQuery.of(context).size.width, 
    child: row,
  );
}
