//
//  ContentView.swift
//  LOTR App SwiftUI
//
//  Created by Latif Atci on 8/10/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let book = [Books(id: "1", name: "ppppp"),
                Books(id: "2", name: "bbb")
    
            ]
    
    var body: some View {
        NavigationView {
            TabView {
                List(book) { b in
                    NavigationLink(destination: BookDetail()) {
                        BookRow(books: b)
                    }
                }.navigationBarTitle(Text("Books"))
            }.navigationBarTitle(Text("Books"))
        }
    }
}

struct BookRow: View {
    var books: Books
    var body: some View {
        HStack {
            Image("lotr")
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
            Text(books.name)
        }
    }
}

struct BookDetail: View {
    var body: some View {
        Text("Book Detail")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
