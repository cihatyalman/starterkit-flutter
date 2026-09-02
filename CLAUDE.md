# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

StarterKit — Flutter mobile app (iOS + Android). Feature-based architecture, MVVM design pattern.

Flutter project lives in `starterkit/` subdirectory (not repo root).

## Development Guidelines

- Never start writing code right away when beginning a complex task or feature.
- First, submit a detailed, step-by-step plan to me—which you’ll save in the project’s `plans` folder—and wait for my approval.
- Do not proceed to the coding phase until the plan has been approved.
- Never scan the entire project—only scan the necessary files. Save on tokens.

## Architecture

### Layer Structure

```
lib/
├── main.dart              # App entry, globals: navigatorKey, apiService
├── screens/               # Page-level widgets (route targets)
│   ├── app/               # Splash, onboarding, main shell, app control
│   └── product/           # Product sub-screens
├── features/              # Feature modules (ViewModel + Store + models + widgets)
│   ├── product/
│   └── faq/
├── shared/
│   ├── main_store.dart    # Global singleton MainStore (user, cities, schools)
│   ├── route_generator.dart
│   ├── custom_interceptor.dart
│   ├── models/            # Shared models (BaseModel, ApiResponse, UserModel...)
│   └── constants/         # Colors, text, icons, images, animations, formats
├── services/
│   ├── api/dio.dart       # DioService wrapper
│   ├── storage/hive.dart  # HiveService (local key-value)
│   ├── firebase/          # Analytics, Realtime Database
│   ├── notification/      # OneSignal push notifications
│   ├── state_tools/       # Custom state management (Store, Bloc)
│   └── toolkit/           # Extensions, timer, helper mixins
├── utils/
│   ├── helpers/           # FunctionHelper (hf), ThemeHelper (ht), WidgetHelper
│   └── mixins/            # DesignMixin (spacing, padding, radius helpers)
└── widgets/
    ├── project/           # App-specific widgets (c_appbar, c_input, c_text...)
    └── custom/            # Reusable generic widgets (buttons, popups, overlays...)
```

### State Management — Custom Store System

No third-party state management. Custom `StoreBase<T>` wraps `ValueNotifier` with loading state:

- `StoreData<T>` — single value store
- `StoreList<T>` — list with CRUD by equality
- `StoreDataList<T>` — list with CRUD by `id` field (for BaseModel subclasses)
- `StoreDataRef<T>` / `StoreListRef<T>` / `StoreDataListRef<T>` — keyed map of stores

Usage pattern:

```dart
// In store/viewmodel
final product = StoreData<ProductModel?>.create(null);

// In widget
store.product.listen((data, isLoading) => ...);

// Loading state
store.product.activateLoading;
// ... fetch ...
store.product.deactivateLoading;
```

### Feature Pattern (ViewModel + Store)

Each feature has its own ViewModel class containing a local Store and API methods. **ViewModels must never be singletons** — they are instantiated per usage (e.g., per screen). Detail and form ViewModels define their Store inline (not as a global singleton) to prevent data leakage when multiple instances exist (e.g., stacked detail screens). List ViewModels may use a shared global Store when cross-screen state is needed. ViewModel calls `apiService` (global Dio instance), parses response through `ApiResponse.fromMap(r).checkData()`, then sets store data. ViewModels are responsible for business logic, state management, and UI actions following project conventions.

```dart
class ProductViewModel {
  final store = ProductStore.instance;
  Future<bool> get() async {
    store.product.activateLoading;
    final r = await apiService.get(path: "$mainPath/$productId");
    store.product.deactivateLoading;
    final res = ApiResponse.fromMap(r).checkData();
    if (res.hasError != false) return false;
    store.product.data = ProductModel.fromMap(res.data);
    return true;
  }
}
```

### Models

All domain models extend `BaseModel` (id, createdAt, updatedAt) with `toMap`/`fromMap`/`toJson`/`fromJson`. New models must follow existing project conventions and structure. All properties in `BaseModel` subclasses must be `final`.

### Screens & Widgets

All route target screens must be `StatelessWidget` and follow these conventions:

- Screens live under `lib/screens/<feature>/` and act as layout/composition shells; they must not contain long, monolithic widget trees.
- Modular decomposition: Break complex UI into focused sub-widgets inside `lib/features/<feature>/widgets/` and compose them in the screen.
- Set `static const route = 'PascalCaseScreen'`.
- Call `init()` on the first line inside `build()`.
- Use custom widgets with precedence: `lib/widgets/project/` (prefixed with `c_`) > `lib/widgets/custom/` > native Flutter.
- Use reactive state listening inside widgets: `vm.store.items.listen((items, isLoading) => ...)` to render custom states.

### Feature Structure & Imports

- Each feature directory (`lib/features/<feature>/`) contains a root `exports.dart` file that exports models, viewmodels, services, and widgets.
- `screens/` must import feature components exclusively through `lib/features/<feature>/exports.dart`.
- Files inside `features/<feature>/` must use direct relative imports (e.g., `../models/product_model.dart`) among themselves, not the barrel file.

### API Layer

- `DioService` (global `apiService` in main.dart) — wraps Dio with get/post/put/patch/delete
- `CustomInterceptor` — auto-attaches Bearer token from Hive, handles 401 with silent re-login, shows error toast on 500
- `ApiResponse` — standard response wrapper with `hasError`, `message`, `validationErrors`, `data`. Use `.checkData()` extension to auto-show error/success notifications.
- **Mock API standard**: When a real backend API is not yet available, simulate network calls via `lib/features/<feature>/services/<feature>_mock_api.dart` using `Future.delayed` and returning standard `ApiResponse` objects. Do not hardcode static mock data directly inside UI widgets or ViewModels.

### Key Globals

- `navigatorKey` — global navigator key for context access
- `apiService` — global DioService instance
- `mainStore` — global MainStore singleton
- `hf` — FunctionHelper instance (device ID, URL launcher, school lookup)
- `hw` — WidgetHelper instance (circleLoading, divider)
- `ht` — ThemeHelper instance (theme data)

### Routing

Named routes via `RouteGenerator.generateRoute`. Each screen has a `static const route` string. Platform-aware transitions (iOS: Cupertino push, Android: slide-from-right).

- **All navigation must use the global `navigatorKey`** (defined in `main.dart`), not `Navigator.of(context)`. Example: `navigatorKey.currentState?.pushNamed(...)`, `navigatorKey.currentState?.pop(...)`.
- **Screens that receive data** must accept a `RouteSettings settings` constructor parameter. The `RouteGenerator` case passes the `settings` object both to the screen constructor and to the page route builder. Arguments are read from `settings.arguments` inside the screen. Screens that take no arguments do not receive `settings`.

### Storage

- **Hive** — local key-value via `HiveService.instance`. Keys in `HiveKeys` enum (token, isFirst).
- **Firebase Realtime Database** — for real-time data
- **Firebase Analytics** — screen view tracking on every route change

### Conventions

- Singleton pattern: `static final instance = ClassName._internal()` with private constructor
- Project widgets prefixed with `c_` (c_appbar, c_input, c_text, c_list)
- Extensions in `services/toolkit/extensions.dart` — String↔DateTime, byte conversions
- `DesignMixin` for common padding/shadow helpers
- `must_be_immutable` lint suppressed in analysis_options
- Turkish-language UI strings and error messages
