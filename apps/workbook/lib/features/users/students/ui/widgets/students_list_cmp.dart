/* Custom Widget - a list of students component
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/ui/app_styles/app_style.dart';
import '../../../../../core/ui/app_styles/object_view_style.dart';
import '../../../../../core/ui/widgets/buttons/edit_button_cmp.dart';
import '../../../../../core/ui/widgets/list/list_cmp.dart';
import '../../../../../core/ui/widgets/text/text_in_circle_cmp.dart';
import '../../domain/models/state/students_list_wrap.dart';
import '../../domain/models/student.dart';

class StudentsListCmp extends ConsumerWidget {
  const StudentsListCmp({
     super.key,
    required this.listWrap,
    required this.onTap,
    required this.onEditTap,
  });
  final StudentsListWrap listWrap;
  final Function(Student student) onTap;
  final Function(Student student) onEditTap; 

  @override
  Widget build(BuildContext context, WidgetRef ref) => ListCmp(
    rows: [
      for (final student in listWrap.records)
        InkWell(
          onTap: () => onTap(student),
          child: Row(
            children: [
              SizedBox(
                width: ovFirstColumnWidth,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextInCircleCmp(
                    text: student.dbData.languageLevel,
                  ),
                ),
              ),
              Expanded(
                child: Flex(
                  direction: Axis.horizontal, 
                  children: [
                    Flexible(
                      child: Text(student.dbData.name,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.start,
                        style: mBlackText,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: EditButtonCmp(
                  onPressed: () => onEditTap(student),
                ),
              ),
            ],
          ),
        ),
    ],
  );
}
