import Testing
@testable import SizeAlike
import Foundation

@Suite("NSString")
struct NSStringTests {

    @Test func emptyNSString() {
        let s: NSString = ""
        #expect(s.size == 0)
        #expect(s.count == 0)
        #expect(s.length == 0)
    }

    @Test func asciiNSString() {
        let s: NSString = "hello"
        #expect(s.size == 5)
        #expect(s.count == 5)
        #expect(s.length == 5)
    }

    @Test func unicodeNSString() {
        // NSString uses UTF-16 internally
        // Single emoji that fits in one UTF-16 code unit
        let s: NSString = "é"
        #expect(s.size == 1)
        #expect(s.count == 1)
        #expect(s.length == 1)
    }

    @Test func emojiNSString() {
        // 👋 is a single Unicode scalar but uses 2 UTF-16 code units
        let s: NSString = "👋"
        #expect(s.size == 2)
        #expect(s.count == 2)
        #expect(s.length == 2)
    }

    @Test func multipleEmojiNSString() {
        // Each emoji may use 2 UTF-16 code units
        let s: NSString = "👋🌍"
        #expect(s.size == 4)
        #expect(s.count == 4)
        #expect(s.length == 4)
    }

    @Test func japaneseNSString() {
        let s: NSString = "日本語"
        #expect(s.size == 3)
        #expect(s.count == 3)
        #expect(s.length == 3)
    }

    @Test func mixedContentNSString() {
        let s: NSString = "abc123"
        #expect(s.size == 6)
        #expect(s.count == 6)
        #expect(s.length == 6)
    }

    @Test func whitespaceNSString() {
        let s: NSString = "   "
        #expect(s.size == 3)
        #expect(s.count == 3)
        #expect(s.length == 3)
    }

    @Test func newlineNSString() {
        let s: NSString = "a\nb\nc"
        #expect(s.size == 5)
        #expect(s.count == 5)
        #expect(s.length == 5)
    }

    @Test func singleCharacterNSString() {
        let s: NSString = "Z"
        #expect(s.size == 1)
        #expect(s.count == 1)
        #expect(s.length == 1)
    }

    @Test func allThreeAccessorsAgree() {
        let s: NSString = "consistency"
        #expect(s.size == s.length)
        #expect(s.count == s.length)
        #expect(s.size == s.count)
    }

    @Test func nsStringVsSwiftStringDifference() {
        // Demonstrates that NSString and Swift String can report
        // different values for the same content.
        // NSString counts UTF-16 code units.
        // Swift String counts grapheme clusters.
        let emoji = "👨‍👩‍👧‍👦"
        let nsString: NSString = emoji as NSString
        let swiftString: String = emoji

        // NSString: counts UTF-16 code units (11 for this emoji)
        #expect(nsString.size == nsString.length)
        #expect(nsString.count == nsString.length)

        // Swift String: counts grapheme clusters (1 for this emoji)
        #expect(swiftString.size == 1)
        #expect(swiftString.length == 1)
        #expect(swiftString.count == 1)

        // They are intentionally different
        #expect(nsString.length != swiftString.count)
    }

    @Test func bridgedFromSwiftString() {
        let swift = "hello world"
        let ns = swift as NSString
        #expect(ns.size == 11)
        #expect(ns.count == 11)
        #expect(ns.length == 11)
    }

    @Test func mutableNSString() {
        let s = NSMutableString(string: "hello")
        #expect(s.size == 5)
        #expect(s.count == 5)
        #expect(s.length == 5)

        s.append(" world")
        #expect(s.size == 11)
        #expect(s.count == 11)
        #expect(s.length == 11)
    }
}
