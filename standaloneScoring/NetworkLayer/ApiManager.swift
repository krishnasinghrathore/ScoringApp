//
//  ApiManager.swift
//  standaloneScoring
//
//  Created by Apple on 25/08/20.
//  Copyright © 2020 Nick Harder. All rights reserved.
//

import UIKit
import Alamofire

class ApiManager: NSObject {
    
    static let shared = ApiManager()

    func post(url: String, param: [String:Any], completion: @escaping([String:Any], Bool, String) -> Void) {
        AF.request(URL.init(string: url) ?? "", method: .post, parameters: param, encoding: JSONEncoding.default, headers: nil).responseJSON{ response in
            
            switch response.result {
                 case .success:
                  print(response)
                  var JSONObject = [String: Any]()
                     do {
                        JSONObject = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String:AnyObject]
                        
                        debugPrint(JSONObject)
                                                                        
                        if (self.success(data: JSONObject)) {
                            completion(JSONObject["data"] as! [String : Any], true, JSONObject["message"] as! String)
                        }
                     } catch {
                         print("Unexpected error: \(error).")
                        completion([String:Any](), false, "Something went wrong")
                     }
                  break

                  case .failure(let error):
                    completion([String:Any](), false, "Something went wrong")
            }
        }
    }
    
    func get(url: String, param: [String:Any], completion: @escaping([String:Any]) -> Void) {
        AF.request(url).response { (response) in
            var JSONObject = [String: Any]()
            do {
                JSONObject = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! [String:AnyObject]
            } catch {
                
            }
            completion(JSONObject)
        }
    }
    
    func success(data: [String: Any]) -> Bool {
        if ((data["status"]) as! Int == 200 && data["success"] as! Bool == true) {
            return true
        } else {
            return false
        }
    }        
}
