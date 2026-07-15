<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->


## Features

## Getting started

```yaml
dependencies:
  combo_box_v2: ^1.0.0
```

## Usage

```dart
int? valueSelected;

final data = [
  TreeItemModel(
    icon: Icon(size: 16, Icons.folder_open),
    value: 1,
    label: 'Work Documents',
    children: [
      TreeItemModel(
        icon: Icon(size: 16, Icons.folder_open),
        value: 2,
        label: 'Functional Specifications',
        children: [
          TreeItemModel(value: 3, label: 'TreeView spec'),
          TreeItemModel(icon: Icon(size: 16, Icons.folder_open), value: 4, label: 'Feature Schedule'),
        ],
      ),
    ],
  ),
  TreeItemModel(
    icon: Icon(size: 16, Icons.folder_open),
    value: 4,
    label: 'Personal Folder',
    children: [
      TreeItemModel(
        icon: Icon(size: 16, Icons.folder_open),
        value: 5,
        label: 'Home Remodel Folder',
        children: [
          TreeItemModel(
            icon: Icon(size: 16, Icons.description_outlined),
            value: 6,
            label: 'Contractor Contact Info',
          ),
        ],
      ),
    ],
  ),
];

@override
Widget build(BuildContext context) {
  return TreeView(
    items: data,
    textStyle: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w400),
    textStyleSelected: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600),
    valueSelected: valueSelected,
    onSelect: (value) {
      print('valueSelected: $value');
    },
  );
}
```

## Additional information
