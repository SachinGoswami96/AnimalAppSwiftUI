//
//  VideoDetailsView.swift
//  AnimalDemo
//
//  Created by Sachingiri Goswami on 20/11/24.
//

import SwiftUI
import AVKit

struct VideoDetailsView: View {
    let video:Videos
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: video.id, fileFormat: "mp4"))
        }
    }
}

#Preview {
    let videos:[Videos] =  Bundle.main.decode("videos.json")
    VideoDetailsView(video: videos[0])
}
