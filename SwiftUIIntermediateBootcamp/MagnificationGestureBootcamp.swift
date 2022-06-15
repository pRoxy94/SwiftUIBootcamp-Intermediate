//
//  MagnificationGestureBootcamp.swift
//  SwiftUIIntermediateBootcamp
//
//  Created by Rossana Laricchia on 26/05/22.
//

import SwiftUI

struct MagnificationGestureBootcamp: View {
    
    @State var currentAmount: CGFloat = 0
    
    var body: some View {
	   
	   VStack {
		  HStack {
			 Circle().frame(width: 35, height: 35)
			 Text("Bootcamp")
			 Spacer()
			 Image(systemName: "ellipsis")
		  }
		  .padding(.horizontal)
		  
		  Rectangle()
			 .frame(height: 300)
			 .scaleEffect(1 + currentAmount)
			 .gesture(
				MagnificationGesture()
				    .onChanged { value in
					   currentAmount = value - 1
				    }
				
				    .onEnded({ value in
					   withAnimation(.spring()) {
						  currentAmount = 0
					   }
				    })
			 )
		  
		  HStack {
			 Image(systemName: "heart.fill")
			 Image(systemName: "text.bubble.fill")
			 Spacer()
		  }
		  .padding(.horizontal)
		  .font(.headline)
		  
		  Text("This is the caption for my photo!")
			 .frame(maxWidth: .infinity, alignment: .leading)
			 .padding(.horizontal)
	   }
    }
}

struct MagnificationGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureBootcamp()
    }
}
