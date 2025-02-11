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
- 🎨 **Smooth UI/UX with Responsive Design**: Optimized for different screen sizes.
- 🛠️ **Reusable Widgets**: Modular components for better code maintainability.




### 1️⃣ Clone the Repository

```bash
git clone https://github.com/yuvaraj8080/oru_ecommerce_app.git
cd oru_ecommerce_app
