# transparent_image

A simple transparent 1x1 pixel image, implemented as an
[`ImageProvider`](https://api.flutter.dev/flutter/painting/ImageProvider-class.html).

It's a silly, simple library, but I found I needed transparent images in a few
projects and found this is the simplest way to represent it :)

> **NOTE:** Starting with version `3.0.0`, this package depends on Flutter.
> For standalone Dart projects, use version `2.0.1`.

## Usage

This package exports one class:
[`TransparentImage`](https://pub.dev/documentation/transparent_image/latest/transparent_image/TransparentImage.html).

### Image Widget

Displays the transparent image.

```dart
Image(image: const TransparentImage());
```

### FadeInImage Widget

A more useful example, and the reason I originally extracted this from the
Flutter codebase!

A [complete
example](https://flutter.dev/docs/cookbook/images/fading-in-images#in-memory)
can be seen on the Flutter website.

```dart
FadeInImage(
  placeholder: const TransparentImage(),
  image: NetworkImage('https://picsum.photos/250?image=9'),
);
```

## Contributors

  * Flutter team
  * Brian Egan
  * Kamil Szczęk
