# Structured Observation Demo (Swift 6)

This is a small SwiftUI app built to demonstrate the new **Structured Observation** system introduced in Swift 6 and iOS 18+. The goal is to show how `@Observable` replaces the old `ObservableObject` and `@Published` pattern with a simpler, automatic data flow model.

The app tracks a single stock symbol (`AAPL`) and updates its price in real time. Instead of using Combine or manually publishing changes, the UI reacts automatically whenever the observed properties change.

## What it demonstrates

Structured Observation is the next step in SwiftUI’s data flow system. It allows views to re-render automatically when they read properties that later change, without using `@Published` or `ObservableObject`.

In this demo:

* The `Stock` class is marked with `@Observable`, not `ObservableObject`.
* The view holds a simple `@State` reference to a `Stock` instance.
* The UI updates every second as the model changes.
* No Combine, no `@Published`, and no `@ObservedObject`.

This setup shows how Swift now tracks **reads** and **writes** automatically, rebuilding only the parts of the UI that depend on the changed properties.

## Project structure
StructuredObservationDemo/
├─ Stock.swift
├─ StockService.swift
├─ StockView.swift
└─ ContentView.swift


* `Stock` defines the observable model.
* `StockService` simulates live price updates by changing the stock’s price every second.
* `StockView` reads and displays the stock’s properties.
* `ContentView` sets up the view hierarchy and starts the update loop.

## Running the project

1. Open the Xcode project in Xcode 16 or later (requires Swift 6 / iOS 18 SDK or newer).
2. Run it on the simulator or a device.
3. Watch the AAPL stock price update automatically every second.

## Example output

The UI shows:
AAPL
$190.24
Updated 13:21:54
Last change: 0.67
[Buy] [Sell]


Each second, the price value changes and the interface updates instantly. All of this happens without any `@Published` properties or manual bindings.

## How it works

Swift 6’s `@Observable` macro automatically synthesizes observation code behind the scenes. When a SwiftUI view reads a property of an observable object, Swift tracks that dependency. If that property changes later, the view is marked for re-rendering.

This replaces the need for Combine’s `objectWillChange` publisher and simplifies model definitions significantly.

## Future improvements

* Replace the random price generator with a real API call (e.g. Yahoo Finance).
* Add support for multiple stock symbols.
* Plot a small price history sparkline using `Canvas`.

---

This small project is meant to be read more like a language feature demo than a product. It focuses entirely on the new observation model and how it affects state management in SwiftUI.


