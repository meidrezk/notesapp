part of 'notes_cubit.dart';


abstract class NotesState {}

class NotesInitial extends NotesState {

}

class NotesEmpty extends NotesState {}

class NotesSuccess extends NotesState {
  final List<NoteModel> notes;
  NotesSuccess(this.notes);
}
