//
//  InsetFactView.swift
//  AnimalDemo
//
//  Created by Sachingiri Goswami on 27/11/24.
//

import SwiftUI

struct InsetFactView: View {
    let animal: Animal
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                }
            }
            .tabViewStyle(.page)
            .frame( minHeight: 148,idealHeight: 168, maxHeight: 180)
        }
        
    }
}

#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    InsetFactView(animal: animals[0])
}
