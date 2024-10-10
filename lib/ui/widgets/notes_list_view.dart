import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state is NotesSuccess) {
          return ListView.separated(
            itemCount: state.notes.length,
            itemBuilder: (context, index) {
              return NoteItem(note: state.notes[index]);
            }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 15,); },
          );
        } else  {
          return Center(child: Text('No notes available'));
        }
      },

    );
  }
}
