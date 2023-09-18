import 'package:chat_grupal/features/user/presentation/page/credential/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_grupal/features/app/home/home_page.dart';
import 'package:chat_grupal/features/group/presentation/cubits/chat/chat_cubit.dart';
import 'package:chat_grupal/features/group/presentation/cubits/group/group_cubit.dart';
import 'package:chat_grupal/features/user/presentation/cubit/auth/auth_cubit.dart';
import 'package:chat_grupal/features/user/presentation/cubit/credential/credential_cubit.dart';
import 'package:chat_grupal/features/user/presentation/cubit/user/single_user_cubit.dart';
import 'package:chat_grupal/features/user/presentation/cubit/users/users_cubit.dart';
import 'package:chat_grupal/on_generate_route.dart';
import 'features/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
            create: (_) => di.sl<AuthCubit>()..appStarted()),
        BlocProvider<CredentialCubit>(create: (_) => di.sl<CredentialCubit>()),
        BlocProvider<SingleUserCubit>(create: (_) => di.sl<SingleUserCubit>()),
        BlocProvider<UserCubit>(create: (_) => di.sl<UserCubit>()),
        BlocProvider<GroupCubit>(create: (_) => di.sl<GroupCubit>()),
        BlocProvider<ChatCubit>(create: (_) => di.sl<ChatCubit>()),
      ],
      child: MaterialApp(
        title: 'Group Chat',
        onGenerateRoute: OnGenerateRoute.route,
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        theme: ThemeData(primarySwatch: Colors.green),
        routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return HomePage(
                    uid: authState.uid,
                  );
                } else {
                  return LoginPage();
                }
              },
            );
          }
        },
      ),
    );
  }
}
