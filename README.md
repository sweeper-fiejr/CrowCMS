# SwiftResponders ⚡

![SwiftUI](https://img.shields.io/badge/SwiftUI-Compatible-blue)
![iOS](https://img.shields.io/badge/iOS-15+-lightgrey)
![Reactive](https://img.shields.io/badge/Reactive-Programming-orange)

A reactive responder chain implementation for SwiftUI, making complex UI interactions simple and declarative.

## Traditional vs SwiftResponders

**Before - Complex Coordinator Pattern:**
```swift
class ComplexCoordinator: ObservableObject {
    @Published var navigationPath: [Route] = []
    @Published var modal: ModalType?
    @Published var alert: AlertType?
    // State management hell continues...
}
```

**After - Clean Responder Chain:**
```swift
struct ContentView: View {
    @Responder var responder
    
    var body: some View {
        Button("Login") {
            responder.send(.loginTapped)
        }
        .handleEvent(.loginTapped) {
            // Automatically handled by chain
        }
    }
}
```

## Features

- **Declarative Event Handling** - No more massive coordinators
- **Type-Safe Events** - Compile-time event safety
- **Responder Chain** - Natural iOS-like event flow
- **SwiftUI Native** - Designed for SwiftUI from ground up
- **Testing Friendly** - Easy to test event flows

## Quick Start

```swift
import SwiftUI
import SwiftResponders

// 1. Define your app events
enum AppEvent {
    case userDidLogin(User)
    case showProfile(User)
    case presentAlert(AlertConfig)
}

// 2. Create responder-aware view
struct ContentView: View {
    @Responder var responder
    
    var body: some View {
        VStack {
            Button("Login") {
                responder.send(.userDidLogin(.mock))
            }
            
            Button("Show Profile") {
                responder.send(.showProfile(.mock))
            }
        }
        .handleEvent(.userDidLogin) { user in
            // Handle login logic
            print("User logged in: \(user.name)")
        }
        .handleEvent(.showProfile) { user in
            // Navigate to profile
            navigator.push(.profile(user))
        }
    }
}

// 3. Setup your app
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .responderScope() // Enable responder chain
        }
    }
}
```

## Advanced Usage

**Nested Responder Chains:**
```swift
struct ParentView: View {
    @Responder var responder
    
    var body: some View {
        VStack {
            ChildView()
                .handleEvent(.childEvent) { value in
                    // Handle child events
                    responder.send(.parentEvent(value))
                }
        }
        .handleEvent(.parentEvent) { value in
            // Handle at parent level
        }
    }
}

struct ChildView: View {
    @Responder var responder
    
    var body: some View {
        Button("Tap Me") {
            responder.send(.childEvent("Hello!"))
        }
    }
}
```

## Installation

### Swift Package Manager

Add to your Package.swift:
```swift
dependencies: [
    .package(url: "https://github.com/swiftresponders/core.git", from: "1.0.0")
]
```

Or in Xcode:
1. File -> Add Packages...
2. Enter: https://github.com/swiftresponders/core.git
3. Select version: 1.0.0

### CocoaPods

```ruby
pod 'SwiftResponders', '~> 1.0'
```

## Configuration

```swift
import SwiftResponders

// Configure at app launch
ResponderConfiguration.configure {
    $0.enableLogging = true
    $0.enableDebugTools = true
    $0.defaultHandler = .asyncMain
}
```

## Documentation

- Getting Started Guide: https://swiftresponders.dev/docs/quickstart
- API Reference: https://api.swiftresponders.dev
- Video Tutorials: https://swiftresponders.dev/learn
- Example Projects: https://github.com/swiftresponders/examples

## Migration Guide

Migrating from traditional coordinator pattern? Check our Migration Guide: https://swiftresponders.dev/docs/migration

## Community

- Discord Chat: https://discord.gg/swiftresponders
- Stack Overflow: https://stackoverflow.com/questions/tagged/swiftresponders
- GitHub Issues: https://github.com/swiftresponders/core/issues

## Performance

- **Zero overhead** in production builds
- **Type-erasure free** event handling
- **Memory efficient** responder chain management

Version: 1.2.1 | iOS: 15.0+ | Swift: 5.5+ | Last Update: 2025-10-15

# Touch update: 1760548355
