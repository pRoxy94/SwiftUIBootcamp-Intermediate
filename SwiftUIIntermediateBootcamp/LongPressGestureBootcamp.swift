//
//  LongPressGestureBootcamp.swift
//  SwiftUIIntermediateBootcamp
//
//  Created by Rossana Laricchia on 25/05/22.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    
    var body: some View {
	   
	   VStack {
		  Rectangle()
			 .fill(isSuccess ? Color.green : Color.blue)
			 .frame(maxWidth: isComplete ? .infinity : 0)
			 .frame(height: 55)
			 .frame(maxWidth: .infinity, alignment: .leading)
			 .background(Color.gray)
		  
		  HStack {
			 Text("CLICK HERE")
				.foregroundColor(.white)
				.padding()
				.background(Color.black)
			 .cornerRadius(10)
			 .onLongPressGesture(
				minimumDuration: 1.0,
				maximumDistance: 50,
				perform: {
				    // at the min duration
				    withAnimation(.easeInOut) {
					   isSuccess = true
				    }
				},
				onPressingChanged: { isPressing in
				    // start of press -> min duration
				    if isPressing {
					   withAnimation(.easeInOut(duration: 1.0)) {
						  isComplete = true
					   }
				    } else {
					   DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
						  if !isSuccess {
							 withAnimation(.easeInOut) {
								isComplete = false
							 }
						  }
					   }
				    }
				}
			 )
			 
			 Text("RESET")
				.foregroundColor(.white)
				.padding()
				.background(Color.black)
			 .cornerRadius(10)
			 .onTapGesture {
				isComplete = false
				isSuccess = false
			 }
		  }
	   }
    }
}

struct LongPressGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureBootcamp()
    }
}
