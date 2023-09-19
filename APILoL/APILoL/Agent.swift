//
//  Agent.swift
//  APILoL
//
//  Created by Student13 on 14/09/23.
//

import SwiftUI


struct Agent: View {
    @State var agentSelect : Agents?
    @State var habilitName : String = ""
    @State var habilitDescription : String = ""
    
    
    var body: some View {
        VStack{
            ScrollView{
                ZStack{
                    AsyncImage(url: URL(string: "https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/bltbded518020183769/5eb26f5389bac8148a8006cc/agent-background-generic.JPG")){ image in
                        image.resizable()
                            .frame(width : 400, height: 300)
                            .padding(.bottom, 130)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    HStack{
                        AsyncImage(url: URL(string: agentSelect!.fullPortrait!)){ image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 350, height: 350)
                        .padding(.leading, 150)
                    }
                    VStack{
                        Text(agentSelect!.displayName!)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size : 40))
                            .padding(.vertical)
                        //                            .padding(.top)
                        Text("//FUNÇAO")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.caption)
                            .bold()
                        HStack{
                            AsyncImage(url: URL(string: agentSelect!.role!.displayIcon!)){ image in
                                image.resizable()
                                
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 20, height: 20)
                            Text(agentSelect!.role!.displayName!)
                                .font(.title2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }
                        .frame(maxWidth: 450, alignment: .leading)
                    }
                    .frame(maxWidth: 450, alignment: .leading)
                    .foregroundColor(.white)
                    .padding([.leading] , 60)
                    .padding(.bottom, 140)
                    .bold()
                    
                }
                
                VStack{
                    Text("//BIOGRAFIA")
                        .padding(.bottom)
                        .frame(maxWidth: 380, alignment: .leading)
                        .bold()
                    Text(agentSelect!.description!)
                        .foregroundColor(Color("grayDiff"))
                        .frame(maxWidth: 380)
                        .padding(.bottom)
                }
                Spacer()
                VStack{
                    Text("HABILIDADES ESPECIAIS")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(maxWidth: 380)
                        .padding(.bottom)
                        .bold()
                    HStack{
                        ForEach(agentSelect!.abilities!, id: \.slot){ p in
                            VStack{
                                if(p.displayIcon != nil){
                                    AsyncImage(url: URL(string: p.displayIcon!)){ image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .onTapGesture {
                                        habilitName = p.displayName!
                                        
                                        habilitDescription = p.description!
                                    }
                                    .frame(width: 50, height: 50)
                                    .padding(.all, 5)
                                    .background(.red)
                                    .border(Color.black, width : 1)
                                }else{
                                    AsyncImage(url: URL(string: "https://besthqwallpapers.com/Uploads/4-4-2022/197367/thumb2-valorant-logo-gray-creative-background-valorant-emblem-gray-paper-texture-valorant.jpg")){ image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }.frame(width: 50, height: 50)
                                        .padding(.all, 5)
                                        .background(.red)
                                        .border(Color.black, width : 4)
                                }
                                Spacer()
                            }
                            .frame(maxWidth: 120, maxHeight: 70)
                            .padding(.bottom)
                        }
                    }
                    .frame(maxWidth: 380)
                }
                VStack{
                    Text(habilitName)
                        .frame(maxWidth: 380, alignment: .leading)
                        .padding(.bottom)
                        .font(.title2)
                        .bold()
                    Text(habilitDescription)
                        .frame(maxWidth: 380)
                        .foregroundColor(Color("grayDiff"))
                        .padding(.bottom)
                }
                Spacer()
                VStack{
                    Link("Baixe o Jogo", destination: URL(string: "https://playvalorant.com/pt-br/agents/")!)
                        .padding()
                    Link("Torneios Independentes", destination: URL(string: "https://assets.contentstack.io/v3/assets/blt0eb2a2986b796d29/blt96bcb1f792b51a6b/6116afd61da1da13cddbee74/VALORANT_Community_Competition_Guidelines_por-BR_v1.2.pdf")!)
                    
                    Link("Baixe o Aplicativo de Celualar Riot Games", destination: URL(string: "https://play.google.com/store/apps/details?id=com.riotgames.mobile.leagueconnect")!)
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .background(Color("grayDiff"))
                .foregroundColor(.white)
            }
            .ignoresSafeArea()
        }
    }
}

struct Agent_Previews: PreviewProvider {
    static var previews: some View {
        Agent(agentSelect:Agents(uuid: nil, displayName: "Gekko", description: "Gekko the Angeleno leads a tight-knit crew of calamitous creatures. His buddies bound forward, scattering enemies out of the way, with Gekko chasing them down to regroup and go again.", developerName: nil, characterTags: nil, displayIcon: "", displayIconSmall: "", bustPortrait: "", fullPortrait: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/fullportrait.png", fullPortraitV2: "", killfeedPortrait: "", background: "", backgroundGradientColors: [nil], assetPath: nil, isFullPortraitRightFacing: true, isPlayableCharacter: true, isAvailableForTest: true, isBaseContent: true, role: Role(uuid: nil, displayName: "Iniciador", description: nil, displayIcon: "https://media.valorant-api.com/agents/roles/1b47567f-8f7b-444b-aae3-b0c634622d10/displayicon.png"), abilities: [Abilities(slot: "habilidade1", displayName: "Wingman", description: "EQUIPE Wingman. DISPARE para enviá-lo para encontrar inimigos. Wingman lança uma forte explosão na direção do primeiro inimigo que vê. Use o DISPARO ALTERNATIVO na direção de um ponto ou Spike plantada para que Wingman plante ou desarme a Spike. Para plantar, Gekko deve estar com a Spike no inventário. Quando Wingman expira, ele se transforma em um glóbulo inativo. INTERAJA para recuperar o glóbulo e ganhar outra carga de Wingman após um curto período.", displayIcon: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/ability1/displayicon.png"), Abilities(slot: "Habilidade2", displayName: "Dizzy", description: "EQUIPE Dizzy. DISPARE para enviá-la voando pelo ar. Dizzy avança e solta explosões de plasma nos inimigos em sua linha de visão. Os inimigos atingidos pelo plasma ficam cegos. Ao expirar, Dizzy se transforma em um glóbulo inativo. INTERAJA para recuperar o glóbulo e ganhar outra carga de Dizzy após um curto período.", displayIcon: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/ability2/displayicon.png")]))
    }
}
