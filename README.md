# User Profile Management App

This is a **Flutter-based application** designed to manage user profiles. It allows users to perform CRUD (Create, Read, Update, Delete) operations on user data. The app integrates with a REST API (`jsonplaceholder.typicode.com`) to fetch and manipulate user data, and it also uses **SharedPreferences** for offline data storage.

---

## Key Features

1. **Add User**: Users can add new profiles with details like name, email, phone, website, and username.
2. **Update User**: Existing user profiles can be edited and updated.
3. **Delete User**: Users can be removed from the list.
4. **Offline Support**: The app caches user data locally using SharedPreferences, allowing users to view saved data even when offline.
5. **Theme Support**: The app supports both light and dark themes, which can be toggled dynamically.
6. **Responsive Design**: The app uses `flutter_screenutil` for responsive UI across different screen sizes.

---

## Project Structure

### 1. **Main Entry Point (`main.dart`)**
   - Initializes the app and sets up the theme (light/dark) based on system preferences.
   - Uses `AdaptiveTheme` for dynamic theme switching.
   - Initializes `SharedPreferences` for local data storage.

### 2. **Screens**
   - **Home Screen (`home_screen.dart`)**
     - Displays a list of users fetched from the API or local storage.
     - Supports offline mode with a fallback UI when no internet connection is available.
     - Allows users to add new profiles or load cached data when offline.
   - **Add User Screen (`addUserScreen.dart`)**
     - A form to add new users with fields for name, email, phone, website, and username.
     - Validates input and posts data to the API.
   - **Details Screen (`details_screen.dart`)** 
     - Displays detailed information about a selected user.
     - Shows fields like name, email, phone, website, and username.
     - May include additional details like address and company information if available in the UserModel.
     - Provides navigation options to edit or delete the user.
   - **Update User Screen (`update_user_screen.dart`)**
     - Allows editing of existing user profiles.
     - Updates the user data both locally and on the API.

### 3. **Widgets**
   - **Custom App Bar (`app_bar.dart`)**
     - A reusable app bar component with support for back navigation and theme toggling.
   - **Custom Button (`custom_button.dart`)**
     - A reusable button widget with customizable text, icon, and colors.
   - **Custom Text Field (`textField.dart`)**
     - A reusable text input field with validation and dynamic icons based on the input type (e.g., email, phone).

### 4. **Services**
   - **User Services (`user_services.dart`)**
     - Handles API calls for fetching, adding, updating, and deleting users.
     - Uses `Dio` for HTTP requests.
     - Synchronizes data with local storage using `SharedPreferences`.
   - **SharedPreferences Controller (`shared_pref_controller.dart`)**
     - Manages local storage for user data.
     - Saves and retrieves user data in JSON format.

### 5. **Models**
   - **User Model (`user_model.dart`)**
     - Defines the structure of a user profile, including fields like `id`, `name`, `email`, `phone`, `website`, and nested objects for `address` and `company`.
     - Provides methods to convert between JSON and Dart objects.

### 6. **Themes**
   - **Light Theme (`light_theme.dart`)**
     - Defines the light theme for the app, including colors, fonts, and UI components.
   - **Dark Theme (`dark_theme.dart`)**
     - Defines the dark theme for the app, with a focus on dark mode colors and styling.
   - **Theme Controller (`theme_controller.dart`)**
     - Manages theme switching between light and dark modes.

### 7. **Utilities**
   - **Colors (`colors.dart`)**
     - Defines a set of custom colors used throughout the app.
   - **Font Themes (`font_theme.dart`)**
     - Provides predefined text styles for headers, body text, and other UI elements.

---

## Key Functionality

### 1. **Adding a User**
   - The `AddUserScreen` collects user input and validates it.
   - On successful validation, the data is sent to the API via `UserServices.addUser()`.
   - The new user is also saved to local storage for offline access.

### 2. **Updating a User**
   - The `UpdateUserScreen` pre-fills the form with existing user data.
   - On submission, the updated data is sent to the API via `UserServices.editUser()`.
   - The local storage is also updated to reflect the changes.

### 3. **Deleting a User**
   - Users can be deleted from the home screen.
   - The deletion is reflected both on the API and in local storage.

### 4. **Offline Mode**
   - When offline, the app displays a fallback UI with an option to load cached data.
   - Users can view saved profiles but cannot add, update, or delete them without an internet connection.

### 5. **Theme Switching**
   - The app supports dynamic theme switching between light and dark modes.
   - The theme preference is saved and applied across app restarts.

---

## Dependencies

The project uses the following key dependencies:
- **flutter_screenutil**: For responsive UI design.
- **dio**: For making HTTP requests to the API.
- **shared_preferences**: For local data storage.
- **adaptive_theme**: For dynamic theme switching.
- **skeletonizer**: For displaying loading skeletons while data is being fetched.

---

## Conclusion
This project demonstrates a clean and modular approach to building a Flutter app with CRUD functionality, offline support, and dynamic theming. It leverages modern Flutter practices and libraries to create a responsive and user-friendly experience.

## Output

### Screenshots
<p align="center"><img src="https://github.com/user-attachments/assets/c9253f10-bde7-41c9-80f9-c290564e2b21"  alt="Home" height="844" width="431.38"/></p>
<p align="center"><img src="https://github.com/user-attachments/assets/3fbd08dd-5af5-45e0-9676-4f3a167c7509"  alt="Home" height="844" width="431.38"/></p>
<p align="center"><img src="https://github.com/user-attachments/assets/06d43eec-57f5-4906-a630-b628198b08ee"  alt="Details" height="844" width="431.38"/></p>
<p align="center"><img src="https://github.com/user-attachments/assets/2d430ca3-96bc-400e-b425-b51641fe9050"  alt="Details" height="844" width="431.38"/></p>
<p align="center"><img src="https://github.com/user-attachments/assets/f4a9e5b8-e44a-4d0d-ad68-e7f41ca3e171"  alt="Edit" height="844" width="431.38"/></p>
<p align="center"><img src="https://github.com/user-attachments/assets/e186f43e-d0ef-45e9-a4dd-da6a2120b4ed"  alt="Add" height="844" width="431.38"/></p>

### Video

https://drive.google.com/file/d/1lARIEML571ZFkrW8r8pL9aH7cGyFnnQU/view?usp=sharing