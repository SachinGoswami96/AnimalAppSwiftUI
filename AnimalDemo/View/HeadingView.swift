//
//  HeadingView.swift
//  AnimalDemo
//
//  Created by Sachingiri Goswami on 20/11/24.
//

import SwiftUI

struct HeadingView: View {
    var image: String = ""
    var title: String = ""
    var body: some View {
        HStack {
            Image(systemName:image)
                .resizable()
                .scaledToFit()
                .frame(height: 20)
                .foregroundStyle(.accent)
            Text(title)
                .font(.title)
            
        }
    }
}

#Preview {
    HeadingView()
}
