//
//  SandwichDetail.swift
//  Sandwiches2
//
//  Created by Japneet Singh on /246/20.
//

import SwiftUI

struct SandwichDetail: View {
    var sandwich: Sandwich
    @State private var zoomed = false
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer(minLength: 0)
            
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation {
                    zoomed.toggle()
                    }
                }
            
            Spacer(minLength: 0)
            
            if sandwich.isSpicy && !zoomed {
                HStack {
                    Spacer()
                    Image(systemName: "flame.fill")
                    Text("Spicy")
                    Spacer()
                }
                .font(Font.headline.smallCaps())
                .padding(.all)
                .background(Color.red)
                .foregroundColor(Color.yellow)
                .transition(.move(edge: .bottom))
            }
            
        }
        .navigationTitle(sandwich.name)
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

struct SandwichDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView{
            SandwichDetail(sandwich: testData[0])
            }
            NavigationView{
                SandwichDetail(sandwich: testData[0])
            }
            NavigationView{
                SandwichDetail(sandwich: testData[1])
            }
        }
    }
}
