//
//  MainView.swift
//  RouterWithNavigationStack
//
//  Created by Ihor Vovk on 07/02/2023.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var router: MainRouter
    
    init(router: MainRouter) {
        _router = StateObject(wrappedValue: router)
    }
    
    var body: some View {
        RoutingView(router: router) {
            VStack {
                Spacer()
                Button("Present List") {
                    router.presentList()
                }
                
                Spacer()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView(router: MainRouter(isPresented: .constant(.main)))
    }
}
