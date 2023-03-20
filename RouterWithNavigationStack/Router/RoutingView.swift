//
//  RoutingView.swift
//  RouterWithNavigationStack
//
//  Created by Ihor Vovk on 07/02/2023.
//

import SwiftUI

struct RoutingView<Content: View>: View {
    
    @StateObject var router: Router
    private let content: Content
    
    init(router: Router, @ViewBuilder content: @escaping () -> Content) {
        _router = StateObject(wrappedValue: router)
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: router.navigationPath) {
            content
                .navigationDestination(for: ViewSpec.self) { spec in
                    router.view(spec: spec, route: .navigation)
                }
        }.sheet(item: router.presentingSheet) { spec in
            router.view(spec: spec, route: .sheet)
        }.fullScreenCover(item: router.presentingFullScreen) { spec in
            router.view(spec: spec, route: .fullScreenCover)
        }.modal(item: router.presentingModal) { spec in
            router.view(spec: spec, route: .modal)
        }
    }
}
