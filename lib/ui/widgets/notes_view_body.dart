import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/ui/widgets/custom_app_bar.dart';
import 'package:notes_app/ui/widgets/notes_list_view.dart';


class NotesViewBody extends StatelessWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        BlocProvider.of<NotesCubit>(context).fetchAllNotes();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const CustomAppBar(
                title: 'Notes',
                icon: Icons.search,
              ),
              Expanded(
                child: NotesListView(),
              ),
            ],
          ),
        );
      },
    );
  }
}
