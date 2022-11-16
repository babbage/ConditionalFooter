//
//  EmailRow.swift
//  ConditionalFooter
//
//  Created by Duncan Babbage on 16/11/22.
//

import SwiftUI

struct EmailRow: View {
    @ObservedObject var email: Email
    @FocusState private var focusedField: String?
    @Environment(\.editMode) private var editMode
    @State var enableTextFields: Bool

    var body: some View {
        // let _ = Self._printChanges()

        VStack {
            TextField("label", text: $email.label)
                .focused($focusedField, equals: "label-\(email.id.uuidString)")
                .font(.subheadline)
            TextField("email", text: $email.value)
                .focused($focusedField, equals: "email-\(email.id.uuidString)")
        }
        .disabled(!enableTextFields) // only allow editing text when in edit mode
        .onChange(of: editMode?.wrappedValue) { newValue in
            enableTextFields = newValue?.isEditing ?? false
        }
    }
    
    init(email: Email) {
        self.email = email
        _enableTextFields = State(initialValue: false)
    }
}
