//
//  Configuration.swift
//  Revolut
//
//  Created by Marco Betschart on 02.03.18.
//  Copyright © 2018 MANDELKIND. All rights reserved.
//

import Foundation

public struct Configuration {
	public let apiKey: String
	public let apiVersion = 1.0
	
	public var apiEndpoint: URL {
		if self.environment == .sandbox {
			return URL(string: "https://sandbox-b2b.revolut.com/api/" + String(apiVersion))!
		}
		return URL(string: "https://b2b.revolut.com/api/" + String(apiVersion))!
	}
	
	public var environment: Environment {
		if apiKey.lowercased().starts(with: "sand_") {
			return .sandbox
		}
		return .production
	}
	
	public init(apiKey: String){
		self.apiKey = apiKey
	}
}

public enum Environment {
	case sandbox
	case production
}
