////    AppDataModel.swift
//    AccessoryViewTest
//
//    Created by Dan Galbraith on 2/2/25.
//
//    Copyright © 2025 Eidria Inc. All rights reserved.

import Foundation

@Observable
public class AppDataModel {
    public enum Value: String {
        case one = "One"
        case two = "Two"
        case three = "Three"
    }
    
    public enum Status: String {
        case valid = "valid"
        case textEmpty = "text is empty"
        case textDefault = "text has not been changed"
        case enabledDefault = "isEnabled has not been changed"
        case valueDefault = "value has not been changed"
    }

    var value: Value = AppDataModel.defaultValue {
        didSet {
            print("AppDataModel value changed to \(value)")
        }
    }

    var isEnabled: Bool = AppDataModel.defaultIsEnabled {
        didSet {
            print("AppDataModel isEnabled changed to \(isEnabled)")
        }
    }

    var text: String = AppDataModel.defaultText {
        didSet {
            print("AppDataModel text changed to \(text)")
        }
    }
    
    var isValid: Bool {
        status == .valid
    }
    
    var statusDescription: String {
        if status == .valid {
            "Data Model is valid"
        } else {
            "Data Model is invalid: \(status.rawValue)"
        }
    }
    
    var status: Status {
        if text.isEmpty {
            return .textEmpty
        } else if text == AppDataModel.defaultText {
            return .textDefault
        } else if isEnabled == AppDataModel.defaultIsEnabled {
            return .enabledDefault
        } else if value == AppDataModel.defaultValue {
            return .valueDefault
        } else {
            return .valid
        }
    }

    public func resetToDefaults() {
        self.text = AppDataModel.defaultText
        self.isEnabled = AppDataModel.defaultIsEnabled
        self.value = AppDataModel.defaultValue
    }
}

extension AppDataModel {
    static let defaultValue = Value.one
    static let defaultIsEnabled: Bool = false
    static let defaultText: String = "This is the default Text"
}
