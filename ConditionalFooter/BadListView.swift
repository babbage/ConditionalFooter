//
//  BadListView.swift
//  ConditionalFooter
//
//  Created by Duncan Babbage on 16/11/22.
//

import Foundation
import SwiftUI

struct BadListView: View {
    @Environment(\.editMode) private var editMode
    
    @State var emails: [Email] = [
        Email(label: "work", value: "test@google.com"),
        Email(label: "home", value: "test@gmail.com")
    ]
    
    var body: some View {
        let inEditMode = editMode?.wrappedValue.isEditing == true
        
        Section {
            ForEach($emails) { $email in
                EmailRow(email: email)
            }
            .onMove { indexSet, offset in
                emails.move(fromOffsets: indexSet, toOffset: offset)
            }
            .onDelete { indexSet in
                emails.remove(atOffsets: indexSet)
            }
            
            if inEditMode {
                AddItemRow(prompt: "add email", action: {
                    emails.append(Email(label: "extra", value: "new@extra.com"))
                })
            }
        } header: {
            Text("Bad list")
        } footer: {
            if inEditMode {
                Text("This text is only displayed in edit mode, and adds no unwanted padding when not in edit mode, but causes the view to not animate smoothly in and out of edit mode, and when the conditional AddItemRow is also present above, it will crash the app in iOS 16.2 b2 (at least on a physical device, given no iOS 16.2 b2 simulator is available for external testing).")
            }
        }
    }
}
