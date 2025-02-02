////    ExportSettingsView.swift
//    ObjectCaptureEdit
//
//    Created by Dan Galbraith on 1/26/25.
//
//    Copyright © 2025 Eidria Inc. All rights reserved.

import SwiftUI

public struct DialogAccessoryView: View {
    var viewModel: DialogAccessoryViewModel

    public var body: some View {
        VStack {
            textField

            switchToggle

            checkboxToggle

            button
                .background(Color.clear)

            picker

            Text(viewModel.validationStatusDescription)
                .padding(.top)
        }
        .onTapGesture {
            print("View tapped")
        }
        .padding(20)
    }

    public var textField: some View {
        HStack {
            @Bindable var viewModel = viewModel
            Text("Model text:")
            TextField("", text: $viewModel.text)
                .popover(isPresented: $viewModel.showTextValidationExplanation, arrowEdge: .trailing) {
                    Text("The text must be at least one character in length and different from its initial value")
                }

            Button {
                viewModel.showTextValidationExplanation = true
            } label: {
                Image(systemName: "questionmark.circle")
            }
            .buttonStyle(.borderless)
        }
    }

    public var checkboxToggle: some View {
        @Bindable var viewModel = viewModel
        return Toggle("Model enabled", isOn: $viewModel.isEnabled)
            .toggleStyle(.checkbox)
            .fixedSize()
    }

    public var switchToggle: some View {
        @Bindable var viewModel = viewModel
        return Toggle("Model enabled", isOn: $viewModel.isEnabled)
            .toggleStyle(.switch)
            .fixedSize()
    }

    public var button: some View {
        Button {
            viewModel.isEnabled.toggle()
        } label: {
            HStack {
                Image(systemName: viewModel.isEnabled ? "checkmark.rectangle" :"rectangle")
                Text("Model enabled")
            }
        }
    }

    public var picker: some View {
        @Bindable var viewModel = viewModel
        return Picker(selection: $viewModel.value) {
            Text(AppDataModel.Value.one.rawValue)
                .tag(AppDataModel.Value.one)
            Text(AppDataModel.Value.two.rawValue)
                .tag(AppDataModel.Value.two)
            Text(AppDataModel.Value.three.rawValue)
                .tag(AppDataModel.Value.three)
        } label: {
            Text("Model Value:")
        }
        .fixedSize()
    }
}
