//
//  MapAnnotationView.swift
//  AnimalDemo
//
//  Created by Sachingiri Goswami on 29/11/24.
//

import SwiftUI

struct MapAnnotationView: View {
    let location : NationalParkLocation
    @State private var animation : Double = 0.0
    var body: some View {
        ZStack {
            Circle()
                .fill(.accent)
                .frame(width: 52, height: 52)
            Circle()
                .stroke(.accent, lineWidth: 2)
                .frame(width: 54, height: 54)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .clipShape(.circle)
            
        }
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

#Preview {
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    MapAnnotationView(location: locations[0])
}
