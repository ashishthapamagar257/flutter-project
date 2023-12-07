import 'package:flutter/material.dart';
import 'package:firstapp/provider/riverpod_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/note.dart';





class AddField extends StatelessWidget {
  final WidgetRef ref;
  AddField({super.key, required this.ref});
  final textControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return      TextFormField(
      controller: textControl,
      onFieldSubmitted: (val) {

        final note = Note(
            title: val.trim(), createdAt: DateTime.now().toString());
        ref.read(todoProvider.notifier).noteAdd(note);
        textControl.clear();
      },
      decoration: const InputDecoration(
          hintText: 'Add Home',
          contentPadding:
          EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.today)),
    );
  }
}


