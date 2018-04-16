//
//  Namespace.swift
//  Revolut
//
//  Created by Marco Betschart on 02.03.18.
//  Copyright © 2018 MANDELKIND. All rights reserved.
//

import Foundation

public class Revolut{
	
	public static func configure(_ apiKey: String) {
		Revolut.shared = Revolut(apiKey: apiKey)
	}
	public static func configure(_ configuration: Configuration) {
		Revolut.shared = Revolut(configuration: configuration)
	}
	public static var shared: Revolut!
	
	public let configuration: Configuration
	internal let urlSessionConfiguration: URLSessionConfiguration
	
	public convenience init(apiKey: String){
		self.init(configuration: Configuration(apiKey: apiKey))
	}
	
	public init(configuration: Configuration){
		self.configuration = configuration
		self.urlSessionConfiguration = URLSessionConfiguration.default
		self.urlSessionConfiguration.httpAdditionalHeaders = ["Authorization": "Bearer " + configuration.apiKey]
	}
}
