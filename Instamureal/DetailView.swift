//
//  DetailView.swift
//  Instamureal
//
//  Created by Jack Willshire on 12/9/22.
//

import SwiftUI

struct DetailView: View {
    @State var holdingValue: Basketball
    @State var imageName = ""
    var body: some View {
        if holdingValue.theSport == "Soccer"{
            VStack(alignment: .leading){
                Text("User: \(holdingValue.player)")
                HStack {
                    Image("Soccerballball")
                        .resizable()
                        .scaledToFit()
                    .frame(height: 60)
                    Image("\(holdingValue.win == true ? "trophyWin": "Crying")")
                        .resizable()
                        .scaledToFit()
                    .frame(height: 60)
                    VStack{
                        Text("Goal\(holdingValue.firstStat == 1 ? "": "s"): \(holdingValue.firstStat)")
                            .bold()
                            .font(.title2)
                        Text("Assist\(holdingValue.secondStat == 1 ? "": "s"): \(holdingValue.secondStat)")
                            .font(.title2)
                            .bold()
                        Text("Save\(holdingValue.thridStat == 1 ? "": "s"): \(holdingValue.thridStat)")
                            .font(.title2)
                            .bold()
                    }
                    Text("\(holdingValue.dateOfGame)")
                        .font(.callout)
                }
            }
                
        } else if holdingValue.theSport == "PickleBall"{
            VStack(alignment: .leading){
                Text("User: \(holdingValue.player)")
                HStack {
                    Image("Pickleballball")
                        .resizable()
                        .scaledToFit()
                    .frame(height: 60)
                    Image("\(holdingValue.win == true ? "trophyWin": "Crying")")
                        .resizable()
                        .scaledToFit()
                    .frame(height: 60)
                    VStack{
                        Text("Ace\(holdingValue.firstStat == 1 ? "": "s"): \(holdingValue.firstStat)")
                            .bold()
                            .font(.title2)
                        Text("Spike\(holdingValue.secondStat == 1 ? "": "s"): \(holdingValue.secondStat)")
                            .font(.title2)
                            .bold()
                        Text("Volley\(holdingValue.thridStat == 1 ? "": "s"): \(holdingValue.thridStat)")
                            .font(.title2)
                            .bold()
                    }
                    Text("\(holdingValue.dateOfGame)")
                        .font(.callout)
                }
            }
        }else if holdingValue.theSport == "FlagFootball"{
            VStack(alignment: .leading){
                Text("User: \(holdingValue.player)")
                HStack {
                    Image("Footballball")
                        .resizable()
                        .scaledToFit()
                    .frame(height: 60)
                    Image("\(holdingValue.win == true ? "trophyWin": "Crying")")
                        .resizable()
                        .scaledToFit()
                    .frame(height: 60)
                    VStack{
                        Text("Touchdwon\(holdingValue.firstStat == 1 ? "": "s"): \(holdingValue.firstStat)")
                            .bold()
                            .font(.title2)
                        Text("Catch\(holdingValue.secondStat == 1 ? "": "es"): \(holdingValue.secondStat)")
                            .font(.title2)
                            .bold()
                        Text("Taclke\(holdingValue.thridStat == 1 ? "": "s"): \(holdingValue.thridStat)")
                            .font(.title2)
                            .bold()
                    }
                    Text("\(holdingValue.dateOfGame)")
                        .font(.callout)
                }
            }
        }else if holdingValue.theSport == "Softball"{
            VStack(alignment: .leading){
                Text("User: \(holdingValue.player)")
                HStack {
                    Image("Softballball")
                        .resizable()
                        .scaledToFit()
                    .frame(height: 60)
                    Image("\(holdingValue.win == true ? "trophyWin": "Crying")")
                        .resizable()
                        .scaledToFit()
                    .frame(height: 60)
                    VStack{
                        Text("Hit\(holdingValue.firstStat == 1 ? "": "s"): \(holdingValue.firstStat)")
                            .bold()
                            .font(.title2)
                        Text("Homerun\(holdingValue.secondStat == 1 ? "": "s"): \(holdingValue.secondStat)")
                            .font(.title2)
                            .bold()
                        Text("Strike\(holdingValue.thridStat == 1 ? "": "s"): \(holdingValue.thridStat)")
                            .font(.title2)
                            .bold()
                    }
                    Text("\(holdingValue.dateOfGame)")
                        .font(.callout)
                
                }
            }
        }else if holdingValue.theSport == "Basketball"{
            VStack(alignment: .leading){
                Text("User: \(holdingValue.player)")
                HStack {
                    Image("basketballball")
                        .resizable()
                        .scaledToFit()
                    .frame(height: 60)
                    Image("\(holdingValue.win == true ? "trophyWin": "Crying")")
                        .resizable()
                        .scaledToFit()
                    .frame(height: 60)
                    VStack{
                        Text("Point\(holdingValue.firstStat == 1 ? "": "s"): \(holdingValue.firstStat)")
                            .bold()
                            .font(.title2)
                        Text("Assist\(holdingValue.secondStat == 1 ? "": "s"): \(holdingValue.secondStat)")
                            .font(.title2)
                            .bold()
                        Text("Rebound\(holdingValue.thridStat == 1 ? "": "s"): \(holdingValue.thridStat)")
                            .font(.title2)
                            .bold()
                    }
                    Text("\(holdingValue.dateOfGame)")
                        .font(.callout)
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(holdingValue: Basketball())
    }
}
