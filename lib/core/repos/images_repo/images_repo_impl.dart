import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failures.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/services/storage_services.dart';
import 'package:fruit_hub_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruit_hub_dashboard/generated/l10n.dart';

class ImagesRepoImpl extends ImagesRepo {
  final StorageService storageService;

  ImagesRepoImpl(this.storageService);
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url = await storageService.uploadImage(
        image,
        BackendEndpoint.images,
      );
      return right(url);
    } on Exception catch (e) {
      return left(ServerFailure(S.current.upload_image_failed));
    }
  }
}
