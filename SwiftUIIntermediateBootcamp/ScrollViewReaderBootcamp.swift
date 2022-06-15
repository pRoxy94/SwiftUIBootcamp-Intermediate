//
//  ScrollViewReaderBootcamp.swift
//  SwiftUIIntermediateBootcamp
//
//  Created by Rossana Laricchia on 05/06/22.
//

import SwiftUI

/*
 The ScrollViewReader is a super-handy accessory to a ScrollView that allows us to programmatically scroll to a certain location within the ScrollView's content. By adding a "reader", we can quickly scroll to the top, bottom, or any specific item with just a few lines of code!
 */
struct ScrollViewReaderBootcamp: View {
    
    @State var text: String = ""
    @State var scrollToIndex: Int = 0
    
    var body: some View {
	   VStack {
		  TextField("Enter a # here...", text: $text)
			 .frame(height: 55)
			 .border(Color.gray)
			 .padding(.horizontal)
			 .keyboardType(.numberPad)
		  
		  
		  Button("Scroll now") {
			 withAnimation(.spring()) {
				if let index = Int(text) {
				    scrollToIndex = index
				}
			 }
		  }
		  
		  ScrollView {
			 ScrollViewReader { proxy in

				ForEach(0..<50) { index in
				    Text("This is item #\(index)")
					   .font(.headline)
					   .frame(height: 200)
					   .frame(maxWidth: .infinity)
					   .background(Color.white)
					   .cornerRadius(10)
					   .shadow(radius: 10)
					   .padding()
					   .id(index)
				}
				.onChange(of: scrollToIndex) { value in
				    withAnimation(.spring()) {
					   proxy.scrollTo(value, anchor: .top)

				    }
				}
			 }
		  }
	   }
    }
}

struct ScrollViewReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderBootcamp()
    }
}
