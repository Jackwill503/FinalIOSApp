//
//  PersonalPage.swift
//  Instamureal
//
//  Created by Jack Willshire on 12/9/22.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct PersonalPage: View {
    @EnvironmentObject var sportVM: SportViewModel
    @Environment(\.dismiss) private var dismiss
    @FirestoreQuery(collectionPath: "sportsNOPIC") var eventismos: [Basketball]
    @State var arrayHopeful: [Basketball] = []
    @State var averageValue = 0.0
    @State var gamesWon = 0.0
    @State var highestScore = 0
    @State var buttonDisabled = false
    enum SportsName: String, CaseIterable{
        case Basketball, Soccer, FlagFootball, PickleBall, Softball
    }
    @State private var sportSelected: SportsName = .Basketball
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your Winning Pecentage is: \(String(format: "%.2f", 100 * averageValue))%")
                .font(.title)
                .foregroundColor(.purple)
                .multilineTextAlignment(.center)
                .bold()
            HStack {
                Text("Select A Sport: ")
                    .foregroundColor(.purple)
                Picker("Blind", selection: $sportSelected) {
                    ForEach(SportsName.allCases, id: \.self) { sporty in
                        Text(sporty.rawValue)
                    }
                }
                .disabled(buttonDisabled)
            }
            Text("Your best \(sportSelected.rawValue) preformance was")
                .font(.title2)
                .multilineTextAlignment(.center)
                .foregroundColor(.purple)
            if sportSelected.rawValue == "PickleBall"{
                VStack(alignment: .leading){
                    Text("\(highestScore) Aces")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.purple)
                }
            }
            if sportSelected.rawValue == "Soccer"{
                VStack(alignment: .leading){
                    Text("\(highestScore) Goals")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.purple)
                }
            }
            if sportSelected.rawValue == "FlagFootball"{
                VStack(alignment: .leading){
                    Text("\(highestScore) Touchdowns")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.purple)
                }
            }
            if sportSelected.rawValue == "Basketball"{
                VStack(alignment: .leading){
                    Text("\(highestScore) Points")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.purple)
                }
            }
            if sportSelected.rawValue == "Softball"{
                VStack(alignment: .leading){
                    Text("\(highestScore) Hits")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.purple)
                }
            }
            
        }
        List(eventismos) { help in
            PersonalDetailView(holdingValue: help)
        }
        .listStyle(.plain)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Back"){
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Find Your Stats"){
                    buttonDisabled.toggle()
                    for event in eventismos{
                        if event.player == Auth.auth().currentUser?.email{
                            arrayHopeful.append(event)
                        }
                    }
                    for eventismo in arrayHopeful {
                        if eventismo.win == true{
                            gamesWon = gamesWon + 1.0
                        }
                    }
                    averageValue = gamesWon/Double(arrayHopeful.count)
                    highestScore = sportVM.highestStat(arrayNeeded: arrayHopeful, sportWanted: sportSelected.rawValue)
                    
                    
                }
                .disabled(buttonDisabled)
            }
        }
        
        Text("")
            
    }
        
}

struct PersonalPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            PersonalPage()
                .environmentObject(SportViewModel())
        }
    }
}
