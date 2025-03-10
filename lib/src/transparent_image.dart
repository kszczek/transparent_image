import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// An [ImageProvider] that provides a transparent 1×1 pixel image.
///
/// This can be useful as a placeholder image in widgets like [FadeInImage],
/// which require an [ImageProvider] but don't offer a built-in way to render
/// an intentionally invisible image.
///
/// ```dart
/// FadeInImage(
///   placeholder: const TransparentImage(),
///   image: NetworkImage('https://example.com/image.jpg'),
/// )
/// ```
@immutable
class TransparentImage extends ImageProvider<TransparentImage> {
  /// Creates an [ImageProvider] that provides a transparent 1×1 pixel image.
  const TransparentImage();

  @override
  Future<TransparentImage> obtainKey(final ImageConfiguration configuration) {
    return SynchronousFuture<TransparentImage>(this);
  }

  @override
  ImageStreamCompleter loadImage(
    final TransparentImage key,
    final ImageDecoderCallback decode,
  ) {
    return OneFrameImageStreamCompleter(
      Future<ImageInfo>(() async {
        final ui.PictureRecorder recorder = ui.PictureRecorder();
        Canvas(recorder);
        return ImageInfo(image: await recorder.endRecording().toImage(1, 1));
      }),
    );
  }

  @override
  bool operator ==(final Object other) =>
      identical(this, other) ||
      (other.runtimeType == runtimeType && other is TransparentImage);

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() => '${objectRuntimeType(this, 'TransparentImage')}()';
}
