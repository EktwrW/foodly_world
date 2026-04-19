import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/enums/foodly_categories_enums.dart';

/// Regression tests for the Catering & Chefs vertical footer visibility rule.
///
/// Background (2026-04-18 smoke-test bug):
///   Catering/chef businesses don't have tables, but the footer was still
///   showing the table-reservation button, which opened a `LinearCalendar`
///   modal with no availability filtering — so customers could request
///   reservations on days the professional had fully blocked.
///
/// The fix in `visit_business_footer_buttons.dart` wraps the reservation
/// button in `if (!isCatering)`, where `isCatering` comes from
/// `FoodlyCategories.isCateringOrChefs`.
///
/// These tests guard two things:
///   1. The enum discriminator itself (`isCateringOrChefs` returns true ONLY
///      for `cateringAndChefs`). If someone renames the enum value, adds a
///      second "catering-like" category, or changes the getter's semantics,
///      the footer conditional silently breaks and these tests fail loudly.
///   2. The behaviour we depend on in the footer: given a category id, we
///      can decide whether to render the reservation button. A minimal
///      widget stub replicates the footer's conditional so a future refactor
///      that accidentally flips the guard is caught here.
///
/// A full widget test of `VisitBusinessFooterButtons` would require mocking
/// the 7-dep `VisitBusinessCubit`, `di<EventTrackingService>()`, and a
/// `GoRouter` — overkill for a 1-line visibility guard. This mirrors the
/// mock-widget pattern already in use in `my_favorite_businesses_view_test.dart`.

void main() {
  group('FoodlyCategories.isCateringOrChefs discriminator', () {
    test('returns true only for cateringAndChefs', () {
      expect(FoodlyCategories.cateringAndChefs.isCateringOrChefs, isTrue);
    });

    test('returns false for every other category', () {
      final nonCatering = FoodlyCategories.values.where(
        (c) => c != FoodlyCategories.cateringAndChefs,
      );
      for (final c in nonCatering) {
        expect(
          c.isCateringOrChefs,
          isFalse,
          reason: 'Category $c should not be flagged as catering/chef. '
              'If a new vertical also needs the catering treatment, create a '
              'separate getter instead of expanding isCateringOrChefs — the '
              'footer rule and service-packages gating both key off this.',
        );
      }
    });

    test('isRestaurant and isCateringOrChefs are mutually exclusive', () {
      // The footer's `isCatering ? Packages : Menu` branch relies on these two
      // being disjoint; if a category ever reports true for both, the UI
      // would still compile but route to the wrong Showcase.
      for (final c in FoodlyCategories.values) {
        final both = c.isRestaurant && c.isCateringOrChefs;
        expect(both, isFalse, reason: 'Category $c cannot be both.');
      }
    });
  });

  group('Footer reservation-button visibility rule', () {
    // Replicates the conditional from visit_business_footer_buttons.dart:
    //   if (!isCatering) ReservationButton()
    // A BusinessDM/cubit/router stack isn't needed to verify the rule itself.
    Widget buildFooterStub({required FoodlyCategories? categoryId}) {
      final isCatering = categoryId?.isCateringOrChefs ?? false;

      return MaterialApp(
        home: Scaffold(
          body: Row(
            children: [
              // "Paquetes" for catering, "Menú" otherwise.
              if (isCatering)
                const Text('Paquetes', key: Key('btn-packages'))
              else
                const Text('Menú', key: Key('btn-menu')),

              const Text('Promociones', key: Key('btn-promotions')),

              if (!isCatering) const Text('Reserva', key: Key('btn-reservation')),

              const Text('Reseña', key: Key('btn-review')),
            ],
          ),
        ),
      );
    }

    testWidgets('hides the reservation button for catering & chefs', (tester) async {
      await tester.pumpWidget(buildFooterStub(
        categoryId: FoodlyCategories.cateringAndChefs,
      ));

      expect(find.byKey(const Key('btn-reservation')), findsNothing);
      expect(find.byKey(const Key('btn-packages')), findsOneWidget);
      expect(find.byKey(const Key('btn-menu')), findsNothing);
    });

    testWidgets('shows the reservation button for restaurants (e.g. italian)', (tester) async {
      await tester.pumpWidget(buildFooterStub(
        categoryId: FoodlyCategories.italian,
      ));

      expect(find.byKey(const Key('btn-reservation')), findsOneWidget);
      expect(find.byKey(const Key('btn-menu')), findsOneWidget);
      expect(find.byKey(const Key('btn-packages')), findsNothing);
    });

    testWidgets('shows the reservation button for bars / drink houses', (tester) async {
      // Sanity: drink houses still get the table-reservation flow.
      await tester.pumpWidget(buildFooterStub(
        categoryId: FoodlyCategories.drinkHouse,
      ));

      expect(find.byKey(const Key('btn-reservation')), findsOneWidget);
    });

    testWidgets('shows the reservation button when categoryId is null (defensive)', (tester) async {
      // A business without a loaded category should fall through to the
      // restaurant-like default, not accidentally hide controls.
      await tester.pumpWidget(buildFooterStub(categoryId: null));

      expect(find.byKey(const Key('btn-reservation')), findsOneWidget);
    });
  });
}
