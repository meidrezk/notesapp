import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/ui/widgets/add_note_form.dart';

import 'custom_button.dart';
import 'custom_text_form_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (BuildContext context, Object? state) {
          if (state is AddNoteFailure) {
            print('======Failed ${state.errMessage}===========');
          }
          if (state is AddNoteSuccess) {
           BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) =>
            AbsorbPointer( absorbing:

            state is AddNoteLoading ? true : false,
              child: Padding(
                padding: EdgeInsets.only(right: 16,left: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(child: AddNoteForm()),
              ),
            ),
      ),
    );
  }
}


