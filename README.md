# Story - A Kotlin Multiplatform Project

## iOS

To compile the project from Xcode, run `carthage update --platform ios` from the `ios` project directory.

Then you should be able to open `ios/Story.xcodeproj` and run the application.

The [swift tests](iOS/StoryTests/StoryTests.swift) also can be executed from Xcode.

To compile a framework for ios simulator from the command line execute:

```
  > ./gradlew :StoryShared:build
```

To compile the framework for a device use the `device` project property:

```
  > ./gradlew :StoryShared:build -Pdevice=true
```

To run kotlin tests (including the [common ones](StoryShared/src/commonTest/kotlin/CalculatorTest.kt))
on an iOS simulator execute:

```
  > ./gradlew :StoryShared:iosTest
```

By default the `iPhone 8` simulator is used. One can change this setting using the `iosDevice` project property:

```
  > ./gradlew :StoryShared:iosTest -PiosDevice='iPhone 7'
```

## Android

The application can be built and executed on a device or emulator using Android Studio 3.2 or higher.

One can also compile the application and run tests from the command line:

```
   > ./gradlew :android:build
```
