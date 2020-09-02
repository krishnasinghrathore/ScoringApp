//
//  ApiConstants.swift
//  standaloneScoring
//
//  Created by Apple on 02/09/20.
//  Copyright © 2020 Nick Harder. All rights reserved.
//

import Foundation

protocol EndPoints {
    var baseURL: URL { get }
    var httpMethod: String { get }
    var path : String { get }
//    var headers: HTTPHeader? { get }
    var httpTask : HTTPTask { get }
}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public enum HTTPTask {
    case request
    
//    case requestParameters(param: Parameters?, urlParameters: Parameters?)
}

public enum NetworkError: String, Error {
    case paramNil = "Parameters are nil"
    case encodingFailed = "Parameters encoding failed"
    case urlNil = "URL is nil"
}

public struct APIEndPoint {
    static let baseurl = "http://axe-ventura-api.vidhikaar.com/api"
    static let login = "/V1/Authentication/Login"
}
