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
    private let baseURLPath = "https://bnet.i-partner.ru/testAPI/"
    
    func saveToken() {
        UserDefaults.standard.set(token, forKey: kToken)
    }
    
    func loadToken() {
        guard UserDefaults.standard.string(forKey: kToken) != nil else {return}
    }
    
    func newSession(completion: @escaping ([NewSessionModel])->()) {
        
        var components = URLComponents(string: baseURLPath)!
        components.queryItems = [URLQueryItem(name: "a", value: "new_session")]
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        var request = URLRequest(url: components.url!)
        request.httpMethod = "POST"
        request.setValue(token, forHTTPHeaderField: kToken)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let newSessionModel = try JSONDecoder().decode([NewSessionModel].self, from: data)
                completion(newSessionModel)
            } catch let error {
                completion([])
                
//                let alert = UIAlertController(title: "Отсутствует соединение с сервером", message: "Попробуйте снова", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "Обновить данные", style: .default, handler: { [weak self] action in
//                    <#code#>
//                }))
                
                print(error)
            }
            
        }.resume()
    }
    
    func getEntries(session: String, completion: @escaping ([GetEntriesModel])->()) {
        
        var components = URLComponents(string: baseURLPath)!
        components.queryItems = [URLQueryItem(name: "a", value: "get_entries")]
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        var request = URLRequest(url: components.url!)
        request.httpMethod = "POST"
        request.setValue(token, forHTTPHeaderField: kToken)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let getEntriesModel = try JSONDecoder().decode([GetEntriesModel].self, from: data)
                completion(getEntriesModel)
            } catch let error {
                completion([])
                
//                let alert = UIAlertController(title: "Отсутствует соединение с сервером", message: "Попробуйте снова", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "Обновить данные", style: .default, handler: { action in
//                    <#code#>
//                }))
                
                print(error)
            }
            
        }.resume()
    }
    
    func addEntry(session: String, body: String, completion: @escaping ([AddEntryModel])->()) {
        
        var components = URLComponents(string: baseURLPath)!
        components.queryItems = [URLQueryItem(name: "a", value: "add_entry")]
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        var request = URLRequest(url: components.url!)
        request.httpMethod = "POST"
        request.setValue(token, forHTTPHeaderField: kToken)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let addEntryModel = try JSONDecoder().decode([AddEntryModel].self, from: data)
                completion(addEntryModel)
            } catch let error {
                completion([])
                
//                let alert = UIAlertController(title: "Отсутствует соединение с сервером", message: "Попробуйте снова", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "Обновить данные", style: .default, handler: { action in
//                    <#code#>
//                }))
                                
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
