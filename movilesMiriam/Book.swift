//
//  Book.swift
//  movilesMiriam
//
//  Created by Arnold Norabuena on 6/10/23.
//

import Foundation

struct BookResponse: Decodable {
    let total, page: String
    let books: [Book]
    
}
struct Book:Decodable {
    let title, subtitle, isbn13, price:String
    let image : String
    let url : String
}
