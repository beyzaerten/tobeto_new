import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:tobeto_new/blocs/announcement_news_bloc/announcement_news_bloc.dart';
import 'package:tobeto_new/blocs/auth/auth_bloc.dart';
import 'package:tobeto_new/blocs/catalog/catalog_bloc.dart';
import 'package:tobeto_new/blocs/education/education_bloc.dart';
import 'package:tobeto_new/blocs/profile/profile_bloc.dart';
import 'package:tobeto_new/blocs/test/test_bloc.dart';
import 'package:tobeto_new/firebase_options.dart';
import 'package:intl/intl.dart';
import 'package:tobeto_new/screens/entry_screen.dart';
import 'package:tobeto_new/screens/login_screen/login_screen.dart';
import 'package:tobeto_new/screens/login_screen/start_screen.dart';
import 'package:tobeto_new/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(),
    ),
    BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(),
    ),
    BlocProvider<EducationBloc>(
      create: (context) => EducationBloc(),
    ),
    BlocProvider<AnnouncementBloc>(
      create: (context) => AnnouncementBloc(),
    ),
    BlocProvider<CatalogBloc>(
      create: (context) => CatalogBloc(),
    ),
    BlocProvider<TestBloc>(create: ((context) => TestBloc()))
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Cihaz temasına uygun olarak otomatik seçim
      home: EntryScreen(),
    );
  }
}
