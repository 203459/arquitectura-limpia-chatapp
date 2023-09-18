import 'dart:io';

import 'package:chat_grupal/features/storage/data/datasource/cloud_storage_remote_data_source.dart';
import 'package:chat_grupal/features/storage/domain/repository/cloud_storage_repository.dart';

class CloudStorageRepositoryImpl implements CloudStorageRepository {
  final CloudStorageRemoteDataSource remoteDataSource;

  CloudStorageRepositoryImpl({required this.remoteDataSource});

  @override
  Future<String> uploadGroupImage({required File file}) async =>
      remoteDataSource.uploadGroupImage(file: file);

  @override
  Future<String> uploadProfileImage({required File file}) async =>
      remoteDataSource.uploadProfileImage(file: file);
}
