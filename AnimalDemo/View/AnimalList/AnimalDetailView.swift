//
//  AnimalDetailView.swift
//  AnimalDemo
//
//  Created by Sachingiri Goswami on 20/11/24.
//

import SwiftUI

struct AnimalDetailView: View {
    let animal: Animal
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Image(animal.image)
                        .resizable()
                        .scaledToFit()
                    Text(animal.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 8)
                        .lineLimit(0)
                        .foregroundColor(.primary)
                        .background(
                            Color.accentColor
                                .frame(height: 6)
                                .offset(y: 24)
                        )
                    Text(animal.headline)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.accent)
                        .padding(.horizontal)
                    
                    Group {
                        HeadingView(image: "photo.on.rectangle.angled", title: "Wilderness in Pictures")
                            .padding(.bottom)
                            
                        InsetGallaryView(animal: animal)
                    }
                    Group {
                        HeadingView(image: "questionmark.circle", title: "Did you know?")
                            .padding(.bottom)
                        InsetFactView(animal: animal)
                    }
                    Group {
                        HeadingView(image: "info.circle", title: "all about \(animal.name)")
                            .padding(.bottom)
                        Text(animal.description)
                    }
                    .padding(.horizontal)
                    Group {
                        HeadingView(image: "map", title: "National Parks")
                            .padding(.bottom)
                        InsetMapView()
                    }
                    
                    
                }
            }
        }
        .navigationTitle(animal.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let animals: [Animal] =  Bundle.main.decode("animals.json")
    AnimalDetailView(animal: animals[0])
}
