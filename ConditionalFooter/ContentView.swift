//
//  ContentView.swift
//  ConditionalFooter
//
//  Created by Duncan Babbage on 16/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                BadListView()
                // AnotherBadListView()
                GoodListView()
                NoFooterListView()
                NoFooterListView()
            }
            .toolbar {
                EditButton()
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
