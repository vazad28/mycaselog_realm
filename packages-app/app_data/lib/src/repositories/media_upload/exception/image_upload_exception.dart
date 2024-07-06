import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_upload_exception.freezed.dart';

@Freezed(
  copyWith: true,
  equal: true,
  when: FreezedWhenOptions(when: false, maybeWhen: true, whenOrNull: false),
  map: FreezedMapOptions(maybeMap: false, mapOrNull: false),
  fromJson: false,
  toJson: false,
)
class ImageUploadException with _$ImageUploadException implements Exception {
  const ImageUploadException._();

  const factory ImageUploadException.fileNotFound() = _FileNotFound;

  const factory ImageUploadException.compressionFailure() = _CompressionFailure;
}
