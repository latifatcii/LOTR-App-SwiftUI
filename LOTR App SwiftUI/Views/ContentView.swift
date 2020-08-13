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
        NavigationView {
            TabView {
                BookTab(bookVM: viewModel)
                    .tabItem {
                        Image(systemName: "book")
                        Text("Books")
                }
                
                MovieTab(movieVM: movieViewModel)
                    .tabItem {
                        Image(systemName: "film")
                        Text("Movies")
                }
                
                }.navigationBarTitle(Text("Books"))
            
        
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
