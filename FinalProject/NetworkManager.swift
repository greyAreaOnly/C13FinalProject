//
//  NetworkManager.swift
//  FinalProject
//
//  Created by Brett Walton on 1/18/21.
//

import Foundation
import SwiftyJSON

final class NetworkManager {
    
    enum NetworkError : Error {
        case invalidURLString
        case badData
    }
    
   // let header = ["X-Auth-Token" : "80980820efe24ed2a3b7c15237187477"]
    //let json = JSON(data: dataFromNetworking)
    
    static let shared = NetworkManager()
    private init(){}
    var delegate = NetworkManagerDelegate.self
    
//    func getData() {
//        let session = URLSession.shared
//        let url = URL(string: "http://api.football-data.org/v2/competitions/PL")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.setValue("80980820efe24ed2a3b7c15237187477", forHTTPHeaderField: "X-Auth-Token")
//        print("GetData started")
//        let task = session.dataTask(with: url) { data, response, error in
//            if error != nil || data != nil {
//                print("\(error?.localizedDescription ?? "Error")")
//            }
//            do {
//                let uploadTask = session.uploadTask(with: request, from: data!) { data, response, error in
//                    var json = try? JSON(data: data!)
//                    print(json)
//                }.resume()
//            } catch {
//                print("Json error")
//            }
//
        
        
//        print("Get Data started")
//        let url = URL(string: "http://api.football-data.org/v2/competitions/PL")!
//        var request = URLRequest(url: url)
//        request.addValue("80980820efe24ed2a3b7c15237187477" , forHTTPHeaderField: "X-Auth-Token")
//        URLSession.shared.dataTask(with: request) {
//            (data, response, error) in
//            guard let data = data else {
//                return
//            }
//            //do {
//                var json = try? JSON(data: data)
//               // return json
//            print(json as Any)
//            //} catch {
               // print(error.localizedDescription)
           // }
//        }.resume()
//    }
    
//    func getDecodedObject<T: Decodable>(from urlString: String, completion: @escaping (T?,Error?) -> Void) {
//        guard let url = URL(string: urlString) else {
//            completion(nil, NetworkError.invalidURLString)
//            return
//        }
//        URLSession.shared.dataTask(with: url) {
//            (data, response, error) in
//            guard let data = data else {
//                completion(nil, error)
//                return
//            }
//            do {
//                let
//            }
//        }
}

protocol NetworkManagerDelegate {
    func getData()
}
