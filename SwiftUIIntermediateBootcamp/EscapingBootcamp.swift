//
//  EscapingBootcamp.swift
//  SwiftUIIntermediateBootcamp
//
//  Created by Rossana Laricchia on 16/06/22.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    @Published var text: String = "Hello"
    
    func getData() {
//        let newData = downloadData2()
//        text = newData
        
        
//        downloadData3 { [weak self] returnedData in
//            // closure -> self. -> strong reference -> weak self
//            self?.text = returnedData
//        }
        
//        downloadData4 { [weak self] returnedResult in
//            self?.text = returnedResult.data
//        }
        
        downloadData5 { [weak self] (returnedResult) in
            self?.text = returnedResult.data
        }
    }
    
    func downloadData() -> String {
        return "New Data"
    }
    
    // return value: -> Void or ()
    // external and internal name parameter -> _ data
    func downloadData2(completionHandler: (_ data: String) -> ()) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            return "New Data!"
//        }
        completionHandler("New Data!")
//        return "New Data!"
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            // Escaping closure captures non-escaping parameter 'completionHandler'
            // when we add @escaping it makes our code asynchronous which means it's not going to immediately execute and return
            completionHandler("Another new data!")
        }
    }
    
    func downloadData4(completionHandler: @escaping (DownloadResult) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "Antother new new new data!")
            completionHandler(result)
        }
    }
    
    // very efficient code
    func downloadData5(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "Five new data!")
            completionHandler(result)
        }
    }
}

struct DownloadResult {
    let data: String
}

typealias DownloadCompletion = (DownloadResult) -> ()

struct EscapingBootcamp: View {
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(.orange)
            .onTapGesture {
                vm.getData()
            }
    }
}

struct EscapingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        EscapingBootcamp()
    }
}
