import 'package:core/tab/tab.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TabItem', () {
    test('fromName should return an item from String name', () {
      final item = TabItem.fromName('absence');

      expect(item, isA<TabItem>());
      expect(item.title, isNotEmpty);
      expect(item.path, isNotEmpty);
      expect(item.$index, greaterThanOrEqualTo(0));
    });

    test('fromName should return default tab if the name is null', () {
      final item = TabItem.fromName(null);

      expect(item, TabItem.absence);
    });

    test('items should return a list of TabItem', () {
      const items = TabItem.items;

      expect(items, isA<List<TabItem>>());
      expect(items.map((e) => e.title).toList(), isNotEmpty);
    });

    test('title should return the TabItem title', () {
      const item = TabItem.employee;
      expect(item.title, isNotEmpty);
    });
  });
}
