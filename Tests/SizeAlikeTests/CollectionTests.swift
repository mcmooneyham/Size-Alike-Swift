import Testing
@testable import SizeAlike
import Foundation

// MARK: - String

@Suite("String")
struct StringTests {

    @Test func emptyString() {
        let s = ""
        #expect(s.size == 0)
        #expect(s.length == 0)
        #expect(s.count == 0)
    }

    @Test func asciiString() {
        let s = "hello"
        #expect(s.size == 5)
        #expect(s.length == 5)
        #expect(s.count == 5)
    }

    @Test func unicodeEmoji() {
        let s = "👋🌍"
        #expect(s.size == 2)
        #expect(s.length == 2)
        #expect(s.count == 2)
    }

    @Test func combinedEmoji() {
        // Family emoji is a single grapheme cluster
        let s = "👨‍👩‍👧‍👦"
        #expect(s.size == 1)
        #expect(s.length == 1)
        #expect(s.count == 1)
    }

    @Test func multilineString() {
        let s = "line1\nline2\nline3"
        #expect(s.size == 17)
        #expect(s.length == 17)
        #expect(s.count == 17)
    }

    @Test func whitespaceOnly() {
        let s = "   "
        #expect(s.size == 3)
        #expect(s.length == 3)
        #expect(s.count == 3)
    }

    @Test func singleCharacter() {
        let s = "A"
        #expect(s.size == 1)
        #expect(s.length == 1)
        #expect(s.count == 1)
    }

    @Test func japaneseText() {
        let s = "日本語"
        #expect(s.size == 3)
        #expect(s.length == 3)
        #expect(s.count == 3)
    }

    @Test func mixedAsciiAndUnicode() {
        let s = "abc🎉def"
        #expect(s.size == 7)
        #expect(s.length == 7)
        #expect(s.count == 7)
    }

    @Test func allThreeAccessorsAgree() {
        let s = "consistency check"
        #expect(s.size == s.count)
        #expect(s.length == s.count)
        #expect(s.size == s.length)
    }
}

// MARK: - Substring

@Suite("Substring")
struct SubstringTests {

    @Test func emptySubstring() {
        let s = "hello"
        let sub = s.prefix(0)
        #expect(sub.size == 0)
        #expect(sub.length == 0)
        #expect(sub.count == 0)
    }

    @Test func partialSubstring() {
        let s = "hello world"
        let sub = s.prefix(5)
        #expect(sub.size == 5)
        #expect(sub.length == 5)
        #expect(sub.count == 5)
    }

    @Test func fullSubstring() {
        let s = "hello"
        let sub = s[s.startIndex...]
        #expect(sub.size == 5)
        #expect(sub.length == 5)
        #expect(sub.count == 5)
    }

    @Test func suffixSubstring() {
        let s = "hello world"
        let sub = s.suffix(5)
        #expect(sub.size == 5)
        #expect(sub.length == 5)
        #expect(sub.count == 5)
    }

    @Test func allThreeAccessorsAgree() {
        let s = "test substring"
        let sub = s.prefix(8)
        #expect(sub.size == sub.count)
        #expect(sub.length == sub.count)
    }
}

// MARK: - Array

@Suite("Array")
struct ArrayTests {

    @Test func emptyArray() {
        let a: [Int] = []
        #expect(a.size == 0)
        #expect(a.length == 0)
        #expect(a.count == 0)
    }

    @Test func singleElement() {
        let a = [42]
        #expect(a.size == 1)
        #expect(a.length == 1)
        #expect(a.count == 1)
    }

    @Test func multipleElements() {
        let a = [1, 2, 3, 4, 5]
        #expect(a.size == 5)
        #expect(a.length == 5)
        #expect(a.count == 5)
    }

    @Test func stringArray() {
        let a = ["hello", "world"]
        #expect(a.size == 2)
        #expect(a.length == 2)
        #expect(a.count == 2)
    }

    @Test func nestedArray() {
        let a = [[1, 2], [3, 4], [5, 6]]
        #expect(a.size == 3)
        #expect(a.length == 3)
        #expect(a.count == 3)
    }

    @Test func optionalElementArray() {
        let a: [Int?] = [1, nil, 3, nil, 5]
        #expect(a.size == 5)
        #expect(a.length == 5)
        #expect(a.count == 5)
    }

    @Test func largeArray() {
        let a = Array(0..<10_000)
        #expect(a.size == 10_000)
        #expect(a.length == 10_000)
        #expect(a.count == 10_000)
    }

    @Test func allThreeAccessorsAgree() {
        let a = [1, 2, 3]
        #expect(a.size == a.count)
        #expect(a.length == a.count)
    }
}

// MARK: - ArraySlice

@Suite("ArraySlice")
struct ArraySliceTests {

    @Test func emptySlice() {
        let a = [1, 2, 3, 4, 5]
        let slice = a[0..<0]
        #expect(slice.size == 0)
        #expect(slice.length == 0)
        #expect(slice.count == 0)
    }

    @Test func partialSlice() {
        let a = [1, 2, 3, 4, 5]
        let slice = a[1..<4]
        #expect(slice.size == 3)
        #expect(slice.length == 3)
        #expect(slice.count == 3)
    }

    @Test func fullSlice() {
        let a = [1, 2, 3, 4, 5]
        let slice = a[0..<5]
        #expect(slice.size == 5)
        #expect(slice.length == 5)
        #expect(slice.count == 5)
    }

    @Test func allThreeAccessorsAgree() {
        let a = [10, 20, 30, 40, 50]
        let slice = a[2..<4]
        #expect(slice.size == slice.count)
        #expect(slice.length == slice.count)
    }
}

// MARK: - Dictionary

@Suite("Dictionary")
struct DictionaryTests {

    @Test func emptyDictionary() {
        let d: [String: Int] = [:]
        #expect(d.size == 0)
        #expect(d.length == 0)
        #expect(d.count == 0)
    }

    @Test func singleEntry() {
        let d = ["key": "value"]
        #expect(d.size == 1)
        #expect(d.length == 1)
        #expect(d.count == 1)
    }

    @Test func multipleEntries() {
        let d = ["a": 1, "b": 2, "c": 3]
        #expect(d.size == 3)
        #expect(d.length == 3)
        #expect(d.count == 3)
    }

    @Test func intKeyDictionary() {
        let d = [1: "one", 2: "two", 3: "three", 4: "four"]
        #expect(d.size == 4)
        #expect(d.length == 4)
        #expect(d.count == 4)
    }

    @Test func allThreeAccessorsAgree() {
        let d = ["x": 1, "y": 2]
        #expect(d.size == d.count)
        #expect(d.length == d.count)
    }
}

// MARK: - Set

@Suite("Set")
struct SetTests {

    @Test func emptySet() {
        let s: Set<Int> = []
        #expect(s.size == 0)
        #expect(s.length == 0)
        #expect(s.count == 0)
    }

    @Test func singleElement() {
        let s: Set<Int> = [1]
        #expect(s.size == 1)
        #expect(s.length == 1)
        #expect(s.count == 1)
    }

    @Test func multipleElements() {
        let s: Set<Int> = [1, 2, 3, 4, 5]
        #expect(s.size == 5)
        #expect(s.length == 5)
        #expect(s.count == 5)
    }

    @Test func duplicatesCollapsed() {
        let s: Set<Int> = [1, 1, 2, 2, 3]
        #expect(s.size == 3)
        #expect(s.length == 3)
        #expect(s.count == 3)
    }

    @Test func stringSet() {
        let s: Set<String> = ["a", "b", "c"]
        #expect(s.size == 3)
        #expect(s.length == 3)
        #expect(s.count == 3)
    }

    @Test func allThreeAccessorsAgree() {
        let s: Set<Int> = [10, 20, 30]
        #expect(s.size == s.count)
        #expect(s.length == s.count)
    }
}

// MARK: - Data

@Suite("Data")
struct DataTests {

    @Test func emptyData() {
        let d = Data()
        #expect(d.size == 0)
        #expect(d.length == 0)
        #expect(d.count == 0)
    }

    @Test func dataFromBytes() {
        let d = Data([0x00, 0x01, 0x02, 0x03])
        #expect(d.size == 4)
        #expect(d.length == 4)
        #expect(d.count == 4)
    }

    @Test func dataFromString() {
        let d = "hello".data(using: .utf8)!
        #expect(d.size == 5)
        #expect(d.length == 5)
        #expect(d.count == 5)
    }

    @Test func dataFromUnicodeString() {
        // UTF-8 encodes emoji as 4 bytes each
        let d = "👋".data(using: .utf8)!
        #expect(d.size == 4)
        #expect(d.length == 4)
        #expect(d.count == 4)
    }

    @Test func allThreeAccessorsAgree() {
        let d = Data([0xFF, 0xFE, 0xFD])
        #expect(d.size == d.count)
        #expect(d.length == d.count)
    }
}

// MARK: - Range (via Collection conformance)

@Suite("Range")
struct RangeTests {

    @Test func smallRange() {
        let r = 0..<5
        #expect(r.size == 5)
        #expect(r.length == 5)
        #expect(r.count == 5)
    }

    @Test func emptyRange() {
        let r = 0..<0
        #expect(r.size == 0)
        #expect(r.length == 0)
        #expect(r.count == 0)
    }

    @Test func offsetRange() {
        let r = 10..<20
        #expect(r.size == 10)
        #expect(r.length == 10)
        #expect(r.count == 10)
    }

    @Test func allThreeAccessorsAgree() {
        let r = 5..<15
        #expect(r.size == r.count)
        #expect(r.length == r.count)
    }
}

// MARK: - ClosedRange

@Suite("ClosedRange")
struct ClosedRangeTests {

    @Test func smallClosedRange() {
        let r = 0...4
        #expect(r.size == 5)
        #expect(r.length == 5)
        #expect(r.count == 5)
    }

    @Test func singleElementClosedRange() {
        let r = 3...3
        #expect(r.size == 1)
        #expect(r.length == 1)
        #expect(r.count == 1)
    }

    @Test func allThreeAccessorsAgree() {
        let r = 1...10
        #expect(r.size == r.count)
        #expect(r.length == r.count)
    }
}

// MARK: - Mutability

@Suite("Mutability")
struct MutabilityTests {

    @Test func arrayAfterAppend() {
        var a = [1, 2, 3]
        #expect(a.size == 3)
        a.append(4)
        #expect(a.size == 4)
        #expect(a.length == 4)
        #expect(a.count == 4)
    }

    @Test func arrayAfterRemove() {
        var a = [1, 2, 3]
        a.removeLast()
        #expect(a.size == 2)
        #expect(a.length == 2)
        #expect(a.count == 2)
    }

    @Test func setAfterInsert() {
        var s: Set<Int> = [1, 2]
        s.insert(3)
        #expect(s.size == 3)
        #expect(s.length == 3)
        #expect(s.count == 3)
    }

    @Test func dictionaryAfterInsert() {
        var d = ["a": 1]
        d["b"] = 2
        #expect(d.size == 2)
        #expect(d.length == 2)
        #expect(d.count == 2)
    }

    @Test func dictionaryAfterRemove() {
        var d = ["a": 1, "b": 2, "c": 3]
        d.removeValue(forKey: "b")
        #expect(d.size == 2)
        #expect(d.length == 2)
        #expect(d.count == 2)
    }
}
