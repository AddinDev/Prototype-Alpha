//
//  PostData.swift
//  Prototype Alpha
//
//  Created by pasto on 11/06/20.
//  Copyright © 2020 pstw._. All rights reserved.
//

import Foundation

struct Result: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id:String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
    
}
