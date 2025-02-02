////    AccessoryViewTestApp.swift
//    AccessoryViewTest
//
//    Created by Dan Galbraith on 2/1/25.
//
//    Copyright © 2025 Eidria Inc. All rights reserved.


import SwiftUI
import Foundation

@main
struct AccessoryViewTestApp: App {
    var dataModel = AppDataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataModel)
        }
    }
}

extension String: @retroactive Error {}
extension String: @retroactive LocalizedError {
    public var errorDescription: String? { return self }
}

