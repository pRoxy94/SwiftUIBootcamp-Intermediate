//
//  TypealiasBootcamp.swift
//  SwiftUIIntermediateBootcamp
//
//  Created by Rossana Laricchia on 15/06/22.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

// create a new name for an existing type
typealias TvModel = MovieModel

struct TypealiasBootcamp: View {
    
    @State var item: MovieModel = MovieModel(title: "Title", director: "Joe", count: 5)
    @State var item2: TvModel = TvModel(title: "Tv Title", director: "Nick", count: 5)
    
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

struct TypealiasBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TypealiasBootcamp()
    }
}
