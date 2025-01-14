//
//  GallaryListView.swift
//  AnimalDemo
//
//  Created by Sachingiri Goswami on 12/11/24.
//

import SwiftUI

struct GallaryListView: View {
    let animals: [Animal] =  Bundle.main.decode("animals.json")
    @State var gridColumn: Double = 3
    @State private var gridLayout: [GridItem]  = [GridItem(.flexible())]
    @State private var selectedIndex: Int = 0
    func gridSwitch() {
        withAnimation(.easeIn) {
            gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
        }
    }
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .center,spacing: 30) {
                Image(animals[selectedIndex].image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(.circle)
                    .overlay(content: {
                        Circle().stroke(Color.white, lineWidth: 5)
                    })
                    .shadow(radius: 5)
                
                Slider(value: $gridColumn, in: 2...4, step: 1)
                  .padding(.horizontal)
                  .onChange(of: gridColumn, perform: { value in
                    gridSwitch()
                  })
                
                LazyVGrid(columns: gridLayout,alignment: .center, spacing: 10) {
                    ForEach(animals.indices) { index in
                        Image(animals[index].image)
                            .resizable()
                            .scaledToFill()
//                            .frame(width: 100, height: 100)
                            .clipShape(.circle)
                            .overlay(content: {
                                Circle().stroke(style: StrokeStyle(lineWidth: 5, dash: [10, 5]))
                            })
                            .shadow(radius: 5)
                            .onTapGesture {
                                selectedIndex = index
                            }
                    }
                }.onAppear() {
                    gridSwitch()
                }
            }
        }
        
    }
}

#Preview {
    GallaryListView()
}
