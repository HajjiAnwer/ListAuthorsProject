//
//  Author.swift
//  ListAuthorsProject
//
//  Created by Hajji Anwer on 2/5/20.
//  Copyright © 2020 Hajji Anwer. All rights reserved.
//

import Foundation
import ObjectMapper
class Author : Mappable {
    var id : Int = 0
    var idBook : Int = 0
    var firstName : String = ""
    var lastName : String = ""
    required init?(map: Map) {
    }
    init(id : Int?, idBook: Int?,firstName: String?, lastName: String?) {
        self.id = id!
        self.idBook = idBook!
        self.firstName = firstName!
        self.lastName = lastName!
    }
    func mapping(map: Map) {
        id <- map["ID"]
        idBook <- map["IDBook"]
        firstName <- map["FirstName"]
        lastName <- map["LastName"]
    }
}
