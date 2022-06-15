//
//  WeakSelfBootcamp.swift
//  SwiftUIIntermediateBootcamp
//
//  Created by Rossana Laricchia on 14/06/22.
//

import SwiftUI

/*
 Swift uses Automatic Reference Counting (ARC) to manage your app’s memory usage.
 ARC automatically frees up the memory used by class instances when those instances are no longer needed.
 
 As a developer, you want to try to keep the ARC count as low as possible, which will keep your app running fast and efficiently.
 */
struct WeakSelfBootcamp: View {
    
    @AppStorage("count") var count: Int?
    
    init() {
        count = 0
    }
    
    var body: some View {
        NavigationView {
            NavigationLink("Navigate") {
                WeakSelfSecondScreen()
            }.navigationTitle("Screen 1")
        }
        .overlay(
            Text("\(count ?? 0)")
                .font(.title)
                .padding()
                .background(Color.red)
                .cornerRadius(10),
            alignment: .topTrailing
        )
    }
}

struct WeakSelfSecondScreen: View {
    @StateObject var vm = WeakSelfSecondScreenViewModel()
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.title)
            .foregroundColor(.orange)
            
            if let data = vm.data {
                Text(data)
            }
        }
    }
}

class WeakSelfSecondScreenViewModel: ObservableObject {
    @Published var data: String? = nil
    
    init() {
        print("Init Now")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey: "count")
        getData()
    }
    
    deinit {
        print("DeInit Now")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
    
    func getData() {
        /*
         The problem comes into play when you are running asynchronous tasks
         */
//        DispatchQueue.global().async {
            /*
             self.data: this was creating a STRONG REFERENCE to WeakSelfSecondScreenViewModel class
             -> what u're telling the system is that while these tasks are running, the class
             absolutely need to stay alive cause we need that self when we come back
             */
//            self.data = "New data"
//        }
        
        /*
         If u were downloading a lot of data from the internet, the code in the async task might
         take a couple seconds (like 10s) and during that time the user could be doing something
         on the app (like pressing the back button) and by the time the call comes back u might
         not actually need this SELF to be alive.
         If u create these strong references all around the app when u re using self. u're going to
         get a ton of objects that are alive that don't need to be alive!
         */
//        DispatchQueue.main.asyncAfter(deadline: .now() + 500) {
//            self.data = "New data"
//        }
        
        /*
         [weak self] turns a strong reference into a weak reference
         */
        DispatchQueue.main.asyncAfter(deadline: .now() + 500) { [weak self] in
            self?.data = "New data"
        }
    }
}

struct WeakSelfBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        WeakSelfBootcamp()
    }
}
