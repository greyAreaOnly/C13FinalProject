//
//  ViewController.swift
//  FinalProject
//
//  Created by Field Employee on 1/18/21.
//

import UIKit
import Firebase
import SwiftyJSON

class LeagueViewController: UIViewController {
    
    @IBOutlet weak var tableTitle: UILabel!
    @IBOutlet weak var leagueTableView: UITableView!
    // var matches = [Match]()
    var leagues = ["Premier League", "La Liga", "Serie A", "Bundesliga", "Ligue 1", "Eredivisie"]
    var todaysDate = Date()
    //let formatter = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableTitle.text = "Leagues"
        leagueTableView.dataSource = self
        leagueTableView.delegate = self
        leagueTableView.register(UINib(nibName: "leagueTableViewCell", bundle: nil), forCellReuseIdentifier: "leagueCell")
    }
    
    func viewWillAppear() {
    }
}

extension LeagueViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = leagueTableView.dequeueReusableCell(withIdentifier: "leagueCell", for: indexPath) as! leagueTableViewCell
        let league = self.leagues[indexPath.row]
        cell.leagueName.text = "\(league)"
        cell.leagueImage.image = UIImage(named: "\(indexPath.row)")
        return cell
    }
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 6
  }
  
}

extension LeagueViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let todaysFormattedDate = todaysDate.getFormattedDate(format: "yyyy-MM-dd")
    let status = "FINISHED"
    switch indexPath.row {
    case 0:
        let fixtureVC = storyboard.instantiateViewController(identifier: "FixtureViewController") as! FixtureViewController
        fixtureVC.urlFromTable = "https://api.football-data.org/v2/competitions/PL/matches?status=\(status)&dateFrom=2021-01-10&dateTo=\(todaysFormattedDate)"
        fixtureVC.league = "PL"
        self.navigationController?.pushViewController(fixtureVC, animated: true)
    
    case 1:
        let fixtureVC = storyboard.instantiateViewController(identifier: "FixtureViewController") as! FixtureViewController
        fixtureVC.urlFromTable = "https://api.football-data.org/v2/competitions/PD/matches?status=\(status)&dateFrom=2021-01-10&dateTo=\(todaysFormattedDate)"
        fixtureVC.league = "PD"
        self.navigationController?.pushViewController(fixtureVC, animated: true)
    case 2:
        let fixtureVC = storyboard.instantiateViewController(identifier: "FixtureViewController") as! FixtureViewController
        fixtureVC.urlFromTable = "https://api.football-data.org/v2/competitions/SA/matches?status=\(status)&dateFrom=2021-01-10&dateTo=\(todaysFormattedDate)"
        fixtureVC.league = "SA"
        self.navigationController?.pushViewController(fixtureVC, animated: true)
    case 3:
        let fixtureVC = storyboard.instantiateViewController(identifier: "FixtureViewController") as! FixtureViewController
        fixtureVC.urlFromTable = "https://api.football-data.org/v2/competitions/BL1/matches?status=\(status)&dateFrom=2021-01-10&dateTo=\(todaysFormattedDate)"
        fixtureVC.league = "BL1"
        self.navigationController?.pushViewController(fixtureVC, animated: true)
    case 4:
        let fixtureVC = storyboard.instantiateViewController(identifier: "FixtureViewController") as! FixtureViewController
        fixtureVC.urlFromTable = "https://api.football-data.org/v2/competitions/FL1/matches?status=\(status)&dateFrom=2021-01-10&dateTo=\(todaysFormattedDate)"
        fixtureVC.league = "FL1"
        self.navigationController?.pushViewController(fixtureVC, animated: true)
 
    default:
        let fixtureVC = storyboard.instantiateViewController(identifier: "FixtureViewController") as! FixtureViewController
        fixtureVC.urlFromTable = "https://api.football-data.org/v2/competitions/DED/matches?status=\(status)&dateFrom=2021-01-10&dateTo=\(todaysFormattedDate)"
        fixtureVC.league = "DED"
        self.navigationController?.pushViewController(fixtureVC, animated: true)
    }
  }
}

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

