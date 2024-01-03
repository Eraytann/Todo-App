import 'package:flutter/material.dart';
import 'package:hive_sample/cache/cache_manager.dart';
import '../constants.dart';

void showForm(BuildContext context, TextEditingController controller) async {
  late final CacheManager _cacheManager;
  _cacheManager = CacheManager();

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(TextLibrary.typeText),
              TextField(
                controller: controller,
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  addOnPressed(_cacheManager, controller, context);
                },
                icon: const Icon(Icons.add),
                label: const Text(TextLibrary.createButtonText),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

void addOnPressed(CacheManager _cacheManager, TextEditingController controller,
    BuildContext context) {
  _cacheManager.addTodo(controller.text);
  Navigator.pop(context);
  controller.clear();
}
