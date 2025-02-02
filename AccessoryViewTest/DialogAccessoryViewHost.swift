////    DialogAccessoryViewHost.swift
//    AccessoryViewTest
//
//    Created by Dan Galbraith on 2/2/25.
//
//    Copyright © 2025 Eidria Inc. All rights reserved.


import Foundation
import AppKit
import SwiftUI

class DialogAccessoryViewHost: NSHostingView<DialogAccessoryView> {
    weak var panel: NSOpenPanel?
    
    public convenience init(viewModel: DialogAccessoryViewModel, panel: NSOpenPanel) {
        self.init(rootView: DialogAccessoryView(viewModel: viewModel))
        self.panel = panel
    }
    
    public override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()
        panel?.isAccessoryViewDisclosed = true // need to wait until we are installed on a window to do this
    }
    
    public override func mouseDown(with nsEvent: NSEvent) {
        super.mouseDown(with: nsEvent)
        if let view = hitTest(convert(nsEvent.locationInWindow, from: nil)) {
            print("Hosted view mouse down on view \(view)")
        } else {
            print("Hosted view mouse down")
        }
    }
}
