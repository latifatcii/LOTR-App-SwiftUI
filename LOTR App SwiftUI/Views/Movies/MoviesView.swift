//
//  MoviesView.swift
//  LOTR App SwiftUI
//
//  Created by Latif Atci on 8/13/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import SwiftUI

struct MovieRow: View {
    var movies: Movie
    var body: some View {
        HStack {
            Image("lotr")
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
            Text(movies.name)
        }
    }
}

struct MovieDetail: View {
    var movie: Movie
    var body: some View {
        VStack {
            Text(movie.name)
            Text(movie.id)
        }
    }
}


struct MovieTab: View {
    var movieVM: MoviesViewModel
    var body: some View {
        NavigationView {
            List(movieVM.movies) { movie in
                NavigationLink(destination: MovieDetail(movie: movie)) {
                    MovieRow(movies: movie)
                }
            }.navigationBarTitle(Text("Movies"))

        }
    }
}
