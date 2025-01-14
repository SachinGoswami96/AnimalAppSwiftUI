//
//  AnimalBanner.swift
//  AnimalDemo
//
//  Created by Sachingiri Goswami on 14/11/24.
//

import SwiftUI

struct AnimalBanner: View {
    var arrCoverImages : [CoverImage] =  Bundle.main.decode("covers.json")
    @ObservedObject var animalListModel =  AnimalListViewModell()
    var body: some View {
        TabView {
            ForEach(animalListModel.coverImage) { coverImage in
                Image(coverImage.name)
                    .resizable()
                    .scaledToFit()
            }
        }
        .tabViewStyle(.page)
        .onAppear() {
            animalListModel.getImageList()
        }
    }
}

#Preview {
    AnimalBanner()
}
