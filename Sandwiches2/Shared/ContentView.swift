//
//  ContentView.swift
//  Shared
//
//  Created by Japneet Singh on /246/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: SandwichStore
    
    var body: some View {
        NavigationView{
            List{
                ForEach(store.sandwiches){ sandwich in
                    SandwichCell(sandwich: sandwich)
                }
                .onMove(perform: moveSandwiches)
                .onDelete(perform: deleteSandwiches)
                
                HStack {
                    Spacer()
                    Text("\(store.sandwiches.count) Sandwiches")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .navigationTitle("Sandwiches")
            .toolbar {
                #if os(iOS)
                EditButton()
                #endif
                Button("Add", action: makeSandwich)
                    .padding(.leading)
            }
            
        
            Text("Select a sandwich")
                .font(.largeTitle)
        }
    }
    
    func makeSandwich() {
        withAnimation{
            store.sandwiches.append(Sandwich(name: "Patty melt", ingredientCount: 3))
        }
    }

    func moveSandwiches(from: IndexSet, to: Int){
        withAnimation{
            store.sandwiches.move(fromOffsets: from, toOffset: to)
        }
    }

    func deleteSandwiches(offsets: IndexSet){
        withAnimation {
            store.sandwiches.remove(atOffsets: offsets)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(store: testStore)
            ContentView(store: testStore)
                .preferredColorScheme(.dark)
        }
    }
}

struct SandwichCell: View {
    var sandwich: Sandwich
    
    var body: some View {
        NavigationLink(
            destination: SandwichDetail(sandwich: sandwich)){
            Image(systemName: "photo")
            
            VStack(alignment: .leading) {
                Text(sandwich.name)
                    .multilineTextAlignment(.leading)
                Text("\(sandwich.ingredientCount) ingredients")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .cornerRadius(8)
            }
        }
    }
}


