//
//  MainTabView.swift
//  AnimalDemo
//
//  Created by Sachingiri Goswami on 12/11/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            AnimalListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("Animals")
                    }
                }
            
            VideoListView()
                .tabItem {
                    VStack {
                        Image(systemName: "play.circle")
                        Text("Details")
                    }
                }
            MapView()
                .tabItem {
                    VStack {
                        Image(systemName: "map")
                        Text("Details")
                    }
                }
            
            GallaryListView()
                .tabItem {
                    VStack {
                        Image(systemName: "photo")
                        Text("Details")
                    }
                }
            
        }
    }
}

#Preview {
    MainTabView()
}
