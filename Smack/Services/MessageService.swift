//
//  MessageService.swift
//  Smack
//
//  Created by Wirunpong Jaingamlertwong on 14/1/2561 BE.
//  Copyright © 2561 Wirunpong Jaingamlertwong. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    static let instance = MessageService()
    var channels = [Channel]()
    
    func findAllChannel(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON {
            (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                var json: JSON
                do { try json = JSON(data: data) } catch { return }
                
                if let jsonArray = json.array {
                    for item in jsonArray {
                        let name = item["name"].stringValue
                        let channelDescription = item["description"].stringValue
                        let id = item["_id"].stringValue
                        let channel = Channel(channelTitle: name, channelDescription: channelDescription, id: id)

                        self.channels.append(channel)
                    }
                }
                completion(true)
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
}
