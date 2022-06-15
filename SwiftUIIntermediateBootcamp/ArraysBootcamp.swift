//
//  ArraysBootcamp.swift
//  SwiftUIIntermediateBootcamp
//
//  Created by Rossana Laricchia on 07/06/22.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filterdArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
	   getUser()
	   updateFilteredArray()
    }
    
    func updateFilteredArray() {
	   // sort
	   /*
	    filterdArray = dataArray.sorted { (u1, u2) -> Bool in
		   return u1.points > u2.points
	    }
	    
	    // OR
	    filterdArray = dataArray.sorted(by: { $0.points < $1.points })
	    */

	   // filter
	   /*
	    filterdArray = dataArray.filter({ (user) -> Bool in
 //		  return user.isVerified
		   return user.name.contains("i")
	    })
	    
	    // OR
	    filterdArray = dataArray.filter({ $0.isVerified })
	    */

	   // map - transform data from one type to another type
	   /*
	    
	    mappedArray = dataArray.map({ (user) -> String in
		   return user.name ?? "ERROR"
	    })

	    // OR
	    mappedArray = dataArray.map({ $0.name })
	    
	    // with nil value
	    mappedArray = dataArray.compactMap({ (user) -> String? in
		   return user.name
	    })
	    
	    // OR
	    mappedArray = dataArray.compactMap({ $0.name })
	    */
	   
	   
//	   let sort = dataArray.sorted { $0.points > $1.points }
//	   let filter = dataArray.filter { $0.isVerified }
//	   let map = dataArray.compactMap { $0.name }
	   
	   mappedArray = dataArray
		  .sorted { $0.points > $1.points }
		  .filter { $0.isVerified }
		  .compactMap { $0.name }
    }
    
    func getUser() {
	   let u1 = UserModel(name: "Nick", points: 5, isVerified: true)
	   let u2 = UserModel(name: "Jhon", points: 10, isVerified: false)
	   let u3 = UserModel(name: "Erika", points: 4, isVerified: true)
	   let u4 = UserModel(name: nil, points: 8, isVerified: true)
	   let u5 = UserModel(name: "Rossana", points: 2, isVerified: false)
	   let u6 = UserModel(name: "Fabio", points: 0, isVerified: true)
	   let u7 = UserModel(name: nil, points: 6, isVerified: false)
	   self.dataArray.append(contentsOf: [u1, u2, u3, u4, u5, u6, u7])
    }
}

struct ArraysBootcamp: View {
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
	   ScrollView {
		  VStack(spacing: 20) {
			 ForEach(vm.mappedArray, id: \.self, content: { name in
				Text(name)
				    .font(.title)
			 })
			 
//			 ForEach(vm.filterdArray) { user in
//				VStack(alignment: .leading) {
//				    Text(user.name)
//					   .font(.headline)
//				    HStack {
//					   Text("Points: \(user.points)")
//					   Spacer()
//					   if user.isVerified {
//						  Image(systemName: "flame.fill")
//					   }
//				    }
//				}
//			 }
			 .padding()
			 .background(Color.blue.cornerRadius(20))
		  }
		  .padding()
	   }
    }
}

struct ArraysBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ArraysBootcamp()
    }
}
