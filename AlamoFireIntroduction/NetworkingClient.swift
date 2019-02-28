//
//  NetworkingClient.swift
//  AlamoFireIntroduction
//
//  Created by Eric Castronovo on 2/24/19.
//  Copyright © 2019 Runner. All rights reserved.
//

import Foundation
import Alamofire

class NetworkingClient{
    typealias WebServiceResponse =  ([[String: Any]]?, Error?) -> Void
    
    func execute(_ url: URL, completion: @escaping WebServiceResponse){
        
        Alamofire.request(url).validate().responseJSON { response in
            if let error = response.error {
                 completion(nil, error)
            }
            else if let jsonArray = response.result.value as? [[String: Any]]{
                 completion(jsonArray, nil)
            }
            else if let jsonDict = response.result.value as? [String: Any]{
                completion([jsonDict], nil)
            }
        }
    }
}
