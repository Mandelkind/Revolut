//
//  Namespace.swift
//  Revolut
//
//  Created by Marco Betschart on 02.03.18.
//  Copyright © 2018 MANDELKIND. All rights reserved.
//

import Foundation

public class Revolut{
	
	public static func api(_ apiKey: String) {
		Revolut.api = Revolut(apiKey: apiKey)
	}
	public static func api(_ configuration: Configuration) {
		Revolut.api = Revolut(configuration: configuration)
	}
	public static var api: Revolut!
	
	public let configuration: Configuration
	private let urlSessionConfiguration: URLSessionConfiguration
	
	public convenience init(apiKey: String){
		self.init(configuration: Configuration(apiKey: apiKey))
	}
	
	public init(configuration: Configuration){
		self.configuration = configuration
		self.urlSessionConfiguration = URLSessionConfiguration.default
		self.urlSessionConfiguration.httpAdditionalHeaders = ["Authorization": "Bearer " + configuration.apiKey]
	}
	
	public func accounts(completionHandler: @escaping (([Account]?, Swift.Error?) -> Void)) {
		let urlSession = URLSession(configuration: urlSessionConfiguration)
		let dataTask = urlSession.dataTask(with: configuration.apiEndpoint.appendingPathComponent("accounts")) { data, response, error in
			if let error = error {
				completionHandler(nil,error)
				return
			}
			guard let response = response as? HTTPURLResponse else {
				completionHandler([],nil)
				return
			}
			guard response.statusCode == 200 else {
				completionHandler(nil,Error.from(errorCode: response.statusCode))
				return
			}
			guard let data = data else {
				completionHandler([],nil)
				return
			}
			
			do {
				completionHandler(try Revolut.jsonDecoder.decode([Account].self, from: data), nil)
			} catch {
				completionHandler(nil, error)
			}
		}
		dataTask.resume()
	}
}
