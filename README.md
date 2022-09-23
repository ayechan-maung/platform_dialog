<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

## Features

- To get relevant platform dialog for Android and iOS.

## Getting started

dependencies:
platform_dialog: ^1.0.0

## Usage

To use this plugin, add platform_dialog as a dependency in your pubspec.yaml file.

```dart
//import package
import 'package:platform_dialog/platform_dialog.dart';

//create function and just call showDialog, 
_dialog() {
  showDialog(
    context: context,
    builder: (context) => PlatformDialog().build(
      context,
      title: Text("Title Dialog"),
      content: Column(
        children: [Text("Content"), Text("Widget")],
      ),
      actions: [
        // Also include PlatformDialogButton for both platform dialog buttons, however it's optional
        PlatformDialogButton(Theme.of(context).platform).build(context, child: Text("OK"), onPressed: () {
          Navigator.of(context).pop();
        })
      ],
    ),
  );
}
```

[//]: # (## Additional information)

[//]: # ()
[//]: # (TODO: Tell users more about the package: where to find more information, how to)

[//]: # (contribute to the package, how to file issues, what response they can expect)

[//]: # (from the package authors, and more.)
