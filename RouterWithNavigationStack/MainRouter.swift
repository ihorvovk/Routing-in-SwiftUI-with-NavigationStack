//
//  MainRouter.swift
//  RouterWithNavigationStack
//
//  Created by Ihor Vovk on 08/02/2023.
//

import SwiftUI

class MainRouter: Router {
    
    func presentList() {
        presentSheet(.list)
    }
    
    func presentDetail(description: String) {
        navigateTo(.detail(description))
    }
    
    func presentAlert() {
        presentModal(.alert)
    }
    
    override func view(spec: ViewSpec, route: Route) -> AnyView {
        AnyView(buildView(spec: spec, route: route))
    }
}

private extension MainRouter {
    
    @ViewBuilder
    func buildView(spec: ViewSpec, route: Route) -> some View {
        switch spec {
        case .list:
            ListView(router: router(route: route))
        case .detail(let description):
            DetailView(description: description, router: router(route: route))
        case .alert:
            AlertView()
        default:
            EmptyView()
        }
    }
            
    func router(route: Route) -> MainRouter {
        switch route {
        case .navigation:
            return self
        case .sheet:
            return MainRouter(isPresented: presentingSheet)
        case .fullScreenCover:
            return MainRouter(isPresented: presentingFullScreen)
        case .modal:
            return self
        }
    }
}
