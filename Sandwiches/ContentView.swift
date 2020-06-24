//
//  ContentView.swift
//  Sandwiches
//
//  Created by Japneet Singh on 23///6/20.
//  Copyright © 2020 Japneet Singh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var sandwiches: [Sandwich] = []
    
    var body: some View {
            NavigationView{
                List{
                    ForEach(sandwiches){ sandwich in
                        SandwichCell(sandwich: sandwich)
                    }
                    HStack(alignment: .top) {
                        Spacer()
                        Text("\(sandwiches.count) Sandwiches")
                            .foregroundColor(.secondary)
                            .navigationTitle("Sandwiches")
                        Spacer()
                    }
                    
                }
                
                Text("Select a sandwich from the sidebar")
                    .font(.largeTitle)
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(sandwiches: testData)
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 11 Pro")
    }
}

struct SandwichCell: View {
    var sandwich: Sandwich
    var body: some View {
        NavigationLink(destination: SandwichDetail(sandwich: sandwich)){
            Image(systemName: "photo").cornerRadius(8)
            VStack(alignment: .leading) {
                Text(sandwich.name)
                    .multilineTextAlignment(.leading)
                Text("\(sandwich.ingredientCount)  ingredients")
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
        }
    }
}
