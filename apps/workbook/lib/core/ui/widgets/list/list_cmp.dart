/* Custom Widget - a listview used to present records on the screen
*/

import 'package:flutter/material.dart';
import 'list_row_cmp.dart';

class ListCmp extends StatelessWidget {
  const ListCmp({super.key, required this.rows});
  final List<Widget> rows;

  @override
  Widget build(BuildContext context) => ListView.separated(
      itemCount: rows.length,
      itemBuilder: (BuildContext context, int i) => ListRowCmp(row: rows[i]),
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
}
