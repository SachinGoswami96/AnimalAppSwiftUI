//
//  InsetGallaryView.swift
//  AnimalDemo
//
//  Created by Sachingiri Goswami on 27/11/24.
//

import SwiftUI

struct InsetGallaryView: View {
    let animal : Animal
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(animal.gallery.indices) { index in
                    Image(animal.gallery[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }        }
    }
}

#Preview {
    let animals : [Animal] = Bundle.main.decode("animals.json")
    InsetGallaryView(animal: animals[0])
}
