import 'package:firebase_database/firebase_database.dart';
import 'package:phelum/data/sync_repository.dart';

class SeatRepository extends SyncRepository {
  FirebaseDatabase _firebaseDatabase;
  DatabaseReference seatsDB;

  SeatRepository({FirebaseDatabase firebaseDatabase}){
     _firebaseDatabase = firebaseDatabase ?? FirebaseDatabase.instance;
    seatsDB = _firebaseDatabase.reference().child('seats');
  }

  @override
  Future<int> addSeat(int seatIndex, int seatState) {
    seatsDB.push().set({
      'index' : seatIndex,
      'state' : seatState
    }).then((_){
      
    });
    return null;
  }
  
  
}