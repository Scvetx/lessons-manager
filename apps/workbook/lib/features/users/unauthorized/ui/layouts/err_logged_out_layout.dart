/* A Layout to show an error when user is logged out
*/

// import 'package:flutter/material.dart';

// import '../../../../../core/getit/injection.dart';
// import '../../../../../core/ui/app_styles/app_style.dart';
// import '../../../../../core/ui/widgets/buttons/link_text.dart';
// import '../../../../../core/utils/labels.dart';
// import '../../../profile/data/auth/firebase_auth_repo.dart';

// currently not used
// class ErrLoggedOutCmp extends StatelessWidget {
//   const ErrLoggedOutCmp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final l10n = getIt<Labels>().l10n;

//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center, 
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(l10n.errNotLoggedIn),
//               const SizedBox(width: spaceBetweenLinesSmall),
//               LinkText(
//                 text: l10n.labelLoginButton,
//                 onPressed: getIt<FirebaseAuthRepository>().tologinPage,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
