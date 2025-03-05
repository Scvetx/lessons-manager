/* Custom Widget - a list of courses component
*/

import 'package:flutter/material.dart';

import '../../../../core/getit/injection.dart';
import '../../../../core/ui/app_styles/app_style.dart';
import '../../../../core/ui/widgets/buttons/edit_button_cmp.dart';
import '../../../../core/ui/widgets/list/list_cmp.dart';
import '../../../users/profile/data/repository/user_repo.dart';
import '../../domain/models/course.dart';
import '../../domain/models/state/courses_list_wrap.dart';

class CoursesListCmp extends StatelessWidget {
  const CoursesListCmp({
    super.key,
    required this.listWrap,
    required this.onTap,
    required this.onEditTap,
  });
  final CoursesListWrap listWrap;
  final Function(Course course) onTap;
  final Function(Course course) onEditTap;

  @override
  Widget build(BuildContext context) => ListCmp(
      rows: [
        for (final course in listWrap.records)
          InkWell(
            onTap: () => onTap(course),
            child: Row(
              children: [
                Expanded(
                  child: Flex(
                    direction: Axis.horizontal, 
                    children: [
                      Flexible(
                        child: Text(
                          course.dbData.name,
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
                    onPressed: () => onEditTap(course),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
