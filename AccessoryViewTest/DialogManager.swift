//    ExportDialog.swift
//    ObjectCaptureEdit
//
//    Created by Dan Galbraith on 1/26/25.
//
//    Copyright © 2025 Eidria Inc. All rights reserved.

import AppKit
import Foundation
import RealityKit
import SwiftUI
import UniformTypeIdentifiers

@MainActor
public class DialogManager {
    let viewModel: DialogAccessoryViewModel
    let panel = NSOpenPanel()
    let dialogDelegate: DialogDelegate

    public init(
        initialDirectory: URL? = nil,
        dataModel: AppDataModel,
        title: String? = nil
    ) {
        viewModel = DialogAccessoryViewModel(dataModel: dataModel)
        dialogDelegate = DialogDelegate(viewModel: viewModel)

        if let initialDirectory {
            panel.directoryURL = initialDirectory
        }

        if let title {
            panel.message = title
        }

        panel.allowsMultipleSelection = false
        panel.canChooseFiles = false
        panel.canChooseDirectories = true
        panel.isAccessoryViewDisclosed = true // setting this here has no effect
        panel.accessoryView = DialogAccessoryViewHost(viewModel: viewModel, panel: panel)
        panel.delegate = dialogDelegate
    }

    public func showDialog() {
        if panel.runModal() == .OK {
            print("Accessory view updated successfully")
        }
    }
}
