# 🛍️ ORU Phone App

A Flutter-based ORU Phone  application designed to provide a seamless shopping experience.

## 🔄 State Management

### 🔹 **GetX**
- Lightweight and fast state management.
- Manages dependency injection, routing, and state updates efficiently.

### 🔹 **Provider**
- Used for complex state handling and api integration.
- Ideal for sharing state across multiple widgets.

## 🗂️ Local Storage
- **SharedPreferences**: Used for storing small key-value pairs like [Cookies Tokens]

## 🏗️ Architecture
This project follows a **modular architecture** for better scalability and maintainability. The key layers are:

- **Presentation Layer**: Handles UI using Flutter widgets.
- **Business Logic Layer**: Managed by **GetX** and **Provider** for state management.
- **Data Layer**: Handles API calls and local storage (Hive/SharedPreferences).
- ![MVVM Architecture](assets/images/products/img.png)





## 📌 Features
- 📦 **List of Products**: Displays all available products.
- 🗺️ **Google Map Integration**: Shows product locations on the map.
- 🔍 **Sorting, Searching, and Filtering**: Helps users find products easily.
- 🔑 **Authentication**: Secure user login and signup.

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
