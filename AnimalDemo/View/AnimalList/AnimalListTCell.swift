//
//  AnimalListTCell.swift
//  AnimalDemo
//
//  Created by Sachingiri Goswami on 14/11/24.
//

import SwiftUI

struct AnimalListTCell: View {
    let objAnimal:  Animal
    var body: some View {
        HStack(alignment: .center,spacing: 16) {
            Image(objAnimal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            VStack(alignment: .leading) {
                Text(objAnimal.name)
                    .font(.title)
                Text(objAnimal.description)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }
    }
}

#Preview {
    let animals: [Animal] =  Bundle.main.decode("animals.json")
    AnimalListTCell(objAnimal:  animals[0])
}
