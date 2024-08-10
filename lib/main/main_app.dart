import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maibrain/config/routes/app_routes.dart';
import 'package:maibrain/data/datasource/user_datasource_db.dart';
import 'package:maibrain/data/repository/user_repository_impl.dart';
import 'package:maibrain/shared/navigation/cubit/navigation_page_cubit.dart';
import 'package:maibrain/shared/theme/app_theme.dart';
import 'package:maibrain/ui/bloc/bloc/chat/chat_bloc.dart';
import 'package:maibrain/ui/bloc/bloc/person/person_bloc.dart';

import 'package:maibrain/ui/bloc/cubit/camera_cubit.dart';
import 'package:maibrain/ui/screen/home_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.firebaseFirestore});

  final FirebaseFirestore firebaseFirestore;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationPageCubit(
            pageController: PageController(initialPage: 1),
          ),
        ),
        BlocProvider(
            lazy: false,
            create: (context) => PersonBloc(
                  userRepository: UserRepositoryImpl(
                    datasourceDb:
                        UserDatasourceDb(firebaseFirestore: firebaseFirestore),
                  ),
                )),
        BlocProvider(
          lazy: false,
          create: (context) => CameraCubit(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => ChatBloc(
              userRepository: UserRepositoryImpl(
            datasourceDb:
                UserDatasourceDb(firebaseFirestore: firebaseFirestore),
          )),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case AppRoutes.home:
              return MaterialPageRoute(
                  builder: (context) => const HomeScreen());
            default:
              return MaterialPageRoute(
                  builder: (context) => const HomeScreen());
          }
        },
      ),
    );
  }
}
