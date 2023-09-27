//
//  ContentView.swift
//  APILoL
//
//  Created by Student13 on 12/09/23.
//

import SwiftUI

struct SideMenuView: View {
    
    var body: some View{
            VStack{
                Text("Valorant")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                Divider()
                    .frame(width: 200 ,height: 2)
                    .background(Color.white)
                    .padding(.horizontal, 16)
                    .blur(radius: 0.5)
                NavigationLink(destination: MenuAgents()){
                    Text("Agents")
                    
                }
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(32)
            .background(.red)
            .edgesIgnoringSafeArea(.bottom)
        }
    }

struct ContentView: View {
    
    @State private var ShowMenu: Bool = false
    @StateObject var viewModel = ViewModel()
    
    var body: some View{
        NavigationStack {
            ZStack{
                Color.white.ignoresSafeArea(.all ,edges: .all)
            ScrollView{
                    VStack{
                        Image("Home")
                            .resizable()
                            .frame(width: 350, height: 200)
                            .padding(.bottom)
                        Divider()
                            .frame(width: 300, height: 2)
                            .overlay(.black)
                        Text("SOBRE O VALORANT")
                            .bold()
                            Text("Valorant é um jogo de tiro em primeira pessoa online desenvolvido pela Riot Games. O jogo coloca duas equipes de cinco jogadores em um mapa com o objetivo de plantar ou desarmar uma bomba ou proteger/reforçar um local específico.")
                                .padding()
                                .frame(width: 400)
                                .font(.callout)
                                .foregroundColor(Color("grayDiff"))
                        VStack{
                            Text("AGENTES")
                                .bold()
                            Divider()
                                .frame(width: 90, height: 2)
                                .overlay(.black)
                        }
                        .frame(width: 380, alignment: .leading)
                        HStack{
                                Text("Mais do que armas e munição, VALORANT inclui agentes com habilidades adaptativas, rápidas e letais, que criam oportunidades para você exibir sua mecânica de tiro.")
                                    .frame(width: 190, height: 175)
                                    .foregroundColor(Color("grayDiff"))
                            VStack{
                                AsyncImage(url: URL(string: "https://media.wired.com/photos/5ea0840cb0490300086261e3/master/w_2240,c_limit/Cul-Reveal_ReactorA_VALORANT.jpg")){ image in
                                    image.resizable()
                                        .frame(width : 180, height: 150)
                                } placeholder: {
                                    ProgressView()
                                }
                                NavigationLink(destination: MenuAgents(), label: {
                                    Text("Vá para agentes -->")
                                    .bold()
                                    .foregroundColor(.red)
                                })
                            }
                        }
                        
                    }
                }
                    GeometryReader { _ in
                        HStack{
                            Spacer()
                            SideMenuView()
                                .offset(x: ShowMenu ? 0 : UIScreen.main.bounds.width)
                                .animation(.easeInOut(duration: 0.25), value: ShowMenu)
                        }
                    }
                    .background(Color.black.opacity(ShowMenu ? 0.5 : 0))
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button{
                        self.ShowMenu.toggle()
                        print("Show menu")
                    } label: {
                        if ShowMenu {
                            Image(systemName: "xmark")
                                .font(.title)
                                .foregroundColor(.white)
                        } else {
                            Image(systemName: "line.horizontal.3")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
