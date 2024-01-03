import 'package:flutter/material.dart';
import 'package:hive_sample/constants.dart';

class DeleteConfirmDialog extends StatelessWidget {
  const DeleteConfirmDialog(
      {Key? key, required this.onDelete, required this.index})
      : super(key: key);

  final void Function(int) onDelete;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(TextLibrary.deleteConfirm),
      content: const Text(TextLibrary.deleteQuestion),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(TextLibrary.cancelButtonText),
        ),
        TextButton(
          onPressed: () {
            onDelete(index);
            Navigator.of(context).pop();
          },
          child: const Text(TextLibrary.deleteButtonText),
        ),
      ],
    );
  }
}
