# SizeAlike

SizeAlike is a lightweight Swift package that unifies collection sizing across the standard library. It adds `.size`, `.length`, and `.count` as interchangeable properties on all `Collection` types and `NSString`, so you never have to remember which accessor a given type uses.

Swift's `Collection` protocol provides `.count`. Objective-C's `NSString` provides `.length`. Other languages use `.size`. SizeAlike bridges the gap by making all three work everywhere.

## Supported Types

**Via `Collection` extension:** String, Array, Dictionary, Set, Data, Substring, ArraySlice, Range, ClosedRange, and any other type conforming to `Collection`.

**Via `NSString` extension:** NSString and NSMutableString.

## Performance

All extensions are marked `@inlinable`, which allows the Swift compiler to inline the property access directly at the call site across module boundaries. This means `.size` and `.length` compile down to the same machine code as `.count`. There is zero runtime overhead.

## Requirements

- Swift 6.0+
- iOS 13.0+ / macOS 10.15+ / tvOS 13.0+ / watchOS 6.0+

## Installation

Add SizeAlike to your project using Swift Package Manager. In your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/mcmooneyham/Size-Alike-Swift", from: "1.0.0")
]
```

Then add it as a dependency to your target:

```swift
.target(
    name: "YourTarget",
    dependencies: ["SizeAlike"]
)
```

Or in Xcode: **File > Add Package Dependencies**, then enter the repository URL.

## Usage

```swift
import SizeAlike

let array = [1, 2, 3]
array.count   // 3
array.size    // 3
array.length  // 3

let string = "hello"
string.count  // 5
string.size   // 5
string.length // 5

let dict = ["a": 1, "b": 2]
dict.count    // 2
dict.size     // 2
dict.length   // 2

let ns: NSString = "hello"
ns.length     // 5
ns.size       // 5
ns.count      // 5
```

## License

SizeAlike is available under the MIT License. See [LICENSE](LICENSE) for details.
