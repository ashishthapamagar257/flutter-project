import 'package:firstapp/constants/app_sizes.dart';
import 'package:firstapp/model/note.dart';
import 'package:firstapp/provider/riverpod_providers.dart';
import 'package:firstapp/views/widgets/add_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//import 'package:firstapp/constants/app_sizes.dart';
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Figma",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.indigo) ,),
//       ),
//
//       body: Column(
//
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 30.0),
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 15),
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               height: 300,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30),
//                 image: DecorationImage(
//                   fit: BoxFit.cover,
//                     image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKeRPJ6Cu_cdiLiDb_ffrn6r0oi09bJXoGyA&usqp=CAU')),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   AppSizes.gapH22,
//                   Text('Figma\nDesign App',
//                     style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
class HomePage extends StatelessWidget {
  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        title: const Text('Note App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer(builder: (context, ref, child) {
          final notes = ref.watch(todoProvider);

          return Column(
            children: [
              AppSizes.gapH14,
              AddField(ref: ref),


              Expanded(
                  child: ListView.builder(
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        final note = notes[index];
                        return ListTile(
                          title: Text(note.title),
                          subtitle: Text(note.createdAt),
                          trailing: SizedBox(
                              width: 100,
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text('Edit'),
                                                content: TextFormField(
                                                  initialValue: note.title,
                                                  onFieldSubmitted: (val) {
                                                    final newNote = Note(
                                                        title: val.trim(),
                                                        createdAt:
                                                            note.createdAt);
                                                    ref
                                                        .read(todoProvider
                                                            .notifier)
                                                        .noteUpdate(newNote);
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child:
                                                          const Text('Cancel'))
                                                ],
                                              );
                                            });
                                      },
                                      icon: const Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text('Hold On'),
                                                content: const Text(
                                                    'Are You Sure ?'),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        ref
                                                            .read(todoProvider
                                                                .notifier)
                                                            .noteRemove(note);
                                                      },
                                                      child: const Text('Yes')),
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text('No')),
                                                ],
                                              );
                                            });
                                      },
                                      icon: const Icon(Icons.delete)),
                                ],
                              )),
                        );
                      }))
            ],
          );
        }),
      ),
    );
  }
}
