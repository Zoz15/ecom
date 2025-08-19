## Ecomorse – Flutter E‑Commerce Demo

Modern Flutter e‑commerce demo app powered by the Fake Store API. Browse products, filter by categories, view rich product details, manage cart, and try basic auth flows (sign in / sign up) with simple local persistence.

### ✨ Features

- **Product listing**: Grid of products with images, price, and title.
- **Categories**: All, Men, Women, and Electronics/Jewelery filters.
- **Sort/Desc**: Toggle to view descending sorted items.
- **Product details**: Image gallery hero animation, rating, read‑more description, size and color selectors, price and strikethrough compare price.
- **Cart**: Add to cart, view cart items and quantities.
- **Auth**: Sign in (Fake Store API), simple sign up flow, and profile screen reading user details.
- **Local storage**: Persists username/password flag using `shared_preferences`.
- **Theming & icons**: Custom colors, fonts, and `iconsax` icons.

### 📱 Screenshots

<div>

![Home](Simulator%20Screenshot%20-%20iPhone%2016%20Plus%20-%202025-08-19%20at%2019.09.50.png)

![Categories](Simulator%20Screenshot%20-%20iPhone%2016%20Plus%20-%202025-08-19%20at%2019.10.23.png)

![Details](Simulator%20Screenshot%20-%20iPhone%2016%20Plus%20-%202025-08-19%20at%2019.10.31.png)

![Cart](Simulator%20Screenshot%20-%20iPhone%2016%20Plus%20-%202025-08-19%20at%2019.11.10.png)

![Auth/Profile](Simulator%20Screenshot%20-%20iPhone%2016%20Plus%20-%202025-08-19%20at%2019.11.22.png)

</div>

### 🧱 Tech stack

- **Flutter**: SDK constraint `>=3.4.4 <4.0.0`
- **HTTP**: `http` for REST calls
- **Storage**: `shared_preferences`
- **Icons**: `iconsax`
- **Linting**: `flutter_lints`

### 🌐 API

- **Data source**: [Fake Store API](https://fakestoreapi.com)
- **Endpoints used**:
  - `GET /products` – all products
  - `GET /products?sort=desc` – descending products
  - `GET /products/categories` – categories
  - `GET /products/category/{name}` – category products
  - `GET /products/{id}` – product details
  - `POST /auth/login` – login
  - `GET /users/{id}` – user details
  - `POST /users` – create user
  - `GET /carts/user/{id}` – user cart
  - `POST /carts` – add to cart

### 🚀 Getting started

1. **Prerequisites**
   - Flutter SDK (3.4.x recommended)
   - Xcode (for iOS) / Android Studio (for Android)
2. **Install dependencies**

```bash
flutter pub get
```

3. **Run**

```bash
# iOS (simulator)
flutter run -d ios

# Android (emulator/device)
flutter run -d android

# Web (optional if enabled)
flutter run -d chrome
```

### 📂 Project structure (key parts)

```text
lib/
  main.dart                        # App entry, bottom navigation
  constants/AppConstants.dart      # Colors, global state, prefs helpers
  model/                           # API models and REST calls
    get_form_api.dart              # All HTTP calls to Fake Store API
  Screens/
    home_screen.dart               # Home with category bar and content
    cart_screen.dart               # Cart list with quantity controls
    details_screen.dart            # Product detail, size/color, add to cart
    loginscreen.dart               # Profile / login landing
    login/                         # Sign in / sign up flows
  Widget/widget_i_need_it.dart     # Shared UI widgets (helpers)
assets/
  image/                           # App imagery used across screens
```

### ⚙️ Configuration

- **Fonts**: Declared in `pubspec.yaml` under `fonts`.
- **Assets**: Image assets registered under `assets/image/`.
- **Launcher icon**: Managed via `flutter_launcher_icons` using `assets/icon/icon.jpeg`.

### 🧪 Notes & limitations

- This app is for demo/learning; auth and user flows are simplified.
- API responses and images come from the public Fake Store API and may change.
- Basic state is stored in memory with minimal persistence via `shared_preferences`.

### 🙌 Credits

- Data: [Fake Store API](https://fakestoreapi.com)
- Design/dev: Axon

### 📝 License

No license file provided. Add a license if you plan to distribute.
