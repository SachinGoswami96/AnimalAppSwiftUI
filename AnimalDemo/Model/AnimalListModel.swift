//
//  AnimalListModel.swift
//  AnimalDemo
//
//  Created by Sachingiri Goswami on 12/11/24.
//

import Foundation

struct Animal: Identifiable, Codable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: URL
    let image: String
    let gallery: [String]
    let fact: [String]
}

