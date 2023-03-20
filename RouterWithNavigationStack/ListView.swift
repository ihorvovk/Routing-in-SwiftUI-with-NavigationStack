//
//  ListView.swift
//  RouterWithNavigationStack
//
//  Created by Ihor Vovk on 08/02/2023.
//

import SwiftUI

struct ListView: View {
    
    @StateObject private var router: MainRouter
    
    init(router: MainRouter) {
        _router = StateObject(wrappedValue: router)
    }
    
    var body: some View {
        RoutingView(router: router) {
            VStack(spacing: 20) {
                ForEach(1..<4) {
                    cell(index: $0)
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        router.dismiss()
                    } label: {
                        Image(systemName: "xmark.circle")
                    }
                }
            }
        }
    }
}

private extension ListView {
    
    func cell(index: Int) -> some View {
        Button("Item \(index)") {
            router.presentDetail(description: "Description \(index)")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    
    static var previews: some View {
        ListView(router: MainRouter(isPresented: .constant(.list)))
    }
}
