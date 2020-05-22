//
//  WebManager.swift
//  tokenAPI
//
//  Created by Антон Ларченко on 21.05.2020.
//  Copyright © 2020 Anton Larchenko. All rights reserved.
//

import Foundation
import UIKit

class WebManager {
    
    let kToken = "token"
    let token = "ueYcVXc-OH-AuhZy98"
    
    func saveToken() {
        UserDefaults.standard.set(token, forKey: kToken)
    }
    
    func loadToken() {
        guard UserDefaults.standard.string(forKey: kToken) != nil else {return}
    }
    
    func newSession(completion: @escaping ([NewSessionModel])->()) {
        
        let url = URL(string: "https://bnet.i-partner.ru/testAPI/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(token, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
//            if let res = response as? HTTPURLResponse {
//                let code = res.statusCode
//                print(code)
//            }
            
            guard let data = data else { return }
            
            do {
                let newSessionModel = try JSONDecoder().decode([NewSessionModel].self, from: data)
                completion(newSessionModel)
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
    
    func getEntries(session: String, completion: @escaping ([GetEntriesModel])->()) {
        
        let url = URL(string: "https://bnet.i-partner.ru/testAPI/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(token, forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
//            if let res = response as? HTTPURLResponse {
//                let code = res.statusCode
//                print(code)
//            }
            
            guard let data = data else { return }
            
            do {
                let getEntriesModel = try JSONDecoder().decode([GetEntriesModel].self, from: data)
                completion(getEntriesModel)
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
    
    func addEntry(session: String, body: String, completion: @escaping ([AddEntryModel])->()) {
        
        let url = URL(string: "https://bnet.i-partner.ru/testAPI/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(token, forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
//            if let res = response as? HTTPURLResponse {
//                let code = res.statusCode
//                print(code)
//            }
            
            guard let data = data else { return }
            
            do {
                let addEntryModel = try JSONDecoder().decode([AddEntryModel].self, from: data)
                completion(addEntryModel)
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
    
    
    /// по заданию изменение и удаление реализовывать не надо
    
//    func editEntry(session: String, id: String, body: String, completion: @escaping ([EditEntryModel])->()) {
//    }
    
//    func removeEntry(session: String, id: String, completion: @escaping ([RemoveEntryModel])->()) {
//    }
    
}
