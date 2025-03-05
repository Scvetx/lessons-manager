import 'package:flutter_riverpod/flutter_riverpod.dart';

/// indicates if the screen should be locked
final disableScreen = StateProvider<bool>((ref) => false);