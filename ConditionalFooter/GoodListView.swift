//
//  GoodListView.swift
//  ConditionalFooter
//
//  Created by Duncan Babbage on 16/11/22.
//

import Foundation
import SwiftUI

struct GoodListView: View {
    @Environment(\.editMode) private var editMode
    
    @State var emails: [Email] = [
        Email(label: "work", value: "test@apple.com"),
        Email(label: "home", value: "test@icloud.com")
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
            Text("Good animation but extra-padded list")
        } footer: {
            Text(inEditMode ? "This text is only displayed in edit mode, but adds unwanted padding before the list section below when not in edit mode compared to the no footer list." : "")
        }
    }
}
