# Just Play Demo

![screenshot_0](https://i.ibb.co/3hqtTLx/Simulator-Screenshot-i-Phone-15-2023-10-18-at-16-21-57.png)
![screenshot_1](https://i.ibb.co/vwtXyzM/Simulator-Screenshot-i-Phone-15-2023-10-18-at-16-22-29.png)
![screenshot_2](https://i.ibb.co/Rgyfq8w/Simulator-Screenshot-i-Phone-15-2023-10-18-at-16-22-32.png)
![screenshot_3](https://i.ibb.co/FJ8TwFy/Simulator-Screenshot-i-Phone-15-2023-10-18-at-16-22-37.png)
![screenshot_4](https://i.ibb.co/XDSnCGw/Simulator-Screenshot-i-Phone-15-2023-10-18-at-16-22-43.png)

Welcome to the "Just Play Demo" Flutter app repository! This repository contains the source code for the demo app that I was tasked to build as a technical test.
## Prerequisites

Before you begin, make sure you have the following prerequisites installed on your system:

- [Flutter](https://flutter.dev/)
- [FVM (Flutter Version Management)](https://github.com/leoafarias/fvm)
- [Dart](https://dart.dev/)

## Getting Started

1. **Clone the Repository:**

```git clone https://github.com/joselicht90/JustPlay_Demo.git```

2. **Change Directory:**

```cd JustPlay_Demo```

3. **Install Flutter SDK using FVM:**

If you have FVM installed, you can set up the required Flutter version for this project using the following command: 

```fvm use```

This will use the Flutter version specified in the `.fvmrc` file in the project directory.

If you haven't set up FVM, you can install Flutter manually using:

```flutter pub get```

5. **Run the App:**

Now, you can start the app locally using:

```flutter run``` or ```fvm flutter run``` if using fvm.

This command will build and run the app on your connected device or emulator.

# App Architecture

## Overview

The "Just Play Demo" Flutter app is built using a well-organized architecture that separates concerns and promotes maintainability and scalability. It follows the principles of Clean Architecture and is structured into two main layers: Data Layer and Presentation Layer.

### Why the Domain Layer Matters

Although our app may seem simple, it's important to recognize the potential value of a Domain Layer in a more complex application. A Domain Layer typically defines the business logic of the app, providing a clear and abstract view of the application's core functionality. In this case as it is a demo, I didn't feel that implementing the domain layer would be a benefit for time constraints.

## Layers

### Data Layer

The Data Layer is responsible for handling data-related operations and communication with external services. It is further divided into the following components:

#### Models

- Defines data structures used throughout the app, including request and response models.

#### Repositories

- Provides a clean API for data access and acts as an abstraction layer for data sources.

#### Global BLoCs (Business Logic Components)

- Manages app-wide state, such as user authentication or theme changes.

#### Services (API Calls with Retrofit)

- Handles communication with external APIs and data sources, such as RESTful services.

### Presentation Layer

The Presentation Layer is responsible for rendering the user interface and managing UI state using the BLoC pattern. Key libraries and tools used in this layer include:

- BLoC (Business Logic Component): Manages UI state and business logic, separating presentation from data management.

- Injectable: A dependency injection library for managing and injecting dependencies into your app, enhancing testability and modularity.

- GoRouter: A declarative, navigation and routing library that simplifies navigating through app screens.

- JsonSerializable: A code generation library that generates JSON serialization and deserialization code for your data models.

## Conclusion

The architecture of the "Just Play Demo" app promotes clean code, maintainability, and scalability. It separates concerns, allowing you to focus on specific aspects of your app's functionality. While it may seem like overkill for a simple app, it sets the stage for future development and ensures a clear and maintainable codebase.

   
