import 'package:flutter/material.dart';

import '../models/tree_item_model.dart';

class TreeItemWidget extends StatefulWidget {
  final TreeItemModel node;
  final int level;
  final TextStyle? textStyle;
  final TextStyle? textStyleSelected;
  final Function(int)? onSelect;
  final int? valueSelected;

  const TreeItemWidget({
    super.key,
    required this.node,
    this.level = 0,
    this.textStyle,
    this.textStyleSelected,
    this.onSelect,
    this.valueSelected,
  });

  @override
  State<TreeItemWidget> createState() => _TreeItemWidgetState();
}

class _TreeItemWidgetState extends State<TreeItemWidget> {
  bool expanded = true;

  @override
  Widget build(BuildContext context) {
    final node = widget.node;
    bool isSelected = widget.valueSelected == node.value;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: widget.level * 24.0, top: 4, bottom: 4),
          child: Row(
            children: [
              leadWidget(),
              Expanded(
                child: InkWell(
                  onTap: widget.onSelect != null
                      ? () {
                          widget.onSelect!(node.value);
                        }
                      : null,
                  child: Text(node.label, style: isSelected ? widget.textStyleSelected : widget.textStyle),
                ),
              ),
            ],
          ),
        ),
        if (expanded && node.children.isNotEmpty)
          ...node.children.map(
            (child) => TreeItemWidget(
              node: child,
              level: widget.level + 1,
              textStyle: widget.textStyle,
              textStyleSelected: widget.textStyleSelected,
              onSelect: widget.onSelect,
              valueSelected: widget.valueSelected,
            ),
          ),
      ],
    );
  }

  Widget leadWidget() {
    final node = widget.node;
    return InkWell(
      onTap: node.children.isNotEmpty
          ? () {
              setState(() {
                expanded = !expanded;
              });
            }
          : null,
      child: Row(
        children: [
          SizedBox(
            width: 16,
            child: node.children.isNotEmpty
                ? Icon(expanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right, size: 18)
                : SizedBox.shrink(),
          ),
          SizedBox(width: 28, child: node.icon ?? const SizedBox()),
        ],
      ),
    );
  }
}
