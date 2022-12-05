//
//  Sports.swift
//  Instamureal
//
//  Created by Jack Willshire on 12/7/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
//struct Sports: Identifiable, Codable{
//    @DocumentID var id: String?
//    var bball: [Basketball] = []
//    var sccer: [Soccer] = []
//    var futty: [FlagFootball] = []
//    var pkleBall: [PickleBall] = []
//    var sftBall: [Softball] = []
//    var totalGamesPlayed = 0
//
//    var dictionary: [String: Any]{
//        return["bball": bball,"sccer": sccer, "futty": futty,"pkleBall": pkleBall,"sftBall": sftBall, "totalGamesPlayed": totalGamesPlayed]
//    }
//}
struct Basketball: Codable, Identifiable{
    @DocumentID var id: String?
    var firstStat = 0
    var secondStat = 0
    var thridStat = 0
    var pictureUploaded = ""
    var win = true
    var theSport = ""
    var dateOfGame = Date()
    var player = ""
    var dictionary: [String: Any]{
        return["firstStat": firstStat,"secondStat": secondStat, "thridStat": thridStat,"pictureUploaded": pictureUploaded,"win": win,"theSport": theSport, "dateOfGame": Timestamp(date: Date()), "player": Auth.auth().currentUser?.email ?? ""]
       }
}
//struct Soccer: Codable, Identifiable{
//    var id: String?
//    var goals: [Int] = []
//    var saves: [Int] = []
//    var thridStat: [Int] = []
//    var pictureUploaded: [String] = []
//    var win: [Bool] = []
//    var dictionary: [String: Any]{
//           return["goals": goals,"saves": saves, "thridStat": thridStat,"pictureUploaded": pictureUploaded,"win": win]
//       }
//}
//struct FlagFootball: Codable, Identifiable{
//    var id: String?
//    var catches: [Int] = []
//    var touchdowns: [Int] = []
//    var tackles: [Int] = []
//    var pictureUploaded: [String] = []
//    var win: [Bool] = []
//    var dictionary: [String: Any]{
//           return["catches": catches,"touchdowns": touchdowns, "tackles": tackles,"pictureUploaded": pictureUploaded,"win": win]
//       }
//}
//
//struct PickleBall: Codable, Identifiable{
//    var id: String?
//    var aces: [Int] = []
//    var spikes: [Int] = []
//    var volleys: [Int] = []
//    var pictureUploaded: [String] = []
//    var win: [Bool] = []
//    var dictionary: [String: Any]{
//           return["aces": aces,"spikes": spikes, "volleys": volleys,"pictureUploaded": pictureUploaded,"win": win]
//       }
//}
//
//struct Softball: Codable, Identifiable{
//    var id: String?
//    var hits: [Int] = []
//    var homeruns: [Int] = []
//    var pitches: [Int] = []
//    var pictureUploaded: [String] = []
//    var win: [Bool] = []
//    var dictionary: [String: Any]{
//           return["hits": hits,"homeruns": homeruns, "pitches": pitches,"pictureUploaded": pictureUploaded,"win": win]
//       }
//}

