//
//  SportViewModel.swift
//  Instamureal
//
//  Created by Jack Willshire on 12/8/22.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage
import UIKit
import SwiftUI
@MainActor
class SportViewModel: ObservableObject{
    @Published var sport = Basketball()
    @Published var returningPoint = 0
    @Published var highestPoints = 0
    func saveSports(bball: Basketball) async -> Bool{
        let db = Firestore.firestore()
        if let id = bball.id {
            do{
                try await db.collection("sportsNOPIC").document(id).setData(bball.dictionary)
                print("it worked mofo")
                return true
            }catch{
                print("it didnt")
                return false
            }
        }else{
            do{
                try await db.collection("sportsNOPIC").addDocument(data: bball.dictionary)
                return true
            } catch{
                print("stinky")
                return false
            }
        }
    }
    func highestStat(arrayNeeded: [Basketball], sportWanted: String) -> Int{
        for arrayNeed in arrayNeeded {
            
            if arrayNeed.theSport == sportWanted{
               if arrayNeed.firstStat >= highestPoints{
                    returningPoint = arrayNeed.firstStat
                }
            }
            
        }

        return returningPoint
    }
    func averageScore(arrayNeeded: [Basketball], sportWanted: String) -> Double{
        var bingBong = 0
        var count = 0
        for arrayNeed in arrayNeeded {
            
            if arrayNeed.theSport == sportWanted{
                bingBong += arrayNeed.firstStat
                count += 1
            }
        }
        if count == 0 {
            return -1.0
        } else{
            return Double(bingBong)/Double(count)
        }
    }
    func totalGamesofSport(arrayNeeded: [Basketball], sportWanted: String) -> Int{
        var tots = 0
        for arrayNeed in arrayNeeded {
            
            if arrayNeed.theSport == sportWanted{
                tots += 1
            }
        }
        return tots
    }
    
}
