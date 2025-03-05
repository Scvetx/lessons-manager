/* Custom Widget - a list of lessons component
*/

import 'package:flutter/material.dart';

import '../../../../core/getit/injection.dart';
import '../../../../core/ui/app_styles/app_style.dart';
import '../../../../core/ui/app_styles/object_view_style.dart';
import '../../../../core/ui/widgets/buttons/edit_button_cmp.dart';
import '../../../../core/ui/widgets/list/list_cmp.dart';
import '../../../../core/ui/widgets/text/text_in_circle_cmp.dart';
import '../../../users/profile/data/repository/user_repo.dart';
import '../../domain/models/lesson.dart';
import '../../domain/models/state/lessons_list_wrap.dart';

class LessonsListCmp extends StatelessWidget {
  const LessonsListCmp({
    super.key,
    required this.listWrap,
    required this.onTap,
    required this.onEditTap,
  });
  final LessonsListWrap listWrap;
  final Function(Lesson lesson) onTap;
  final Function(Lesson lesson) onEditTap;  

  @override
  Widget build(BuildContext context) => ListCmp(rows: [
    for (final lesson in listWrap.records)
      InkWell(
        onTap: () => onTap(lesson),
        child: Row(
          children: [
            SizedBox(
              width: ovFirstColumnWidth,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextInCircleCmp(text: lesson.dbData.languageLevel),
              ),
            ),
            Expanded(
              child: Flex(
                direction: Axis.horizontal, 
                children: [
                  Flexible(
                    child: Text(lesson.dbData.name,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.start,
                      style: mBlackText,
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: getIt<UserRepository>().isTeacher ?? false,
              child: EditButtonCmp(
                onPressed: () => onEditTap(lesson),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
