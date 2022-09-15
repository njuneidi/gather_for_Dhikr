import 'package:dhikr/src/common_widgets/in_memory_store.dart';
import 'package:dhikr/src/constants/azkar_pages.dart';
import 'package:dhikr/src/features/dhikr/domain/dhikr.dart';
import 'package:dhikr/src/utils/delay.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeDhikrRepository {
  FakeDhikrRepository({this.addDelay = true});
  final bool addDelay;
  final _azkar = InMemoryStore<List<Dhikr>>(List.from(azkarPages));

  List<Dhikr> getAzkarList() {
    return _azkar.value;
  }

  Dhikr? getDhikr(String id) {
    return _getDhikr(_azkar.value, id);
  }

  static Dhikr? _getDhikr(List<Dhikr> azkar, String id) {
    try {
      return azkar.firstWhere((dhikr) => dhikr.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<List<Dhikr>> fetchAzkarList() async {
    await delay(addDelay);
    return Future.value(_azkar.value);
  }

  Stream<List<Dhikr>> watchAzkarList() {
    return _azkar.stream;
  }

  Stream<Dhikr?> watchDhikr(String id) {
    return watchAzkarList().map((azkar) => _getDhikr(azkar, id));
  }
}

final azkarRepositoryProvider = Provider<FakeDhikrRepository>(
    ((ref) => FakeDhikrRepository(addDelay: false)));

final azkarListStreamProvider = StreamProvider.autoDispose<List<Dhikr>>(
  (ref) {
    final dhikrRepository = ref.watch(azkarRepositoryProvider);
    return dhikrRepository.watchAzkarList();
  },
);
final azkarListFutureProvider = FutureProvider.autoDispose<List<Dhikr>>(
  (ref) {
    final dhikrRepository = ref.watch(azkarRepositoryProvider);
    return dhikrRepository.fetchAzkarList();
  },
);
final dhikrProvider =
    StreamProvider.autoDispose.family<Dhikr?, String>((ref, id) {
  final azkarRepository = ref.watch(azkarRepositoryProvider);
  return azkarRepository.watchDhikr(id);
});
