import '../../domain/note/repository.dart';
import 'model.dart';
import 'view.dart';

class NoteListPresenter {
  NoteListView? _view;
  final NoteRepository _repository;

  NoteListPresenter(this._repository);

  void attach(NoteListView view) {
    _view = view;
  }

  void detach() {
    _view = null;
  }

  void loadItems() async {
    _view?.setInProgress(true);

    var result = await _repository.getNotes();
    var mappedResult = result
        .map(
          (item) => NotePresentation(
            item.id,
            item.title,
            item.description,
            item.createdAt,
          ),
        )
        .toList();

    _view?.setInProgress(false);

    _view?.setItems(mappedResult);
  }
}
