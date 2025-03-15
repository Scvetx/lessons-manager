import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart' show Environment;
import 'package:workbook/core/getit/injection.dart';
import 'package:workbook/core/navigation/constants/default_routes.dart';
import 'package:workbook/features/users/students/data/repository/student_db_service.dart';
import 'package:workbook/features/users/students/domain/models/student.dart';
import 'package:workbook/features/users/teachers/data/repository/teacher_db_service.dart';
import 'package:workbook/features/users/teachers/domain/models/teacher.dart';

import '../global/mock/mock_firebase_auth.dart';
import '../global/ui/test_app.dart';

void main() {
  final getIt = GetIt.instance;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() async {
    await getIt.reset(); // Reset get_it after each test
    configureInjection(Environment.prod); // get_it environment setup
  });

  /// Mocks Auth User, Firestore users (Teacher, Student)
  void mockFirebaseUsers({
    required Type? userType,
    bool testException = false,
  }) {
    final mockFirebaseAuth = MockFirebaseAuth();
    final mockTeacherDbService = MockTeacherDbService();
    final mockStudentDbService = MockStudentDbService();

    getIt
    // Register mock FirebaseAuth (current Auth User)
    ..unregister<FirebaseAuth>() 
    ..registerSingleton<FirebaseAuth>(mockFirebaseAuth)  
    // Register TeacherDbService (users with type Teacher)
    ..unregister<TeacherDbService>() 
    ..registerSingleton<TeacherDbService>(mockTeacherDbService)
    // Register StudentDbService (users with type Student)
    ..unregister<StudentDbService>() 
    ..registerSingleton<StudentDbService>(mockStudentDbService);


    mockFirebaseAuth.setupMock(
      userType: userType, 
      testException: testException,
    );
    mockTeacherDbService.setupMock(
      userType: userType, 
    );
    mockStudentDbService.setupMock(
      userType: userType, 
    );
  }

  Future<void> mockData({
    required Type? userType,
    bool testException = false,
  }) async {
    // mock Firebase users
    mockFirebaseUsers(userType: userType, testException: testException);
    // init Firebase
    await Firebase.initializeApp(); // Initialize Firebase
  }

  

  testWidgets('Navigate to home screen if logged in: teacher', (tester) async {
    await mockData(userType: Teacher);

    final app = TestApp();
    await tester.pumpWidget(
      app.getMaterialApp(),
    );
    await tester.pump(const Duration(milliseconds: 5000));
    await tester.pump(const Duration(milliseconds: 5000));

    expect(app.router.current.name, DefaultRoutes.homeRouteName);
  });

  testWidgets('Navigate to home screen if logged in: student', (tester) async {
    await mockData(userType: Student); // student user

    final app = TestApp();
    await tester.pumpWidget(
      app.getMaterialApp(),
    );
    await tester.pump(const Duration(milliseconds: 5000));
    await tester.pump(const Duration(milliseconds: 5000));

    expect(app.router.current.name, DefaultRoutes.homeRouteName);
  });

  testWidgets('Navigate to login route if unauthorized', (tester) async {
    await mockData(userType: null); // no user

    final app = TestApp();
    await tester.pumpWidget(
      app.getMaterialApp(),
    );
    await tester.pump(const Duration(milliseconds: 5000));
    await tester.pump(const Duration(milliseconds: 5000));
    
    expect(app.router.current.name, DefaultRoutes.loginRouteName);
  });

  testWidgets('Stay in splash screen if exception in appInit provider', 
                                                        (tester) async {
    await mockData(userType: null, testException: true); // cause an exception

    final app = TestApp();
    await tester.pumpWidget(
      app.getMaterialApp(),
    );
    await tester.pump(const Duration(milliseconds: 5000));
    await tester.pump(const Duration(milliseconds: 5000));
    
    expect(app.router.current.name, DefaultRoutes.splashRouteName);
  });
}