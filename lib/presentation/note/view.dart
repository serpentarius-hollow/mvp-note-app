import 'model.dart';

// Needs to be implemented by the view that wants to use the
// [NoteListPresenter]
abstract class NoteListView {
  void setInProgress(bool inProgress);

  void setItems(List<NotePresentation> items);
}
