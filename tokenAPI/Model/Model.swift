//
//  Model.swift
//  tokenAPI
//
//  Created by Антон Ларченко on 21.05.2020.
//  Copyright © 2020 Anton Larchenko. All rights reserved.
//

import Foundation
import UIKit

class NewSessionModel: Decodable {
    var status: Int

    var session: String

    enum CodingKeys: String, CodingKey {
        case status
        case data
    }
    enum DataCodingKeys: String, CodingKey {
        case session = "session"
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.status = try container.decode(Int.self, forKey: .status)

        // Nested data
        let dataContainer = try container.nestedContainer(keyedBy: DataCodingKeys.self, forKey: .data)
        self.session = try dataContainer.decode(String.self, forKey: .session)
    }
}

struct GetEntriesModel: Codable {
    let status: String
    let data: [[Entry]]

    enum CodingKeys: String, CodingKey {
        case status
        case data
    }
}

struct Entry: Codable {
    var id: String
    var body: String
    var da: Date
    var dm: Date
}

class AddEntryModel: Decodable {
    var status: Int

    var id: String

    enum CodingKeys: String, CodingKey {
        case status
        case data
    }
    enum DataCodingKeys: String, CodingKey {
        case id = "id"
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.status = try container.decode(Int.self, forKey: .status)

        // Nested data
        let dataContainer = try container.nestedContainer(keyedBy: DataCodingKeys.self, forKey: .data)
        self.id = try dataContainer.decode(String.self, forKey: .id)
    }
}


/// По заданию изменение и удаление реализовывать не надо

//class EditEntryModel: Decodable {
//    var status: Int
//
//    var result: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case status
//        case data
//    }
//    enum DataCodingKeys: String, CodingKey {
//        case result = "result"
//    }
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        self.status = try container.decode(Int.self, forKey: .status)
//
//        // Nested data
//        let dataContainer = try container.nestedContainer(keyedBy: DataCodingKeys.self, forKey: .data)
//        self.result = try dataContainer.decode(Bool.self, forKey: .result)
//    }
//}
//
//class RemoveEntryModel: Decodable {
//    var status: Int
//
//    var result: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case status
//        case data
//    }
//    enum DataCodingKeys: String, CodingKey {
//        case result = "result"
//    }
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        self.status = try container.decode(Int.self, forKey: .status)
//
//        // Nested data
//        let dataContainer = try container.nestedContainer(keyedBy: DataCodingKeys.self, forKey: .data)
//        self.result = try dataContainer.decode(Bool.self, forKey: .result)
//    }
//}
