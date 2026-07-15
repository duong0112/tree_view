import 'package:flutter/material.dart';
import '../models/tree_item_model.dart';
import 'tree_item_widget.dart';

class TreeView extends StatefulWidget {
  const TreeView({
    super.key,
    required this.items,
    this.valueSelected,
    this.textStyle,
    this.textStyleSelected,
    this.onSelect,
  });

  final List<TreeItemModel> items;

  final TextStyle? textStyle;

  final TextStyle? textStyleSelected;

  final int? valueSelected;

  final Function(int value)? onSelect;

  @override
  State<TreeView> createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  int? valueSelected;

  @override
  void initState() {
    super.initState();
    valueSelected = widget.valueSelected;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.items
          .map(
            (e) => TreeItemWidget(
              node: e,
              textStyle: widget.textStyle,
              valueSelected: valueSelected,
              textStyleSelected: widget.textStyleSelected,
              onSelect: widget.onSelect != null
                  ? (int value) {
                      widget.onSelect!(value);
                      setState(() {
                        valueSelected = value;
                      });
                    }
                  : null,
            ),
          )
          .toList(),
    );
  }
}
