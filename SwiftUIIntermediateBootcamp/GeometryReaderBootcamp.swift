//
//  GeometryReaderBootcamp.swift
//  SwiftUIIntermediateBootcamp
//
//  Created by Rossana Laricchia on 05/06/22.
//

import SwiftUI

/*
 By adding a Geometry Reader to the view, we can find the contents exact size and location on the screen.
 GeometryReader is very expensive, it costs a lot of computing power to use.
 */
struct GeometryReaderBootcamp: View {
    var body: some View {
//	   FrameGeometryReader()
	   ScrollGeometryReader()
    }
}

struct FrameGeometryReader: View {
    var body: some View {
	   GeometryReader { geometry in
		  HStack(spacing: 0) {
			 Rectangle()
				.fill(Color.red)
			    // is not adaptive to the device rotation
//				.frame(width: UIScreen.main.bounds.width * 0.66666)
				.frame(width: geometry.size.width * 0.66666)
				
			 Rectangle()
				.fill(Color.blue)
		  }
		  .ignoresSafeArea()
	   }
    }
}

struct ScrollGeometryReader: View {
    
    func getPercentage(geo: GeometryProxy) -> Double {
	   let maxDistance = UIScreen.main.bounds.width / 2
	   let currentX = geo.frame(in: .global).minX
	   return Double(1 - (currentX / maxDistance))
    }
    
    var body: some View {
	   ScrollView(.horizontal, showsIndicators: false) {
		  HStack {
			 ForEach(0..<20) { index in
				GeometryReader { geometry in
				    RoundedRectangle(cornerRadius: 20)
					   .rotation3DEffect(
						  Angle(degrees: getPercentage(geo: geometry) * 20),
						  axis: (x: 0.0, y: 1.0, z: 0.0)
					   )
				}
				.frame(width: 300, height: 250)
				.padding()
			 }
		  }
	   }
    }
}

struct GeometryReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
	   GeometryReaderBootcamp()
		  .previewInterfaceOrientation(.portrait)
    }
}
