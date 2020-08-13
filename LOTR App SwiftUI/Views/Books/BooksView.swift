//
//  BooksView.swift
//  LOTR App SwiftUI
//
//  Created by Latif Atci on 8/13/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import SwiftUI

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
    var book: Books
    var body: some View {
        VStack {
            Text(book.name)
            Text(book.id)
        }
    }
}


struct BookTab: View {
    var bookVM: BooksViewModel
    var body: some View {
        NavigationView {
            List(bookVM.books) { book in
                NavigationLink(destination: BookDetail(book: book)) {
                    BookRow(books: book)
                }
            }.navigationBarTitle(Text("Books"))

        }
    }
}
