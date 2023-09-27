//
//  ViewModel.swift
//  APILoL
//
//  Created by Student13 on 12/09/23.
//

import SwiftUI

struct Data : Decodable {
    
    let data : [Agents]
    
}
struct Abilities : Codable, Hashable {
    let slot : String?
    let displayName : String?
    let description : String?
    let displayIcon : String?
    
}


struct Role : Decodable, Hashable{
    let uuid : String?
    let displayName : String?
    let description : String?
    let displayIcon : String?
}

struct Agents : Decodable, Hashable{
    
    let uuid : String?
    let displayName : String?
    let description : String?
    let developerName : String?
    let characterTags : [String?]?
    let displayIcon : String?
    let displayIconSmall : String?
    let bustPortrait : String?
    let fullPortrait : String?
    let fullPortraitV2 : String?
    let killfeedPortrait : String?
    let background : String?
    let backgroundGradientColors : [String?]
    let assetPath : String?
    let isFullPortraitRightFacing : Bool
    let isPlayableCharacter : Bool
    let isAvailableForTest : Bool
    let isBaseContent : Bool
    let role : Role?
    let abilities : [Abilities]?
}

class ViewModel : ObservableObject {
    
    @Published var chars : [Agents] = []
    
    func fetch(){
        guard let url = URL(string : "https://valorant-api.com/v1/agents?isPlayableCharacter=true&language=pt-BR") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {
                let parsed = try JSONDecoder().decode(Data.self, from: data)
                
                DispatchQueue.main.async {
                    self?.chars = parsed.data
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}
