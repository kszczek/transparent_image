import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transparent_image/transparent_image.dart';

void main() {
  testWidgets(
    'TransparentImage should be invisible',
    (final WidgetTester tester) async {
      int? lastFrame;
      await tester.runAsync(() async {
        bool precached = false;
        final GlobalKey key = GlobalKey();
        const TransparentImage image = TransparentImage();
        await tester.pumpWidget(
          Image(
            key: key,
            image: image,
            frameBuilder: (
              final BuildContext context,
              final Widget child,
              final int? frame,
              final bool wasSynchronouslyLoaded,
            ) {
              lastFrame = frame;
              if (precached) {
                assert(
                  frame != null,
                  'Expected a non-null frame after precaching the image.',
                );
              }
              return child;
            },
          ),
        );

        await precacheImage(image, key.currentContext!);
        precached = true;
        await tester.pump();
      });

      expect(lastFrame, isNotNull);
      expect(tester.takeException(), isNull);
      await expectLater(
        find.byType(Image),
        matchesGoldenFile('goldens/transparent_image.png'),
      );
    },
  );
}
