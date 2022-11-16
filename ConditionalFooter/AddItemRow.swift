//
//  AddItemRow.swift
//
//  Created by Duncan Babbage on 16/11/22.
//

import SwiftUI

struct AddItemRow: View {
    let prompt: String
    let action: (() -> Void)?
    
    var body: some View {
        HStack {
            ZStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(.white)
                    .font(.system(.title2))
                    .padding(.leading, 0)
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.green)
                    .font(.system(.title2))
                    .padding(.leading, 0)
            }
            .accessibilityHidden(true)
            
            Text(prompt)
                .padding(.leading, 8.0)
        }
        .contentShape(Rectangle()) // required to enable .onTapGesture
        .accessibilityElement()
        .accessibilityAddTraits(.isButton)
        .accessibilityLabel(prompt)
        .accessibilityIdentifier(prompt)
        .onTapGesture(count: 1, perform: {
            action?()
        })
        .frame(minHeight: 32.0)
    }
}

struct AddItemRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            AddItemRow(prompt: "add phone", action: nil)
        }
        .previewLayout(.fixed(width: 390, height: 120))
    }
}
