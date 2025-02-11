# 🛍️ oru_ecommerce_app

A Flutter-based eCommerce application designed to provide a seamless shopping experience with efficient state management and local storage.

## 📌 Features
- 🛒 Product listing & details
- 🔍 Search functionality
- 🛑 Cart & wishlist management
- 💳 Secure checkout process
- 🔄 User authentication
- 📦 Order tracking

---

## 🏗️ Architecture
This project follows a **modular architecture** for better scalability and maintainability. The key layers are:

- **Presentation Layer**: Handles UI using Flutter widgets.
- **Business Logic Layer**: Managed by **GetX** and **Provider** for state management.
- **Data Layer**: Handles API calls and local storage (Hive/SharedPreferences).

---

## 🔄 State Management
This project uses a **hybrid approach** for state management:
- **GetX**: Used for navigation, API handling, and reactive UI updates.
- **Provider**: Used for complex state handling in certain parts of the app.
- **Local Storage**: Utilizes **Hive/SharedPreferences** for storing user preferences and cart data.

---

## 🛠️ Setup & Run the Project
Follow these steps to set up and run the project locally:

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/yourusername/oru_ecommerce_app.git
cd oru_ecommerce_app
