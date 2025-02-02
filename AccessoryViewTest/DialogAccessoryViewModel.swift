////    DialogAccessoryViewModel.swift
//    AccessoryViewTest
//
//    Created by Dan Galbraith on 2/2/25.
//
//    Copyright © 2025 Eidria Inc. All rights reserved.


import Foundation

@Observable
public class DialogAccessoryViewModel {
    var dataModel: AppDataModel
    
    var value: AppDataModel.Value = .one {
        didSet {
            dataModel.value = value
            validationStatusDescription = dataModel.statusDescription
        }
    }
    
    var isEnabled: Bool {
        didSet {
            dataModel.isEnabled = isEnabled
            validationStatusDescription = dataModel.statusDescription
        }
    }
    
    var text: String {
        didSet {
            dataModel.text = text
            validationStatusDescription = dataModel.statusDescription
        }
    }

    var isValid: Bool {
        return dataModel.isValid
    }
    
    var showTextValidationExplanation: Bool
    
    var validationStatusDescription: String
    
    init(dataModel: AppDataModel) {
        self.dataModel = dataModel
        
        value = dataModel.value
        isEnabled = dataModel.isEnabled
        text = dataModel.text
        validationStatusDescription = dataModel.statusDescription

        showTextValidationExplanation = false
    }
}
