////    DialogDelegate.swift
//    AccessoryViewTest
//
//    Created by Dan Galbraith on 2/2/25.
//
//    Copyright © 2025 Eidria Inc. All rights reserved.


import Foundation
import AppKit

@MainActor
class DialogDelegate: NSObject, NSOpenSavePanelDelegate {
    let viewModel: DialogAccessoryViewModel
    var accessoryViewShown: Bool = false
    
    public init(viewModel: DialogAccessoryViewModel) {
        self.viewModel = viewModel
    }
    
    // Tells the delegate that the user confirmed a filename choice by clicking Save in a Save panel.
    // Responding to Panel Changes
    func panel(_ panel: Any, userEnteredFilename: String, confirmed: Bool) -> String? {
        return userEnteredFilename
    }
    
    //    Tells the delegate that the user changed the selection in the specified Save panel.
    //    Required
    func panelSelectionDidChange(_ panel: Any?) {
        // make sure the accessory view is visible when the panel first appears
        if !accessoryViewShown, let panel = panel as? NSOpenPanel {
            panel.isAccessoryViewDisclosed = true
            accessoryViewShown = true
        }
    }
    
    // Tells the delegate that the user changed the selected directory to the directory located at the specified URL.
    // Required
    func panel(_ panel: Any, didChangeToDirectoryURL: URL?) {
    }
    
    // Tells the delegate that the Save panel is about to expand or collapse because the user
    // clicked the disclosure triangle that displays or hides the file browser.
    // Required
    func panel(_ panel: Any, willExpand: Bool) {
    }
    
    // Asks the delegate whether the specified URL should be enabled in the Open panel.
    // Required
    func panel(_ panel: Any, shouldEnable: URL) -> Bool {
        return shouldEnable.hasDirectoryPath
    }
    
    // Asks the delegate to validate the URL for a file that the user selected.
    func panel(_ panel: Any, validate: URL) throws {
        if !viewModel.isValid {
            throw viewModel.validationStatusDescription
        }
    }
}
