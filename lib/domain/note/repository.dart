import 'entity.dart';

abstract class NoteRepository {
  Future<List<Note>> getNotes();
}
