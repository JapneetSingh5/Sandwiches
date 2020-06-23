//
//  SandwichStore.swift
//  Sandwiches
//
//  Created by Japneet Singh on /246/20.
//  Copyright © 2020 Japneet Singh. All rights reserved.
//

import Foundation

class SandwichStore: ObservableObject{
    @Published var sandwiches: [Sandwich]
    
    init(sandwiches: [Sandwich] = [] ){
        self.sandwiches = sandwiches
    }

    let testStore = SandwichStore(sandwiches: testData)
}
