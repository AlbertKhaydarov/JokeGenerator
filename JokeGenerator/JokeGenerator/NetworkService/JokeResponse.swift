//
//  JokeResponse.swift
//  JokeGenerator
//
//  Created by Admin on 14.08.2023.
//

import Foundation

struct JokeResponseWrapped: Decodable {
    let response: JokeResponse
}

struct JokeResponse: Decodable {
    var type: String
    var setup: String
    var punchline: String
    var id: Int
}

struct API {
    static let scheme = "https"
    static let host = "official-joke-api.appspot.com"
    static let path = "/random_joke"

}
