//
//  AlamofireService.swift
//  ListAuthorsProject
//
//  Created by Hajji Anwer on 2/5/20.
//  Copyright © 2020 Hajji Anwer. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper


class AlamofireService {
    
    func listOfAuthors(completion : @escaping ([Author]) ->()) {
        let url = "http://fakerestapi.azurewebsites.net/api/Authors"
        Alamofire.request(url).responseArray { (response: DataResponse<[Author]>) in
        if let authors = response.result.value{
            print(response.response)
            completion(authors)
            }
            }
        }
    }
