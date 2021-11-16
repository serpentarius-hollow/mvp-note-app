import 'package:flutter/material.dart';

import '../../factory/note/factory.dart';
import 'model.dart';
import 'view.dart';

class NoteListUi extends StatefulWidget {
  const NoteListUi({Key? key}) : super(key: key);

  @override
  _NoteListUiState createState() => _NoteListUiState();
}

class _NoteListUiState extends State<NoteListUi> implements NoteListView {
  final _presenter = NoteFactory().getNotePresenter();
  bool _isLoading = false;
  List<NotePresentation> _data = List.empty();

  @override
  void initState() {
    _presenter.attach(this);
    super.initState();
    _presenter.loadItems();
  }

  @override
  void deactivate() {
    _presenter.detach();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          var _note = _data[index];

          return ListTile(
            title: Text(_note.title),
            subtitle: Text(_note.description),
          );
        },
        itemCount: _data.length,
      );
    }
  }

  @override
  void setInProgress(bool inProgress) {
    setState(() {
      _isLoading = inProgress;
    });
  }

  @override
  void setItems(List<NotePresentation> items) {
    setState(() {
      _data = items;
    });
  }
}
