//
//  Menu.swift
//  RxSwift+MVVM
//
//  Created by 이융의 on 3/7/25.
//  Copyright © 2025 iamchiwon. All rights reserved.
//

import Foundation


// ViewModel
struct Menu {
    var id: Int
    var name: String
    var price: Int
    var count: Int
}

extension Menu {
    static func fromMenuItems(id: Int, item: MenuItem) -> Menu {
        return Menu(id: id, name: item.name, price: item.price, count: 0)
    }
}
