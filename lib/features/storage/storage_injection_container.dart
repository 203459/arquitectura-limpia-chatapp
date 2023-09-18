import 'package:chat_grupal/features/injection_container.dart';
import 'package:chat_grupal/features/storage/data/datasource/cloud_storage_remote_data_source.dart';
import 'package:chat_grupal/features/storage/data/datasource/cloud_storage_remote_data_source_impl.dart';
import 'package:chat_grupal/features/storage/data/repository/cloud_storage_repository_impl.dart';
import 'package:chat_grupal/features/storage/domain/repository/cloud_storage_repository.dart';
import 'package:chat_grupal/features/storage/domain/usecases/upload_group_image_usecase.dart';
import 'package:chat_grupal/features/storage/domain/usecases/upload_profile_image_usecase.dart';

Future<void> storageInjectionContainer() async {
  ///UseCases
  sl.registerLazySingleton<UploadProfileImageUseCase>(
      () => UploadProfileImageUseCase(repository: sl.call()));
  sl.registerLazySingleton<UploadGroupImageUseCase>(
      () => UploadGroupImageUseCase(repository: sl.call()));

  /// Repository
  sl.registerLazySingleton<CloudStorageRepository>(
      () => CloudStorageRepositoryImpl(remoteDataSource: sl.call()));

  /// Remote DataSource
  sl.registerLazySingleton<CloudStorageRemoteDataSource>(
      () => CloudStorageRemoteDataSourceImpl(storage: sl.call()));
}
