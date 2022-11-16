//
//  Email.swift
//  ConditionalFooter
//
//  Created by Duncan Babbage on 16/11/22.
//

import Foundation

class Email: Identifiable, ObservableObject {
    var label: String
    var value: String
    let id = UUID()

    init(label: String, value: String) {
        self.label = label
        self.value = value
    }
}
