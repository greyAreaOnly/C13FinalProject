//
//  FixtureViewController.swift
//  FinalProject
//
//  Created by Field Employee on 1/21/21.
//

import Foundation
import UIKit
import SwiftyJSON

class FixtureViewController : UIViewController {
   
    @IBOutlet weak var fixtureTableView: UITableView!
    
    @IBOutlet weak var leagueName: UILabel!
    //MARK: - Variables
    
    var matches = [Match]() //{
//        didSet{
//            fixtureTableView?.reloadData()
//        }
//    }
    var urlFromTable = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fixtureTableView.dataSource = self
        fixtureTableView.register(UINib(nibName: "fixtureTableViewCell", bundle: nil), forCellReuseIdentifier: "fixtureCell")
        
        getData()

    }
    
    func getData() {
        let token = "80980820efe24ed2a3b7c15237187477"
        //let url = URL(string: "https://api.football-data.org/v2/competitions/PL/matches?status=SCHEDULED")!
//        let url = URL(string: "https://api.football-data.org/v2/competitions/PD/matches?status=SCHEDULED&dateFrom=2021-01-10&dateTo=2021-01-25")!
        let url = URL(string: urlFromTable)!
//        let url = URL(string: "https://api.football-data.org/v2/competitions/CL/teams")!
//        var request = URLRequest(url: url)
        var request = URLRequest(url: url)
        request.addValue(token, forHTTPHeaderField: "X-Auth-Token")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let json = try? JSON(data: data!)
            if let matchday = json?["matches"] {
                for match in matchday {
                    let awayTeam = match.1["awayTeam"]["name"].stringValue
                    let homeTeam = match.1["homeTeam"]["name"].stringValue
                    let awayScore = match.1["score"]["fullTime"]["awayTeam"].intValue
                    let homeScore = match.1["score"]["fullTime"]["homeTeam"].intValue
                    let winner = match.1["score"]["winner"].stringValue
                    let status = match.1["status"].stringValue
                    let crestURL = match.1["crestUrl"]
                    let matchResult = Match(awayScore: awayScore, homeScore: homeScore, awayTeam: awayTeam, homeTeam: homeTeam, winner: winner, status: status)
                    DispatchQueue.main.async {
                        self.matches.append(matchResult)
                        self.fixtureTableView.insertRows(at: [IndexPath(row: self.matches.count-1, section: 0)], with: .fade)
                    }
//                    print("Match Array: \(self.matches)")
//                    print("\(matchResult.awayTeam)")
//                    print("\(awayScore)")
//                    print("\(homeTeam)")
//                    print("\(homeScore)")
//                    print("\(winner)")
//                    print("\(status)")
                    print(matchResult)
//                    print("\(crestURL)")
                    }
//                print(matchday)
                }
        }
        task.resume()
    }
}

extension JSON {
    public var date: Date? {
        get {
            if let str = self.string {
                return JSON.jsonDateFormatter.date(from: str)
            }
            return nil
        }
    }

    private static let jsonDateFormatter: DateFormatter = {
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        fmt.timeZone = TimeZone(secondsFromGMT: 0)
        return fmt
    }()
}

extension FixtureViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(self.matches)
        print("******fixture count : \(matches.count)")

        return self.matches.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = fixtureTableView.dequeueReusableCell(withIdentifier: "fixtureCell", for: indexPath) as! fixtureTableViewCell
        cell.configure(with: self.matches[indexPath.row])
        return cell
        }
    }
