# Ecomorse - Flutter E-commerce App

A modern Flutter-based e-commerce application that provides a seamless shopping experience with product browsing, cart management, and user authentication.

## 📱 Features

### Core Functionality
- **Product Browsing**: Browse products by categories (All, Men, Women, Other)
- **Category Filtering**: Filter products by Electronics, Jewelry, Men's clothing, Women's clothing
- **Product Details**: View detailed product information with images and descriptions
- **Shopping Cart**: Add products to cart with quantity management
- **User Authentication**: Sign in/Sign up functionality with profile management
- **Sorting**: Sort products in ascending/descending order

### User Interface
- **Modern Design**: Clean and intuitive UI with custom fonts and colors
- **Bottom Navigation**: Easy navigation between Home, Cart, Favorites, and Profile
- **Responsive Layout**: Optimized for different screen sizes
- **Custom Widgets**: Reusable components for consistent design

## 🛠️ Technology Stack

- **Framework**: Flutter 3.4.4+
- **Language**: Dart
- **State Management**: StatefulWidget with setState
- **HTTP Client**: http package for API calls
- **Local Storage**: SharedPreferences for user session management
- **Icons**: Iconsax for modern iconography

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  http: ^1.2.2
  iconsax: ^0.0.8
  shared_preferences: ^2.3.1
  flutter_launcher_icons: ^0.13.1
```

## 🏗️ Project Structure

```
lib/
├── Screens/
│   ├── categry/           # Category-specific screens
│   │   ├── allproduct.dart
│   │   ├── categroy.dart
│   │   ├── desc.dart
│   │   └── man_woman.dart
│   ├── login/             # Authentication screens
│   ├── cart_screen.dart   # Shopping cart interface
│   ├── home_screen.dart   # Main product browsing
│   └── loginscreen.dart   # User authentication
├── Widget/
│   └── widget_i_need_it.dart  # Reusable UI components
├── constants/
│   └── AppConstants.dart      # App-wide constants and variables
├── model/
│   ├── get_all_prodacts.dart  # Product model
│   ├── get_cart.dart          # Cart model
│   ├── get_desc.dart          # Product description model
│   └── [other models]         # Additional data models
└── main.dart                  # App entry point
```

## 🌐 API Integration

The app integrates with the **Fake Store API** (https://fakestoreapi.com/) for:
- Product catalog management
- User authentication
- Shopping cart operations
- Category filtering

### API Endpoints Used:
- `GET /products` - Fetch all products
- `GET /products/categories` - Get product categories
- `GET /products/category/{category}` - Filter by category
- `GET /products/{id}` - Get product details
- `POST /auth/login` - User authentication
- `GET /carts/user/{userId}` - User's cart items
- `POST /carts` - Add items to cart

## 🎨 Design Features

### Color Scheme
- **Primary Blue**: `#7d99fd`
- **Light Blue**: `#ecf0ff`
- **White**: `#ffffff`
- **Black**: `#01030a`

### Custom Fonts
- **Pacifico Regular**: Primary decorative font
- **Kemio Semi-Expanded**: Secondary font
- **Mont Heavy**: Bold accent font

### Assets
- **Images**: 30+ product images in `assets/image/`
- **Icons**: Custom app icon in `assets/icon/`
- **Fonts**: Custom typography in `assets/font/`

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.4.4 <4.0.0)
- Dart SDK
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd ecom
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate app icons**
   ```bash
   flutter pub run flutter_launcher_icons:main
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Platform Support
- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 📱 App Screens

### Home Screen
- Product grid with category filtering
- Search and sort functionality
- Category navigation bar
- Trending products section

### Cart Screen
- Cart item management
- Quantity adjustment
- Product details with images
- Price calculation

### Profile Screen
- User authentication
- Profile information display
- Sign in/Sign up options
- Social login integration (Google, Apple)

### Category Screens
- Filtered product views
- Category-specific layouts
- Product detail navigation

## 🔧 Configuration

### App Configuration
- **App Name**: Ecomorse
- **Bundle ID**: Configurable per platform
- **Version**: 1.0.0+1

### API Configuration
The app uses Fake Store API endpoints. No API key required for basic functionality.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 👨‍💻 Developer

**Axon Plus** - Mobile Developer

## 🐛 Known Issues

- Favorite functionality is not yet implemented
- Cart quantity adjustment buttons are not functional
- Some UI elements need responsive improvements

## 🔮 Future Enhancements

- [ ] Implement favorites/wishlist functionality
- [ ] Add payment gateway integration
- [ ] Implement push notifications
- [ ] Add product reviews and ratings
- [ ] Enhance search functionality
- [ ] Add offline support
- [ ] Implement dark mode theme

## 📞 Support

For support and questions, please open an issue in the GitHub repository.

---

**Made with ❤️ using Flutter**
