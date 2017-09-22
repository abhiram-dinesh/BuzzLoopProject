//
//  Helper.swift
//  BuzzLoopProject
//
//  Created by Abhiram Dinesh on 9/21/17.
//  Copyright © 2017 Abhiram Dinesh. All rights reserved.
//

import Foundation
import Alamofire

class Helper {
    
    //download JSON from s3 url
    static func getJSON(completion: @escaping((_ json: [Any], _ error: Error?) -> Void)) {
        
        if let url = URL(string: "https://s3.amazonaws.com/BuzzLoop-colors/colors.json") {
            Alamofire.request(url).responseJSON { (response) in
                //valid response
                if let json = response.value as? [Any] {
                    print(json)
                    completion(json,nil)
                }
                //response is empty
                else {
                    completion([], response.error)
                }
            }
        }
    }
    
    //get colors array
    static func getColors(completion: @escaping((_ colors: [Color]) -> Void)) {
        
        getJSON { (json, error) in
            //no error
            if error == nil {
                var colors : [Color] = []
                 for obj in json {
                    if let item = obj as? [String : Any] {
                        if let color = Color(json: item) {
                            colors.append(color)
                        }
                    }
                }
                completion(colors)
            }
            //error found
            else {
                print(error!)
                completion([])
            }
        }
    }
}
