//
//  BackgroundThreadBootcamp.swift
//  SwiftUIIntermediateBootcamp
//
//  Created by Rossana Laricchia on 14/06/22.
//

import SwiftUI

class BackgroundThreadViewModel: ObservableObject {
    @Published var data: [String] = []
    
    func fetchData() {
        // download data in the background thread
        DispatchQueue.global().async {
            let newData = self.downloadData()
            print(Thread.isMainThread)
            print(Thread.current)

            // update UI in the main thread
            DispatchQueue.main.async {
                self.data = newData
                print(Thread.isMainThread)
                print(Thread.current)
            }
        }
    }
    
    private func downloadData() -> [String] {
        var data: [String] = []
        
        for x in 0..<100 {
            data.append("\(x)")
            print(data)
        }
        return data
    }
}

struct BackgroundThreadBootcamp: View {
    @StateObject var vm = BackgroundThreadViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Load Data")
                    .font(.title)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                
                ForEach(vm.data, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundColor(.orange)
                }
            }
        }
    }
}
    
struct BackgroundThreadBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundThreadBootcamp()
    }
}
