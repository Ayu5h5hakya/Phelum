abstract class SyncRepository {
  Future<int> addSeat(int seatIndex, int seatState);
  Future<int> removeSeat;
}