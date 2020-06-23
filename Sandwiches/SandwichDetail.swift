//
//  SandwichDetail.swift
//  Sandwiches
//
//  Created by Japneet Singh on /236/20.
//  Copyright © 2020 Japneet Singh. All rights reserved.
//

import SwiftUI

struct SandwichDetail: View {
    var sandwich: Sandwich
    @State private var zoomed = false
    
    var body: some View {
        VStack {
            Spacer(minLength: 0)
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .onTapGesture {
                        withAnimation {
                            self.zoomed.toggle()
                            }
                }
            Spacer(minLength:0)
            if(sandwich.isSpicy && !self.zoomed){
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
        .navigationBarTitle(sandwich.name)
        .edgesIgnoringSafeArea(.bottom)
    
        
    }
}

struct SandwichDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            NavigationView{
            SandwichDetail(sandwich: testData[1])
            }
            NavigationView{
            SandwichDetail(sandwich: testData[0])
            }
        }
    }
}
