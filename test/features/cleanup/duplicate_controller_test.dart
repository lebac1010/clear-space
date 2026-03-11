import 'package:clear_space/features/cleanup/domain/entities/cleanup_group.dart';
import 'package:clear_space/features/cleanup/domain/entities/cleanup_item.dart';
import 'package:clear_space/features/cleanup/presentation/controllers/duplicate_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class MockDuplicateController extends DuplicateController {
  MockDuplicateController() : super();

  // Helper to set state manually for testing
  void setTestState(List<CleanupGroup> groups) {
    state = AsyncData(groups);
  }
}

void main() {
  group('DuplicateController Logic', () {
    late MockDuplicateController controller;

    setUp(() {
      final container = ProviderContainer(
        overrides: [
          duplicateControllerProvider(
            CleanupType.duplicate,
          ).overrideWith(() => MockDuplicateController()),
        ],
      );
      controller =
          container.read(
                duplicateControllerProvider(CleanupType.duplicate).notifier,
              )
              as MockDuplicateController;
    });

    final item1 = CleanupItem(
      id: '1',
      name: 'img1.jpg',
      size: 1000,
      path: '/path/1',
      uri: 'uri1',
      dateModified: DateTime.fromMillisecondsSinceEpoch(1000),
      isSelected: false,
    );
    final item2 = CleanupItem(
      id: '2',
      name: 'img1.jpg',
      size: 1000,
      path: '/path/2',
      uri: 'uri2',
      dateModified: DateTime.fromMillisecondsSinceEpoch(2000),
      isSelected: false,
    ); // Newer
    final group = CleanupGroup(
      id: 'g1',
      title: 'img1.jpg',
      totalSize: 2000,
      items: [item1, item2],
    );

    test('toggleSelection toggles the specific item', () {
      controller.setTestState([group]);

      controller.toggleSelection('g1', '1');

      final updatedGroup = controller.state.value!.first;
      expect(updatedGroup.items.first.isSelected, true);
      expect(updatedGroup.items.last.isSelected, false);

      controller.toggleSelection('g1', '1');
      expect(controller.state.value!.first.items.first.isSelected, false);
    });

    test('smartSelect selects all EXCEPT the newest (largest timestamp)', () {
      controller.setTestState([group]);

      controller.smartSelect();

      final updatedGroup = controller.state.value!.first;
      // Item 2 is newer (2000 > 1000), so it should NOT be selected.
      // Item 1 (old) SHOULD be selected.

      final selectedItem = updatedGroup.items.firstWhere((i) => i.id == '1');
      final keptItem = updatedGroup.items.firstWhere((i) => i.id == '2');

      expect(selectedItem.isSelected, true);
      expect(keptItem.isSelected, false);
    });

    test('smartSelect handles multiple old files correctly', () {
      final item3 = CleanupItem(
        id: '3',
        name: 'img1.jpg',
        size: 1000,
        path: '/path/3',
        uri: 'uri3',
        dateModified: DateTime.fromMillisecondsSinceEpoch(500),
        isSelected: false,
      );
      final multiGroup = group.copyWith(items: [item1, item2, item3]);

      controller.setTestState([multiGroup]);
      controller.smartSelect();

      final updatedGroup = controller.state.value!.first;
      // Newest is Item 2 (2000). Item 1 (1000) and Item 3 (500) should be selected.

      expect(
        updatedGroup.items.firstWhere((i) => i.id == '2').isSelected,
        false,
      ); // Keep
      expect(
        updatedGroup.items.firstWhere((i) => i.id == '1').isSelected,
        true,
      ); // Delete
      expect(
        updatedGroup.items.firstWhere((i) => i.id == '3').isSelected,
        true,
      ); // Delete
    });
  });
}
