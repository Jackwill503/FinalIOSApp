//
//  TotalsFile.swift
//  Instamureal
//
//  Created by Jack Willshire on 12/9/22.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct TotalsFile: View {
    @EnvironmentObject var sportVM: SportViewModel
    @Environment(\.dismiss) private var dismiss
    @FirestoreQuery(collectionPath: "sportsNOPIC") var eventismos: [Basketball]
    @State var arrayHopeful: [Basketball] = []
    @State var averageValue = 0.0
    @State var gamesWon = 0.0
    @State var highestScore = 0
    @State var averageScore = 0.0
    @State var imageName = "PickupBbal"
    @State var totsGamesofSport = 0
    @State var buttonDisabled = false
    enum SportsName: String, CaseIterable{
        case Basketball, Soccer, FlagFootball, PickleBall, Softball
    }
    @State private var sportSelected: SportsName = .Basketball
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("The communities Winning Percentage is: \(String(format: "%.2f", 100 * averageValue))%")
                .font(.title)
                .foregroundColor(.pink)
                .multilineTextAlignment(.center)
                .bold()
            HStack {
                Text("Select A Sport: ")
                    .foregroundColor(.pink)
                Picker("Blind", selection: $sportSelected) {
                    ForEach(SportsName.allCases, id: \.self) { sporty in
                        Text(sporty.rawValue)
                    }
                }
                .onChange(of: sportSelected) { newValue in
                    if sportSelected.rawValue == "Basketball"{
                        imageName = "PickupBbal"
                    } else if sportSelected.rawValue == "Soccer"{
                        imageName = "atlantaSoccer"
                    } else if sportSelected.rawValue == "FlagFootball"{
                        
                        imageName = "FlagFutty"
                    } else if sportSelected.rawValue == "PickleBall"{
                        
                        imageName = "PickleSmall"
                    } else if sportSelected.rawValue == "Softball"{
                        
                        imageName = "SuftBall"
                    }
                }
                .disabled(buttonDisabled)
            }
            Text("The best \(sportSelected.rawValue) preformance was")
                .font(.title2)
                .multilineTextAlignment(.center)
                .foregroundColor(.pink)
            if sportSelected.rawValue == "PickleBall"{
                VStack(alignment: .leading){
                    Group{
                        Text("\(highestScore) Aces")
                        Text("The average amount was: \(String(format: "%.2f",averageScore))")
                    }
                        .font(.title2)
                        .bold()
                        .foregroundColor(.pink)
                }
            }
            if sportSelected.rawValue == "Soccer"{
                VStack(alignment: .leading){
                    Group{
                        Text("\(highestScore) Goals")
                        Text("The average amount was: \(String(format: "%.2f",averageScore))")
                    }
                        .font(.title2)
                        .bold()
                        .foregroundColor(.pink)
                }
            }
            if sportSelected.rawValue == "FlagFootball"{
                VStack(alignment: .leading){
                    Group{
                        Text("\(highestScore) Touchdowns")
                        Text("The average amount was: \(String(format: "%.2f",averageScore))")
                    }
                        .font(.title2)
                        .bold()
                        .foregroundColor(.pink)
                }
            }
            if sportSelected.rawValue == "Basketball"{
                VStack(alignment: .leading){
                    Group{
                        Text("\(highestScore) Points")
                        Text("The average amount was: \(String(format: "%.2f",averageScore))")
                    }
                        .font(.title2)
                        .bold()
                        .foregroundColor(.pink)
                }
            }
            if sportSelected.rawValue == "Softball"{
                VStack(alignment: .leading){
                    Group{
                        Text("\(highestScore) Hits")
                        Text("The average amount was: \(String(format: "%.2f",averageScore))")
                    }
                        .font(.title2)
                        .bold()
                        .foregroundColor(.pink)
                }
            }
        }
        VStack(alignment: .leading){
            Text("The total amount of games of \(sportSelected.rawValue) is \(totsGamesofSport)")
                .font(.title2)
                .foregroundColor(.pink)
                .multilineTextAlignment(.center)
                .bold()
        }
    Spacer()
    Image(imageName)
        .resizable()
        .scaledToFit()
        .cornerRadius(15)
        .shadow(radius: 5)
        Spacer()
        
        
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Back"){
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Find The Stats"){
                    buttonDisabled.toggle()
                    
                    for eventismo in eventismos {
                        if eventismo.win == true{
                            gamesWon = gamesWon + 1.0
                        }
                    }
                    averageValue = gamesWon/Double(eventismos.count)
                    highestScore = sportVM.highestStat(arrayNeeded: eventismos, sportWanted: sportSelected.rawValue)
                    averageScore = sportVM.averageScore(arrayNeeded: eventismos, sportWanted: sportSelected.rawValue)
                    totsGamesofSport = sportVM.totalGamesofSport(arrayNeeded: eventismos, sportWanted: sportSelected.rawValue)

                    
                    
                }
                .disabled(buttonDisabled)
            }
        }
        
            
    }
        
}

struct TotalsFile_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            TotalsFile()
        }
    }
}
