import '../../domain/note/entity.dart';
import '../../domain/note/repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  // LocalNoteDataSource _localDataSource;
  // RemoteNoteDataSource _remoteDataSource;

  @override
  Future<List<Note>> getNotes() async {
    /* 
    *  How your code should look like
    *  
    *  var data = await _localDataSource.getItems();
    *
    *  if (data == null) {
    *    data = _remoteDataSource.getItems();
    *    _localDataSource.setItems(data);
    *  }
    *
    *  return data; 
    */

    await Future.delayed(const Duration(seconds: 2));

    List<Note> dummyData = [
      Note(1, "Finish Work", "Bla bla bla", DateTime.now()),
      Note(2, "Wash The Dishes", "Bla bla bla", DateTime.now()),
      Note(3, "Walk The Dog Outside", "Bla bla bla", DateTime.now()),
    ];

    return dummyData;
  }
}
