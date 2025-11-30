import 'dart:math';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:booking_trip_app/manage_trip.dart';

class DBManagerWeb {
  // Singleton object
  static final shared = DBManagerWeb();

  final String boxName = 'booking';

  Box<Map>? _box;

  // Lazy init Hive + open box (works on web + mobile)
  Future<Box<Map>> get _bookingBox async {
    if (_box != null) return _box!;

    // Initialize Hive
    await Hive.initFlutter();

    _box = await Hive.openBox<Map>(boxName);
    return _box!;
  }

  // Insert (add)
  Future<int> insertTrip(Map<String, dynamic> map) async {
    final box = await _bookingBox;

    // Generate auto-increment id (similar to AUTOINCREMENT in SQLite)
    int nextId = 1;
    if (box.isNotEmpty) {
      final keys = box.keys.cast<int>().toList();
      final maxId = keys.reduce(max);
      nextId = maxId + 1;
    }

    // Store id inside map for fetchToDos mapping
    map['id'] = nextId;

    await box.put(nextId, Map<String, dynamic>.from(map));

    return nextId;
  }

  // Fetch (get all data)
  Future<List<BookingData>> fetchbookings() async {
    final box = await _bookingBox;

    List<BookingData> ListBooking = [];

    for (final key in box.keys) {
      final singleDic = box.get(key);

      if (singleDic == null) continue;

      final obj = BookingData(
        id: singleDic['id'] as int,
        from: singleDic['from'] as String,
        to: singleDic['to'] as String,

        // OPTIONAL FIELDS if not adddeddd:
        date: (singleDic['date'] ?? '') as String,
        day: (singleDic['day'] ?? '') as String,

        explored: (singleDic['explored'] as int) == 1,
      );

      ListBooking.add(obj);
    }

    return ListBooking;
  }

  // Delete
  Future<int> deleteToDo(int id) async {
    final box = await _bookingBox;

    if (!box.containsKey(id)) {
      return 0; // no row deleted
    }

    await box.delete(id);
    return 1; // mimic "1 row affected"
  }

  // Update
  Future<int> updateToDo({
    required int id,
    required Map<String, dynamic> map,
  }) async {
    final box = await _bookingBox;

    if (!box.containsKey(id)) {
      return 0; // no row updated
    }

    // Ensure id stays same
    map['id'] = id;

    await box.put(id, Map<String, dynamic>.from(map));
    return 1; // mimic "1 row affected"
  }
}
