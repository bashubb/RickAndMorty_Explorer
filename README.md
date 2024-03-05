#  🚀   RickAndMorty Explorer <br>


## 📝 Description

A simple application allowing users to browse information about characters and episodes from the "Rick and Morty" series. The app utilizes a public API available at: [Rick and Morty API](https://rickandmortyapi.com/).

## 📁 Application Structure

The application consists of three main views:

-   **CharactersListView:** Displays a list of characters and allows sorting them by various criteria.
-   **CharacterDetailsView:** Presents detailed information about the selected character and a list of episodes in which the character appears.
-   **EpisodeDetailsView:** Displays basic information about the selected episode along with the number of characters appearing in it.

Other files contain code responsible for application logic, data management, user interface, and unit tests.

Field names such as "Name", "Image", "Location", etc., have been translated into Polish to maintain consistency throughout the application and ensure that all UI elements are in one language. This prevents ambiguity or confusion, improving overall coherence and usability according to User Experience (UX) principles.

## 📋 Features

-   Loading character list from API.
-   Displaying detailed information about characters, such as status, gender, origin, location, and a list of episodes they appeared in.
-   Displaying detailed information about episodes, such as air date, episode number, along with the count of characters in that episode.
-   Ability to add and remove characters from favorites (Information is permanently stored in device memory).
-   Alphabetical, popularity, and default sorting of characters.
-   Handling network errors and presenting messages to the user.

## 🛠️ Technologies and Architecture

-   SwiftUI: Used for building the user interface.
-   Async/Await: Utilized for handling asynchronous network operations.
-   UserDefaults: Used for storing information about favorite characters.
-   MVVM: Implemented Model-View-ViewModel architecture for separating business logic from the user interface.
-   Dependency Injection: Utilized for dependency separation and facilitating testing.
-   Unit Tests: Implemented unit tests checking key application functionalities.
-   Custom Button Style: Created a custom button style for better integration with the application's look.
-   Native Components: Also utilized native SwiftUI components such as List, Form, NavigationLink, Alert, ProgressView, NavigationView, ScrollView, Toolbar, Button, Text, Image, Spacer, GeometryReader, etc.

## Implementation Details

-   SwiftUI: The application is entirely implemented using SwiftUI.
-   Async/Await: Network operations are handled using async/await.
-   Minimum Deployment Target iOS 15.0: The application is compatible with iOS 15.0 and newer.
-   Aesthetic UI and Good UX Practices: The application interface is aesthetic, and handling various states (e.g., data loading, API errors) is well thought out and implemented according to good UX practices.
-   3 Views: Three views are implemented: CharactersListView, CharacterDetailsView, EpisodeDetailsView.
-   Error Handling: The application handles network errors and presents appropriate messages to the user.

## Additional Functionalities:

-   Ability to add and remove characters from favorites.
-   Sorting characters displayed on the list by various criteria.
-   Utilization of a custom button.
-   Styling user interface components.
-   Handling API-related errors. (User receives information through an Alert)
-   Subtle animations have also been added to add dynamism and interactivity to the interface, thereby enhancing the application's user attractiveness.

## 🧪 Unit Tests

-   **CharacterModelTests:** Contains unit tests checking functions related to adding/removing characters from favorites and sorting characters.

## 💻📱 Hardware Requirements

-   iOS 15.0 or newer.
-   Compatibility with iPhone and iPad.

## 🔌 Setup Instructions

1.  Clone the repository.
2.  Open the project in Xcode.
3.  Run the application on the simulator or a physical device.

##  🖼️ Preview

<img src="https://github.com/bashubb/RickAndMorty_Explorer/blob/main/animation.gif" width="40%" height="40%">

## 🎯 Future Features

In future plans for the application, there is an interest in implementing text translation using the String localization mechanism. I would like to allow users to use the application in different languages, ensuring accessibility and usability on a broader scale.
