import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(final BuildContext context) {
    const String title = 'Fade in images';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(title: const Text(title)),
        body: const Stack(
          children: <Widget>[
            Center(child: CircularProgressIndicator()),
            Center(
              child: FadeInImage(
                placeholder: TransparentImage(),
                image: NetworkImage('https://picsum.photos/250?image=9'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
