//
//  ContentView.swift
//  APILoL
//
//  Created by Student13 on 12/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    @State var agentSelect : Agents =  Agents(uuid: nil, displayName: "Selecione", description: nil, developerName: nil, characterTags: nil, displayIcon: "", displayIconSmall: "", bustPortrait: "", fullPortrait: "", fullPortraitV2: "", killfeedPortrait: "", background: "", backgroundGradientColors: [nil], assetPath: nil, isFullPortraitRightFacing: true, isPlayableCharacter: true, isAvailableForTest: true, isBaseContent: true, role: nil, abilities: nil)
    
    @State var agentSelected : String?
    @State var isLinkActive = false
    
    var body: some View {
        NavigationView{
            VStack {
                
                ZStack{
                    AsyncImage(url: URL(string: "https://analisadaily.com/imagesfile/202211/20221129-192005_valorant-akan-segera-hadir-di-android.jpeg")){ image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 400, height: 350)
                    Text("AGENTES")
                        .bold()
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 200.00)
                        .padding(.leading)
                        .foregroundColor(.white)
                    
                }
                VStack{
                    Spacer()
                    Text("// CONHEÇA A EQUIPE")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 10)
                        .padding(.leading, 25)
                        .bold()
                    Text("Encontre mais formas de plantar a Spike e enfrentar seus inimigos com lutadores, estrategistas e caçadores de todos os tipos")
                        .foregroundColor(.gray)
                    Spacer()
//                        .navigationBarTitleDisplayMode(.inline)
////                        .toolbar {
////                          ToolbarItem {
//                              Menu(agentSelect.displayName!) {
//                                ForEach(viewModel.chars, id : \.uuid) { agents in
//                                  Button(agents.displayName!) {
//                                  agentSelect = agents
////                                      NavigationLink(destination: Agent(agentSelect: agentSelect), isActive: $isLinkActive) {
////                                          EmptyView()
////                                      }
////                                          .hidden()
//                                }
//                              }
//                            }
//                          }
//                        }
                    Picker("Please choose a Agent", selection: $agentSelected) {
                        Text("Selecione").tag("")
                        ForEach(viewModel.chars, id: \.uuid){ a in
                            Text(a.displayName!).tag(a)
                        }

                    }
                    if(agentSelected != nil){
                        Button{
                            if let agentSelect = viewModel.chars.first(where:{
                                $0.uuid == agentSelected!})
                            {
                                self.agentSelect = agentSelect
                                print(agentSelect)
                                
                                self.isLinkActive = true
                            }
                        } label: {
                            Text("Acessar")
                        }
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding(.horizontal, 30)
                        .background(.red)
                        .cornerRadius(20)
                    }else{
                        Button{
                            
                        } label: {
                            Text("Acessar")
                        }
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding(.horizontal, 30)
                        .background(.gray)
                        .cornerRadius(20)
                    }
                    Spacer()
                }
                .padding(.leading, 7.0)
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
            .onAppear(){
                viewModel.fetch()
                // .padding()
                
            }
            .background(
                NavigationLink(destination: Agent(agentSelect: agentSelect), isActive: $isLinkActive) {
                    EmptyView()
                }
                    .hidden()
            )
            .ignoresSafeArea(.all)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//                    if(index.role?.displayName != nil){
//                        Text(index.role!.displayName!)
//                    }
