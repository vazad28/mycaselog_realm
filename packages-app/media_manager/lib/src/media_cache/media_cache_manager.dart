import 'dart:async' show Future;
import 'dart:io' show File;
import 'dart:ui' as ui show Codec, ImmutableBuffer;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'missing_image.dart';

/// ErrorListener
typedef CachedImageErrorListener = void Function(dynamic err);

@immutable
class MediaCacheManager extends ImageProvider<MediaCacheManager> {
  const MediaCacheManager(
    this.url, {
    this.scale = 1.0,
    this.errorListener,
    this.headers,
    this.cacheManager,
  });

  final String url; //the cache id use to get cache
  final CacheManager? cacheManager;
  final double scale;
  // Set headers for the image provider, for example for authentication
  final Map<String, String>? headers;

  final CachedImageErrorListener? errorListener;

  @override
  ImageStreamCompleter loadImage(
    MediaCacheManager key,
    ImageDecoderCallback decode,
  ) {
    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(key, decode),
      scale: 1,
      debugLabel: url,
      informationCollector: () sync* {
        yield ErrorDescription('Url: $url');
      },
    );
  }

  Future<ui.Codec> _loadAsync(
    MediaCacheManager key,
    ImageDecoderCallback decode,
  ) async {
    final mngr = cacheManager ?? AppCacheManager.instance;

    try {
      final file = await mngr.getSingleFile(url, headers: headers);
      return _loadAsyncFromFile(key, file, decode);
    } catch (err) {
      final localFile = File(url);
      if (localFile.existsSync()) {
        return _loadAsyncFromFile(key, localFile, decode);
      } else {
        errorListener?.call(err);
        final buffer = await ui.ImmutableBuffer.fromUint8List(kMissingImage);
        return decode(buffer);
      }
    }
  }

  @override
  Future<MediaCacheManager> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<MediaCacheManager>(this);
  }

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    final res = other is MediaCacheManager && other.url == url;
    return res;
  }

  @override
  int get hashCode => url.hashCode;

  @override
  String toString() =>
      '${objectRuntimeType(this, 'CacheImageProvider')}("$url")';

  ///
  /// Helper Methods
  ///
  Future<ui.Codec> _loadAsyncFromFile(
    MediaCacheManager key,
    File file,
    ImageDecoderCallback decode,
  ) async {
    assert(key == this, 'loadAsyncFromFile key not matching');

    final bytes = await file.readAsBytes();

    if (bytes.lengthInBytes == 0) {
      // The file may become available later.
      PaintingBinding.instance.imageCache.evict(this);
      throw StateError('$url cannot be loaded as an image.');
    }

    final buffer = await ui.ImmutableBuffer.fromUint8List(bytes);
    return decode(buffer);
  }
}

class AppCacheManager {
  static CacheManager instance = CacheManager(
    Config(
      key,
      stalePeriod: const Duration(days: 365),
      maxNrOfCacheObjects: 500,
      repo: JsonCacheInfoRepository(databaseName: key),
    ),
  );

  static const key = 'mclCustomCacheKey';
}
