//
//  ViewController.swift
//  FinalProject
//
//  Created by Field Employee on 1/18/21.
//

import UIKit
import Firebase
import SwiftyJSON

class ViewController: UIViewController {
    
    func getData() {
        let token = "80980820efe24ed2a3b7c15237187477"
        //let url = URL(string: "https://api.football-data.org/v2/competitions/PL/matches?status=SCHEDULED")!
        let url = URL(string: "https://api.football-data.org/v2/competitions/PL/matches?status=FINISHED&dateFrom=2021-01-01&dateTo=2021-01-19")!
//        let url = URL(string: "https://api.football-data.org/v2/competitions/CL/teams")!
        var request = URLRequest(url: url)
        request.addValue(token, forHTTPHeaderField: "X-Auth-Token")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let json = try? JSON(data: data!)
            if let matchday = json?["matches"] {
                for match in matchday {
                    let teamName = match.1["name"]
                    let crestURL = match.1["crestUrl"]
                    print("\(teamName)")
                    print("\(crestURL)")
                    }
                print(matchday)
                }
                
        }
        task.resume()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
        // test file location
    }
    
    func viewWillAppear() {
    
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

