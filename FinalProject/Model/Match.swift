//
//  Match.swift
//  FinalProject
//
//  Created by Field Employee on 1/20/21.
//

import Foundation
import SwiftyJSON


struct Match {
    let awayScore: Int
    let homeScore: Int
    let awayTeam: String
    let homeTeam: String
    let winner: String
    let status: String
    
    init(awayScore: Int, homeScore: Int, awayTeam: String, homeTeam: String, winner: String, status: String) {
        self.awayScore = awayScore
        self.homeScore = homeScore
        self.awayTeam = awayTeam
        self.homeTeam = homeTeam
        self.winner = winner
        self.status = status
    }
}

//func build(json: JSON) -> Match? {
//    if let
//        awayScore = json.1["home"]
//    return match
//}


