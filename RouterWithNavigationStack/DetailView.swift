//
//  DetailView.swift
//  RouterWithNavigationStack
//
//  Created by Ihor Vovk on 08/02/2023.
//

import SwiftUI

struct DetailView: View {
    
    private let description: String
    @StateObject private var router: MainRouter
    
    init(description: String, router: MainRouter) {
        self.description = description
        _router = StateObject(wrappedValue: router)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(description)
            Button("Present Alert") {
                router.presentAlert()
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailView(description: "Description", router: MainRouter(isPresented: .constant(.detail("Details"))))
    }
}
