#  🚀   RickAndMorty Explorer <br>



## Wymagania <br>


### ⚠️   Wymagane podstawowe

-   Wykorzystanie SwiftUI do budowy interfejsu użytkownika
-   Implementacja obsługi sieci za pomocą Async/Await
-   Zastosowanie dowolnej architektury mobilnej
-   Minimalna wersja systemu docelowego: iOS 15.0

###  👍   Mile widziane

-   Implementacja architektury TCA (The Composable Architecture)
-   Użycie natywnych komponentów interfejsu użytkownika
-   Obsługa błędów podczas komunikacji z API
-   Funkcjonalność dodania postaci do ulubionych
-   Wykorzystanie Dependency Injection
-   Estetyczne i przemyślane stylowanie komponentów
-   Dodatkowe funkcjonalności niewymienione w wymaganiach



##  📝   Opis

Prosta aplikacja pozwalająca na przeglądanie informacji o postaciach i odcinkach z serialu "Rick and Morty". Aplikacja korzysta z publicznego API dostępnego pod adresem: [Rick and Morty API](https://rickandmortyapi.com/documentation/#rest). <br>



## 📁   Struktura Aplikacji

Aplikacja składa się z trzech głównych widoków:

1.  **CharactersListView**: Wyświetla listę postaci i umożliwia sortowanie ich według różnych kryteriów.
2.  **CharacterDetailsView**: Prezentuje szczegółowe informacje o wybranej postaci oraz listę odcinków, w których postać występuje.
3.  **EpisodeDetailsView**: Wyświetla podstawowe informacje o wybranym odcinku oraz liczbę postaci w nim występujących.

Pozostałe pliki zawierają kod odpowiedzialny za logikę aplikacji, zarządzanie danymi, interfejs użytkownika oraz testy jednostkowe.

Nazwy pól, takie jak "Name", "Image", "Location" itp., zostały przetłumaczone na język polski, aby zachować spójność w całej aplikacji i zapewnić, że wszystkie elementy interfejsu użytkownika są w jednym języku. Dzięki temu użytkownicy nie doświadczają niejednoznaczności ani dezorientacji, co poprawia ogólną spójność i użyteczność aplikacji zgodnie z zasadami User Experience (UX). <br>



## 📋   Funkcje

-   Wczytywanie listy postaci z API.
-   Wyświetlanie szczegółowych informacji o postaciach, takich jak status, płeć, pochodzenie, lokalizacja oraz lista odcinków, w których wystąpiła.
-   Wyświetlanie szczegółowych informacji o odcinkach, takich jak data emisji i numer odcinka, wraz z liczbą bohaterów występujących w danym odcinku.
-   Możliwość dodawania i usuwania postaci do/z ulubionych.
-   Sortowanie postaci alfabetycznie, według popularności oraz domyślnie.
-   Obsługa błędów sieciowych i prezentacja komunikatów użytkownikowi. <br>
  


##  🛠️    Technologie i architektura

-   **SwiftUI**: Wykorzystano do budowy interfejsu użytkownika.
-   **Async/Await**: Użyto do obsługi asynchronicznych operacji sieciowych.
-   **UserDefaults**: do przechowywania informacji o ulubionych bohaterach.
-   **MVVM**: Zastosowano architekturę Model-View-ViewModel do separacji logiki biznesowej od interfejsu użytkownika.
-   **Dependency Injection**: Wykorzystano wstrzykiwanie zależności do oddzielenia odpowiedzialności oraz ułatwienia testowania.
-   **Unit Tests**: Zaimplementowano testy jednostkowe sprawdzające funkcjonalności kluczowe aplikacji.
-   **Custom Button Style**: Stworzono niestandardowy styl przycisku do lepszego dopasowania do wyglądu aplikacji.
-   **Natywne komponenty**: Wykorzystano także natywne komponenty SwiftUI, takie jak `List`, `Form`, `NavigationLink`, `Alert`, `ProgressView`, `NavigationView`, `ScrollView`, `Toolbar`, `Button`, `Text`, `Image`, `Spacer`, `GeometryReader`, itp. <br>



## ✅   Wymagania spełnione

-   **SwiftUI**: Aplikacja została w całości zaimplementowana przy użyciu SwiftUI.
-   **Async/Await**: Obsługa operacji sieciowych z wykorzystaniem async/await.
-   **Minimum Deployment Target iOS 15.0**: Aplikacja jest kompatybilna z iOS 15.0 i nowszymi.
-   **Estetyczny UI i dobre praktyki UX**: Interfejs aplikacji jest estetyczny, a obsługa różnych stanów (np. wczytywanie danych, błędy z API) została przemyślana i zaimplementowana zgodnie z dobrymi praktykami UX.
-   **3 widoki**: Zaimplementowano trzy widoki: `CharactersListView`, `CharacterDetailsView`, `EpisodeDetailsView`.
-   **Obsługa błędów**: Aplikacja obsługuje błędy sieciowe i prezentuje użytkownikowi odpowiednie komunikaty w przypadku wystąpienia problemów.
-   **Dodatkowe funkcjonalności Nice to Have**:
    -   Możliwość dodawania i usuwania postaci do/z ulubionych.
    -   Sortowanie postaci wyświetlających się na liscie według różnych kryteriów
    -   Wykorzystanie niestandardowego przycisku.
    -   Stylowanie komponentów interfejsu użytkownika.
    -   Obsługa błędów związanych z API.
    -   Dodane zostały również subtelne animacje, które dodają dynamizmu i interaktywności interfejsowi, podnosząc tym samym poziom użytkowej atrakcyjności aplikacji. <br>



## 🧪   Testy jednostkowe

-   **CharacterModelTests**: Zawiera testy jednostkowe sprawdzające funkcje związane z dodawaniem/usuwaniem postaci do/z ulubionych oraz sortowaniem postaci. <br>



## 💻📱   Wymagania sprzetowe

-   iOS 15.0 lub nowszy.
-   Kompatybilność z iPhone i iPad. <br>



## 🔌   Instrukcja uruchomienia

1.  Sklonuj repozytorium.
2.  Otwórz projekt w Xcode.
3.  Uruchom aplikację na symulatorze lub fizycznym urządzeniu. <br>


##  🖼️   Preview 
