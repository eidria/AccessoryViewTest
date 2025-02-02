////    ContentView.swift
//    AccessoryViewTest
//
//    Created by Dan Galbraith on 2/1/25.
//
//    Copyright © 2025 Eidria Inc. All rights reserved.

import SwiftUI

struct ContentView: View {
    @Environment(AppDataModel.self) var dataModel

    var body: some View {
        VStack {
            GroupBox(label: Text("Accessory View")) {
                DialogAccessoryView(viewModel: .init(dataModel: dataModel))
            }
            .padding(.bottom, 20)

            Button {
                DialogManager(dataModel: dataModel).showDialog()
            } label: {
                Text("Show NSOpen panel containing accessory view")
            }
            .buttonStyle(.bordered)

        }
        .padding(20)
    }
}

//#Preview {
//    ContentView()
//        .environment(AppDataModel())
//}
