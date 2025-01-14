//
//  AnimalCCell.swift
//  AnimalDemo
//
//  Created by Sachingiri Goswami on 14/11/24.
//

import SwiftUI

struct AnimalCCell: View {
    let objAnimals: Animal
    var body: some View {
        Image(objAnimals.image)
            .resizable()
            .scaledToFill()
            .cornerRadius(12)
    }
}

#Preview {
    let animals: [Animal] =  Bundle.main.decode("animals.json")
    AnimalCCell(objAnimals: animals[0])
}
