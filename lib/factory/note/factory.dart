import '../../data/note/repository_impl.dart';
import '../../domain/note/repository.dart';
import '../../presentation/note/presenter.dart';

class NoteFactory {
  static final NoteFactory _instance = NoteFactory._internal();

  NoteFactory._internal();

  factory NoteFactory() {
    return _instance;
  }

  NoteRepository getNoteRepository() => NoteRepositoryImpl();

  // If we want to make the presenter re-usable and maintain state
  // between screen switches then we have to make this class a singleton
  NoteListPresenter getNotePresenter() => NoteListPresenter(
        getNoteRepository(),
      );
}
