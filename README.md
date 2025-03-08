# Notica

Notica is a Flutter notes app that demonstrates a modern, polished design with secure storage, state management, and smooth animations. The app adapts its appearance based on the device's light or dark mode, features biometric authentication, and supports CRUD operations with search functionality.

## Features

- **Secure Notes:** Encrypted local storage using SQLCipher.
- **State Management:** Robust state management with Provider.
- **Theming:** Customizable light and dark themes with vibrant, colorful accents.
- **Smooth Animations:** Subtle fade, slide, and scale animations for a professional feel.
- **Biometric Authentication:** Fingerprint authentication using `local_auth`.
- **CRUD & Search:** Create, read, update, delete, and search notes effortlessly.


## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- A configured device or emulator for Flutter development.
- For biometric authentication, ensure your device/emulator has fingerprint(s) enrolled.
- Update AndroidManifest.xml and Info.plist with the necessary permissions for biometric authentication.

### Installation

1. **Clone the Repository:**

   ```bash
   git clone <repository-url>
   cd notica
   flutter pub get
   flutter run
   ```

### Dependencies
- Provider – State management.
- sqflite_sqlcipher – Encrypted local storage.
- local_auth – Biometric authentication.
- Google Fonts – Custom fonts.
- intl – Date formatting.
