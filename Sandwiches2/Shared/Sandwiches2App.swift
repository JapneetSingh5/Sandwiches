//
//  Sandwiches2App.swift
//  Shared
//
//  Created by Japneet Singh on /246/20.
//

import SwiftUI

@main
struct Sandwiches2App: App {
    @StateObject private var store = SandwichStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}

struct Sandwiches2App_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}
