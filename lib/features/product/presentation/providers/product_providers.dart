import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failures.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../notifications/data/notification_service.dart';
import '../../data/product_repository.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/product_enums.dart';

final productRepositoryProvider =
    Provider<ProductRepository>((ref) => ProductRepository());

final notificationServiceProvider =
    Provider<NotificationService>((ref) => NotificationService());

/// Live inventory for the signed-in user.
final inventoryStreamProvider = StreamProvider<List<Product>>((ref) {
  final user = ref.watch(currentUserProvider);
  if (user == null) return const Stream.empty();
  return ref.watch(productRepositoryProvider).watchProducts(user.uid);
});

/// Home-screen filter selection.
enum InventoryFilter { all, fresh, expiringSoon, expired }

final inventoryFilterProvider =
    StateProvider<InventoryFilter>((ref) => InventoryFilter.all);

final searchQueryProvider = StateProvider<String>((ref) => '');

/// Derived, filtered + searched list for display.
final filteredInventoryProvider = Provider<AsyncValue<List<Product>>>((ref) {
  final async = ref.watch(inventoryStreamProvider);
  final filter = ref.watch(inventoryFilterProvider);
  final query = ref.watch(searchQueryProvider).trim().toLowerCase();

  return async.whenData((products) {
    var list = products.where((p) {
      switch (filter) {
        case InventoryFilter.all:
          return true;
        case InventoryFilter.fresh:
          return p.status == ProductStatus.fresh;
        case InventoryFilter.expiringSoon:
          return p.status == ProductStatus.expiringSoon;
        case InventoryFilter.expired:
          return p.status == ProductStatus.expired;
      }
    });
    if (query.isNotEmpty) {
      list = list.where((p) =>
          p.productName.toLowerCase().contains(query) ||
          (p.brand?.toLowerCase().contains(query) ?? false));
    }
    return list.toList();
  });
});

/// Summary counts for the home header.
class InventorySummary {
  const InventorySummary({
    required this.total,
    required this.expiringSoon,
    required this.expired,
  });
  final int total;
  final int expiringSoon;
  final int expired;
}

final inventorySummaryProvider = Provider<InventorySummary>((ref) {
  final products = ref.watch(inventoryStreamProvider).valueOrNull ?? const [];
  final active = products.where((p) => p.status != ProductStatus.consumed);
  return InventorySummary(
    total: active.length,
    expiringSoon:
        active.where((p) => p.status == ProductStatus.expiringSoon).length,
    expired: active.where((p) => p.status == ProductStatus.expired).length,
  );
});

/// Handles create/update/delete plus notification (re)scheduling.
class ProductController extends StateNotifier<AsyncValue<void>> {
  ProductController(this._repo, this._notifications, this._ref)
      : super(const AsyncData(null));

  final ProductRepository _repo;
  final NotificationService _notifications;
  final Ref _ref;

  Future<bool> save(Product product) async {
    state = const AsyncLoading();
    final user = _ref.read(currentUserProvider);
    final isPremium = user?.isPremium ?? false;

    final res = await _repo.addProduct(product, isPremium: isPremium);
    switch (res) {
      case Success(:final value):
        final ids = await _notifications.scheduleForProduct(value);
        await _repo.updateProduct(value.copyWith(notificationIds: ids));
        state = const AsyncData(null);
        return true;
      case Err(:final failure):
        state = AsyncError(failure, StackTrace.current);
        return false;
    }
  }

  Future<bool> update(Product product) async {
    state = const AsyncLoading();
    await _notifications.cancelForProduct(product);
    final ids = await _notifications.scheduleForProduct(product);
    final res = await _repo.updateProduct(
      product.copyWith(notificationIds: ids),
    );
    return _settle(res);
  }

  Future<bool> delete(Product product) async {
    state = const AsyncLoading();
    await _notifications.cancelForProduct(product);
    final res = await _repo.deleteProduct(product.userId, product.id);
    return _settle(res);
  }

  Future<bool> markConsumed(Product product, bool consumed) async {
    state = const AsyncLoading();
    if (consumed) await _notifications.cancelForProduct(product);
    final res = await _repo.markConsumed(product, consumed);
    if (!consumed && res.isSuccess) {
      await _notifications.scheduleForProduct(product);
    }
    return _settle(res);
  }

  bool _settle(Result<void> res) {
    switch (res) {
      case Success():
        state = const AsyncData(null);
        return true;
      case Err(:final failure):
        state = AsyncError(failure, StackTrace.current);
        return false;
    }
  }
}

final productControllerProvider =
    StateNotifierProvider<ProductController, AsyncValue<void>>((ref) {
  return ProductController(
    ref.watch(productRepositoryProvider),
    ref.watch(notificationServiceProvider),
    ref,
  );
});
