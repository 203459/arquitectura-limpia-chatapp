import 'package:chat_grupal/features/user/data/datasources/user_remote_data_source.dart';
import 'package:chat_grupal/features/user/data/datasources/user_remote_data_source_impl.dart';
import 'package:chat_grupal/features/user/data/repositories/user_repository_impl.dart';
import 'package:chat_grupal/features/user/domain/repositories/user_repository.dart';
import 'package:chat_grupal/features/user/domain/usecases/forgot_password_usecase.dart';
import 'package:chat_grupal/features/user/domain/usecases/get_all_users_usecase.dart';
import 'package:chat_grupal/features/user/domain/usecases/get_create_current_user_usecase.dart';
import 'package:chat_grupal/features/user/domain/usecases/get_current_uid_usecase.dart';
import 'package:chat_grupal/features/user/domain/usecases/get_single_user_usecase.dart';
import 'package:chat_grupal/features/user/domain/usecases/get_update_user_usecase.dart';
import 'package:chat_grupal/features/user/domain/usecases/google_auth_usecase.dart';
import 'package:chat_grupal/features/user/domain/usecases/is_sign_in_usecase.dart';
import 'package:chat_grupal/features/user/domain/usecases/sign_in_usecase.dart';
import 'package:chat_grupal/features/user/domain/usecases/sign_out_usecase.dart';
import 'package:chat_grupal/features/user/domain/usecases/sign_up_usecase.dart';
import 'package:chat_grupal/features/user/presentation/cubit/auth/auth_cubit.dart';
import 'package:chat_grupal/features/user/presentation/cubit/credential/credential_cubit.dart';
import 'package:chat_grupal/features/user/presentation/cubit/user/single_user_cubit.dart';
import 'package:chat_grupal/features/user/presentation/cubit/users/users_cubit.dart';

import '../injection_container.dart';

Future<void> userInjectionContainer() async {
  //Cubit or Bloc
  sl.registerFactory<AuthCubit>(() => AuthCubit(
      isSignInUseCase: sl.call(),
      signOutUseCase: sl.call(),
      getCurrentUIDUseCase: sl.call()));

  sl.registerFactory<SingleUserCubit>(
      () => SingleUserCubit(getSingleUserUseCase: sl.call()));

  sl.registerFactory<UserCubit>(() => UserCubit(
        getAllUsersUseCase: sl.call(),
        getUpdateUserUseCase: sl.call(),
      ));

  sl.registerFactory<CredentialCubit>(() => CredentialCubit(
      forgotPasswordUseCase: sl.call(),
      googleAuthUseCase: sl.call(),
      signInUseCase: sl.call(),
      signUpUseCase: sl.call()));

  //UseCases
  sl.registerLazySingleton<ForgotPasswordUseCase>(
      () => ForgotPasswordUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetAllUsersUseCase>(
      () => GetAllUsersUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCreateCurrentUserUseCase>(
      () => GetCreateCurrentUserUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUIDUseCase>(
      () => GetCurrentUIDUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetSingleUserUseCase>(
      () => GetSingleUserUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetUpdateUserUseCase>(
      () => GetUpdateUserUseCase(repository: sl.call()));
  sl.registerLazySingleton<GoogleAuthUseCase>(
      () => GoogleAuthUseCase(repository: sl.call()));
  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(repository: sl.call()));

  //Repository
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: sl.call()));

  // RemoteDataSource

  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(
      fireStore: sl.call(), auth: sl.call(), googleSignIn: sl.call()));
}
