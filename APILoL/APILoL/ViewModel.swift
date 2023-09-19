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
//
struct Abilities : Codable, Hashable {
   // let id : String?
    let slot : String?
    let displayName : String?
    let description : String?
    let displayIcon : String?
    
}


//
//struct recruitmentData : Codable {
//    let counterId : String
//    let mileStoneId : String
//    let mileStoneThreshold : String
//    let useLevelVpCostOverride : String
//    let levelVpCostOverride : String
//    let startDate : Date
//    let endDate : Date
//
//}
//
//struct VoiceLine : Codable {
//    let minDuration : String?
//    let maxDuration : String?
//    let mediaList : mediaList
//}
//
//struct mediaList : Codable {
//    let id : Int
//    let wwise : String
//    let wave : String
//}

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
    // let voiceLine : VoiceLine
    //    let recruitmentData : recruitmentData
    let abilities : [Abilities]?
}

//struct Agent : Codable, Identifiable {
//    let id : Int
//    let status : Int
//    let data : Agents
//}

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
