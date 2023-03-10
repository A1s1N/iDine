//
//  ItemDetail.swift
//  iDine
//
//  Created by Никита Александров on 16.02.2023.
//

import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorite: Favorite
    @State var activeButton = false
    @State var activeFavoriteButton = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(item.mainImage)
                        .resizable()
                        .scaledToFit()
                    Text("Photo: \(item.photoCredit)")
                        .padding(4)
                        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 5))
                        .font(.caption)
                        .offset(x: -5, y: -5)
                }
                Text(item.description)
                    .padding()
                Spacer()
                Button(action: {
                    order.add(item: item)
                    activeButton = true
                }, label: {
                    HStack {
                        if activeButton {
                            Image(systemName: "basket.fill")
                        } else {
                            Image(systemName: "basket")
                        }
                        
                        Text("Order This")
                    }
                })
                .padding()
                .foregroundColor(.black)
                .background(.yellow)
                .cornerRadius(5)
            }
            .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            Button {
                favorite.add(item: item)
                activeFavoriteButton = true
            } label: {
                if activeFavoriteButton {
                    Image(systemName: "star.full")
                } else {
                    Image(systemName: "star.fill")
                }
            }
        }
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ItemDetail(item: MenuItem.example).environmentObject(Order())
        }
    }
}
