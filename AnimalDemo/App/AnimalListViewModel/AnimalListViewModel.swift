//
//  AnimalListViewModel.swift
//  AnimalDemo
//
//  Created by Sachingiri Goswami on 19/11/24.
//

import Foundation

class AnimalListViewModell: ObservableObject {
    @Published var animals: [Animal] = Bundle.main.decode("animals.json")
    @Published var coverImage: [CoverImage] = Bundle.main.decode("covers.json")
    
    func getAnimalList() {
        guard let url = URL(string: "https://mocki.io/v1/3675dbf7-2797-46b8-a026-1c9f5815a56e") else { return  }
        
        let request = URLRequest(url: url)
        
       let task = URLSession.shared.dataTask(with: request) { data, result, error in
            guard let data else { return }
            
            do {
                let animals = try JSONDecoder().decode([Animal].self, from: data)
                DispatchQueue.main.async {
                    self.animals = animals
                }
            } catch {
                print("error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    func getImageList() {
        guard let url = URL(string: "https://mocki.io/v1/1647d34b-ed0e-43ad-8d46-bf2dd00fff88") else { return  }
        
        let request = URLRequest(url: url)
        
       let task = URLSession.shared.dataTask(with: request) { data, result, error in
            guard let data else { return }
            
            do {
                let coverImage = try JSONDecoder().decode([CoverImage].self, from: data)
                DispatchQueue.main.async {
                    self.coverImage = coverImage
                }
            } catch {
                print("error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}
