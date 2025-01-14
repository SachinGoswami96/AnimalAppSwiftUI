//
//  CreditsView.swift
//  AnimalDemo
//
//  Created by Sachingiri Goswami on 14/11/24.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack{
            Image("launch-screen-image")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
            Text("Created by Sachingiri Goswami")
                .font(.footnote)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    CreditsView()
}
