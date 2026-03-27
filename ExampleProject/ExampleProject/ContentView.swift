//
//  ContentView.swift
//  ExampleProject
//
//  Created by Matthew Mooneyham on 3/27/26.
//

import SwiftUI
import SizeAlike

struct ContentView: View {
    private let string = "Hello, world!"
    private let array = [1, 2, 3, 4, 5]
    private let dictionary = ["a": 1, "b": 2, "c": 3]
    private let set: Set<String> = ["swift", "size", "alike"]
    private let nsString: NSString = "SizeAlike"

    var body: some View {
        NavigationStack {
            List {
                Section("String — \"\(string)\"") {
                    row("count", value: string.count)
                    row("size", value: string.size)
                    row("length", value: string.length)
                }

                Section("Array — \(array)") {
                    row("count", value: array.count)
                    row("size", value: array.size)
                    row("length", value: array.length)
                }

                Section("Dictionary — \(dictionary.keys.sorted().joined(separator: ", "))") {
                    row("count", value: dictionary.count)
                    row("size", value: dictionary.size)
                    row("length", value: dictionary.length)
                }

                Section("Set — \(set.sorted().joined(separator: ", "))") {
                    row("count", value: set.count)
                    row("size", value: set.size)
                    row("length", value: set.length)
                }

                Section("NSString — \"\(nsString)\"") {
                    row("length", value: nsString.length)
                    row("size", value: nsString.size)
                    row("count", value: nsString.count)
                }
            }
            .navigationTitle("SizeAlike")
        }
    }

    private func row(_ label: String, value: Int) -> some View {
        HStack {
            Text(".\(label)")
                .monospaced()
            Spacer()
            Text("\(value)")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ContentView()
}
