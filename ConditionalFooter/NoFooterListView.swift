//
//  NoFooterListView.swift
//  ConditionalFooter
//
//  Created by Duncan Babbage on 16/11/22.
//

import Foundation
import SwiftUI

struct NoFooterListView: View {
    @Environment(\.editMode) private var editMode

    @State var emails: [Email] = [
        Email(label: "work", value: "test@vanilla.com"),
        Email(label: "home", value: "test@aol.com")
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
            Text("No footer list")
        }
    }
}
