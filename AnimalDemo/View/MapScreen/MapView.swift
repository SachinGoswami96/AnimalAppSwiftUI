//
//  MapView.swift
//  AnimalDemo
//
//  Created by Sachingiri Goswami on 12/11/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region : MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
      }()
    let location :  [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
        Map(coordinateRegion: $region,annotationItems: location, annotationContent: { item in
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        })
        .overlay(
            HStack(alignment: .center, spacing: 10, content: {
                Image("compass")
                    .resizable()
                    .scaledToFill()
                    .font(.title)
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text("latitude")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.accent)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .fontWeight(.bold)
                    }
                    Divider()
                        .frame(height: 5)
                    HStack {
                        Text("longitude")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.accent)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .fontWeight(.bold)
                    }
                    
                }
            })
            .padding(.vertical, 16)
            .padding(.horizontal, 15)
            .background(Color.black.cornerRadius(15).opacity(0.5))
            .padding()
            .padding(.top,40)
            
            
            
        , alignment: .top)
        .ignoresSafeArea()
    }
}

#Preview {
    MapView()
}
