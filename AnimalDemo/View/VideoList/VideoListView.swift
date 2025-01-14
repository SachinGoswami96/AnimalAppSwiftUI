//
//  VideoListView.swift
//  AnimalDemo
//
//  Created by Sachingiri Goswami on 12/11/24.
//

import SwiftUI

struct VideoListView: View {
    @State var videos:[Videos] =  Bundle.main.decode("videos.json")
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { video in
                    NavigationLink(destination: VideoDetailsView(video: video)) {
                        VideoListTCell(video: video)
                    }
                    
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Video List")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        videos.shuffle()
                    } label: {
                        Image(systemName: "shuffle")
                    }

                }
            }
        }
        
        
        
    }
}

#Preview {
    VideoListView()
}
