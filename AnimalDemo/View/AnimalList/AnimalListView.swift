//
//  AnimalListView.swift
//  AnimalDemo
//
//  Created by Sachingiri Goswami on 12/11/24.
//

import SwiftUI

struct AnimalListView: View {
    @ObservedObject var animalListModel =  AnimalListViewModell()
//    let animals: [Animal] =  Bundle.main.decode("animals.json")
    @State private var gridColumn: Int = 1
    @State private var toolBarIcon: String = "square.grid.2x2"
    @State private var isGridViewLayout: Bool  = false
    @State private var gridLayout: [GridItem]  = [GridItem(.flexible())]
    
    func gridSwitch() {
        withAnimation(.easeIn) {
            gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
            gridColumn = gridLayout.count
            print("Grid Number: \(gridColumn)")
        }
    }
    
    func getGridSwitchICons() {

           switch gridColumn {
           case 1:
               toolBarIcon = "square.grid.2x2"
           case 2:
               toolBarIcon = "square.grid.3x2"
           case 3:
               toolBarIcon = "rectangle.grid.1x2"
           default:
               toolBarIcon = "square.grid.2x2"
           }

       }
    var body: some View {
        NavigationView {
            Group {
                if animalListModel.animals.isEmpty || animalListModel.coverImage.isEmpty{
                    ProgressView("Api Calling")
                } else {
                    if isGridViewLayout {
                        ScrollView(.vertical, showsIndicators: false) {
                            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                                ForEach(animalListModel.animals) { animal in
                                    AnimalCCell(objAnimals: animal)
                                }
                            }
                            
                        }
                        
                    } else {
                            List {
                                AnimalBanner()
                                    .frame(height: 300)
                
                                ForEach(animalListModel.animals) { animal in
                                    NavigationLink(destination: AnimalDetailView(animal: animal), label: {
                                        AnimalListTCell(objAnimal: animal)
                                    })
                                    
                                }
                                HStack {
                                    Spacer()
                                    CreditsView()
                                    Spacer()
                                }
                            }
                            .listStyle(.plain)
                            
                    }
                }
            }
            .navigationTitle("Animal List")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button(action: {
                            print("Add Animal")
                            isGridViewLayout.toggle()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                        }
                        Button(action: {
                            print("Add Animal")
                            if gridColumn > 2 {
                                gridColumn = 1
                            } else {
                                gridColumn = 1 + gridColumn
                            }
                            getGridSwitchICons()
                            gridSwitch()
                        }) {
                            Image(systemName: toolBarIcon)
                                .font(.title2)
                        }
                    }
                }
            }
        }
    }
//        Text("Animal List View")
//            .onAppear {
//                print(animals)
//            }
    
}

#Preview {
    AnimalListView()
}
