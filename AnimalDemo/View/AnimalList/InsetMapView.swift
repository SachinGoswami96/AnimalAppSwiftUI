//
//  InsetMapView.swift
//  AnimalDemo
//
//  Created by Sachingiri Goswami on 27/11/24.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(destination: Text("Hello, World!")) {
                    HStack {
                        Image(systemName: "location.fill")
                            .font(.title)
                            .foregroundColor(.accentColor)
                        Text("Location")
                            .font(.headline)
                            .fontWeight(.bold)
                            
                    }
                    .padding()
                    .background(Color.black.opacity(0.4))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .padding(12)
                , alignment: .topTrailing
                
                
            )
            .frame(width: .infinity, height: 300)
            .padding(.leading)
            .padding(.trailing)
    }
}

#Preview {
    InsetMapView()
}
