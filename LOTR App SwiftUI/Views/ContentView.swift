//
//  ContentView.swift
//  LOTR App SwiftUI
//
//  Created by Latif Atci on 8/10/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = BooksViewModel()
    @ObservedObject var movieViewModel = MoviesViewModel()
    
    var body: some View {
        
        TabView {
            NavigationView {
                BookTab(bookVM: viewModel)
                .navigationBarTitle(Text("Books"))
            }
            .tabItem {
                Image(systemName: "book")
                Text("Books")
            }
            
            NavigationView {
                MovieTab(movieVM: movieViewModel)
                .navigationBarTitle(Text("Movies"))
            }
            .tabItem {
                Image(systemName: "film")
                Text("Movies")
            }
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
