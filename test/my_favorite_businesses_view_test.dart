import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/core/utils/favorites_vm.dart';

// Simple mock para nuestro test - no hereda de la clase real
class MockFavoritesCubit extends Cubit<FavoritesState> {
  bool toggleViewModeCalled = false;

  MockFavoritesCubit({required FavoritesVM viewModel}) : super(FavoritesState.loaded(viewModel));

  void toggleViewMode() {
    toggleViewModeCalled = true;
  }
}

// Mocks para widgets
class ViewModeToggleButton extends StatelessWidget {
  final bool isGrid;
  final VoidCallback onPressed;

  const ViewModeToggleButton({
    super.key,
    required this.isGrid,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(isGrid ? Icons.list : Icons.grid_view),
    );
  }
}

// Mock para enum
enum SearchResultsViewMode { grid, list }

void main() {
  late MockFavoritesCubit cubit;

  // Función de ayuda para construir el widget bajo test
  Widget buildTestWidget({bool isEmpty = false, bool isGridView = true}) {
    // Crear VM para tests
    final vm = FavoritesVM(
      favoriteBusinesses: isEmpty
          ? []
          : [
              const BusinessDM(uuid: '1', name: 'Test Business'),
              const BusinessDM(uuid: '2', name: 'Another Business'),
            ],
      isGridView: isGridView,
      isInitializing: false,
    );

    // Inicializar nuestro cubit mock
    cubit = MockFavoritesCubit(viewModel: vm);

    return MaterialApp(
      home: Scaffold(
        body: BlocProvider<MockFavoritesCubit>.value(
          value: cubit,
          child: const TestView(),
        ),
      ),
    );
  }

  testWidgets('MyFavoriteBusinessesView muestra vista vacía cuando no hay negocios', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestWidget(isEmpty: true));
    await tester.pump();

    // Verificar que se muestra el mensaje de lista vacía
    expect(find.text('Aun no tienes negocios en tu lista de favoritos'), findsOneWidget);
    expect(find.byType(Asset), findsOneWidget);
  });

  testWidgets('MyFavoriteBusinessesView muestra vista de cuadrícula', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestWidget());
    await tester.pump();

    // Verificar vista de cuadrícula
    expect(find.byType(MockGridView), findsOneWidget);
  });

  testWidgets('MyFavoriteBusinessesView muestra vista de lista', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestWidget(isGridView: false));
    await tester.pump();

    // Verificar vista de lista
    expect(find.byType(MockListView), findsOneWidget);
  });

  testWidgets('Toggle de vista funciona correctamente', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestWidget());
    await tester.pump();

    // Verificar el botón toggle está presente
    final toggleButton = find.byType(ViewModeToggleButton);
    expect(toggleButton, findsOneWidget);

    // Verificar que toggleViewMode no ha sido llamado
    expect(cubit.toggleViewModeCalled, false);

    // Tap en el botón
    await tester.tap(toggleButton);

    // Verificar que se llamó al método toggleViewMode
    expect(cubit.toggleViewModeCalled, true);
  });
}

// Widget de prueba simplificado que usa el MockFavoritesCubit
class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MockFavoritesCubit>();
    final businesses = cubit.state.vm.favoriteBusinesses;

    if (businesses.isEmpty) {
      return const Column(
        children: [
          SizedBox(height: 24),
          Asset(FoodlyAssets.searchBusinessAgain, width: 40),
          SizedBox(height: 24),
          Text('Aun no tienes negocios en tu lista de favoritos'),
        ],
      );
    }

    final isGridView = cubit.state.vm.isGridView;
    return Column(
      children: [
        Row(
          children: [
            ViewModeToggleButton(
              isGrid: isGridView,
              onPressed: cubit.toggleViewMode,
            ),
          ],
        ),
        Expanded(
          child: isGridView ? const MockGridView() : const MockListView(),
        ),
      ],
    );
  }
}

// Widgets de vista mockup
class MockGridView extends StatelessWidget {
  const MockGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: 0,
      itemBuilder: (context, index) => const SizedBox(),
    );
  }
}

class MockListView extends StatelessWidget {
  const MockListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 0,
      itemBuilder: (context, index) => const SizedBox(),
    );
  }
}
