import 'package:flutter/material.dart';

class TreeItemModel {
  final String label;
  final int value;
  final Widget? icon;
  bool isExpanded;
  final List<TreeItemModel> children;

  TreeItemModel({
    required this.label,
    required this.value,
    this.isExpanded = false,
    this.icon,
    this.children = const [],
  });

}