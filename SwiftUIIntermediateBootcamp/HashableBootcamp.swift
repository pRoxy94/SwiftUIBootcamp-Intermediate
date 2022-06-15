//
//  HashableBootcamp.swift
//  SwiftUIIntermediateBootcamp
//
//  Created by Rossana Laricchia on 07/06/22.
//

import SwiftUI

struct MyCustomModel: Hashable /* or Identifiable - with id */ {
    let title: String
    
    func hash(into hasher: inout Hasher) {
	   hasher.combine(title)
    }
}

/*
 The Hashable protocol is very similar to the Identifiable protocol - it's another way to give a unique identifier to an object. In reality, hashing is actually MUCH more complex than this.
 */
struct HashableBootcamp: View {
    
    // String conforms to a protocol called hashable and what it does is create a kind of a unique id
    // for each of these strings
    let data: [String] = ["ONE", "TWO", "THREE", "FOUR", "FIVE"]
    
    let data2: [MyCustomModel] = [
	   MyCustomModel(title: "ONE"),
	   MyCustomModel(title: "TWO"),
	   MyCustomModel(title: "THREE"),
	   MyCustomModel(title: "FOUR"),
	   MyCustomModel(title: "FIVE")
    ]
    
    
    var body: some View {
	   ScrollView {
		  VStack(spacing: 40) {
			 ForEach(data2, id: \.self) { item in
				// each of these items are getting an hash value -> item.hashValue.description
				Text(item.title)
				    .font(.headline)
			 }
		  }
	   }
    }
}

struct HashableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HashableBootcamp()
    }
}
