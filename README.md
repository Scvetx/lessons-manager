# Lessons Manager

A mobile app for managing students and lessons.
This repository is created as an example of a flutter app developed by me.

There are 2 architecture approaches used in this project: BLoC and Stateful widgets.

## User Interfaces And State Management

### Riverpod
1) State management is based on Riverpod
2) Riverpod providers use UI wrappers to wrap state data.
    For example:
     > course_list_wrap.dart
     > course_form_wrap.dart

### Screens
1) lib > ui > screens > courses
                            > course_form_screen.dart
                            > course_view_screen.dart
                            > courses_screen.dart
2) lib > ui > screens > lessons
                            > lesson_form_screen.dart
                            > lesson_view_screen.dart
                            > lessons_screen.dart
3) lib > ui > screens > students
                            > student_form_screen.dart
                            > student_view_screen.dart
                            > students_screen.dart

- stateful widgets -
1) lib > ui > screens > auth
                            > login_screen.dart
                            > registration_screen.dart
2) lib > ui > screens > profile
                            > profile_edit_screen.dart
                            > profile_form_screen.dart
                            > profile_view_screen.dart