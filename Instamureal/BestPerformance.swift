//
//  BestPerformance.swift
//  Instamureal
//
//  Created by Jack Willshire on 12/9/22.
//

import SwiftUI

struct BestPerformance: View {
    @State var sportName: String
    @State var highestScore: Int
    var body: some View {
        if sportName == "PickleBall"{
            VStack(alignment: .leading){
                Text("\(highestScore) Aces")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.brown)
            }
        }
        if sportName == "Soccer"{
            VStack(alignment: .leading){
                Text("\(highestScore) Goals")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.brown)
            }
        }
        if sportName == "FlagFootball"{
            VStack(alignment: .leading){
                Text("\(highestScore) Touchdowns")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.brown)
            }
        }
        if sportName == "Basketball"{
            VStack(alignment: .leading){
                Text("\(highestScore) Points")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.brown)
            }
        }
        if sportName == "Softball"{
            VStack(alignment: .leading){
                Text("\(highestScore) Hits")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.brown)
            }
        }



        

    }
}

struct BestPerformance_Previews: PreviewProvider {
    static var previews: some View {
        BestPerformance(sportName: "PickleBall", highestScore: 9)
    }
}
