
# Lab 04: Navigation and Routing

## TMA3084 Software Engineering Laboratory

### Part 1: Pizza Store App

This Flutter application demonstrates named routes and navigation between different screens.

Features:
- Pizza Store Menu
- Pepperoni Pizza Detail Screen
- Margherita Pizza Detail Screen
- Box of Fries Detail Screen
- Back button navigation

### Part 2: Vibe Coding Task 4 - AI as Pair Programmer

AI was used to develop an Order Summary Screen.

Features:
- Display item name
- Display quantity
- Calculate total price using orderTotal()
- Display total price in RM
- Back button navigation

### Widget Testing

Four widget tests were implemented:

1. Menu displays three items.
2. Tapping a card opens its detail screen.
3. Back button returns to the menu.
4. Order Summary displays RM25.00.

### Running the Application

flutter pub get
flutter run -d chrome

### Testing

flutter analyze
flutter test

### CI/CD

GitHub Actions is used to automatically run Flutter analysis and widget tests.
