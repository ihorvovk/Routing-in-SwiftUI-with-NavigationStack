//
//  ViewSpec.swift
//  RouterWithNavigationStack
//
//  Created by Ihor Vovk on 07/02/2023.
//

import Foundation

enum ViewSpec: Equatable, Hashable {
    
    case main
    case list
    case detail(String)
    case alert
}

extension ViewSpec: Identifiable {
    
    var id: Self { self }
}
