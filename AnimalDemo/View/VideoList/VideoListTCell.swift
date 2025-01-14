//
//  VideoListTCell.swift
//  AnimalDemo
//
//  Created by Sachingiri Goswami on 20/11/24.
//

import SwiftUI

struct VideoListTCell: View {
    let video: Videos
    var body: some View {
        HStack(spacing: 15) {
            ZStack {
                Image(video.id)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                
                Image(systemName:"play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
            }
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .foregroundStyle(.accent)
                    .font(.headline)
                    .fontWeight(.bold)
                    .lineLimit(1)
                Text(video.headline)
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    let videos:[Videos] =  Bundle.main.decode("videos.json")
    VideoListTCell(video: videos[0])
}
