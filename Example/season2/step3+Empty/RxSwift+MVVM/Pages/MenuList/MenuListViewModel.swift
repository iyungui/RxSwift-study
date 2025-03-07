//
//  MenuListViewModel.swift
//  RxSwift+MVVM
//
//  Created by 이융의 on 3/7/25.
//  Copyright © 2025 iamchiwon. All rights reserved.
//

import Foundation

class MenuListViewModel {
    
    var menus: [Menu] = [
        Menu(name: "튀김1", price: 100, count: 0),
        Menu(name: "튀김1", price: 100, count: 0),
        Menu(name: "튀김1", price: 100, count: 0),
        Menu(name: "튀김1", price: 100, count: 0),
        Menu(name: "튀김1", price: 100, count: 0),
    ]
    
    var itemsCount: Int = 5
    var totalPrice: Int = 10_000
}
