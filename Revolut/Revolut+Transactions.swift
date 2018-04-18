//
//  Revolut+Transactions.swift
//  Revolut
//
//  Created by Marco Betschart on 16.04.18.
//  Copyright © 2018 MANDELKIND. All rights reserved.
//

import Foundation

extension Revolut {
	
	public enum TransactionsFilter {
		case from(Date)
		case to(Date)
		case counterparty(Counterparty)
		case count(Int)
		case type(TransactionType)
	}
	
	public func transactions(where filters: [TransactionsFilter] = [], completionHandler: @escaping (([Transaction]?, Swift.Error?) -> Void)) {
		let urlSession = URLSession(configuration: urlSessionConfiguration)
		
		var urlComponents = URLComponents(url: configuration.apiEndpoint.appendingPathComponent("transactions"), resolvingAgainstBaseURL: false)
		urlComponents?.queryItems = []
		
		for filter in filters {
			switch filter {
			case .from(let value):
				urlComponents?.queryItems?.append(URLQueryItem(name: "from", value: Revolut.iso8601Formatter.string(from: value)))
			case .to(let value):
				urlComponents?.queryItems?.append(URLQueryItem(name: "to", value: Revolut.iso8601Formatter.string(from: value)))
			case .counterparty(let value):
				urlComponents?.queryItems?.append(URLQueryItem(name: "counterparty", value: value.id))
			case .count(let value):
				urlComponents?.queryItems?.append(URLQueryItem(name: "count", value: String(value)))
			case .type(let value):
				urlComponents?.queryItems?.append(URLQueryItem(name: "type", value: value.rawValue))
			}
		}
		
		guard let url = urlComponents?.url else {
			return completionHandler(nil, Error.badRequest)
		}
		
		let dataTask = urlSession.dataTask(with: url) { data, response, error in
			if let error = error {
				completionHandler(nil, error)
				return
			}
			guard let response = response as? HTTPURLResponse else {
				completionHandler(nil, Error.unprocessableEntity)
				return
			}
			guard response.statusCode == 200 else {
				completionHandler(nil, Error.from(errorCode: response.statusCode))
				return
			}
			guard let data = data else {
				completionHandler([],nil)
				return
			}
			
			do {
				completionHandler(try Revolut.jsonDecoder.decode([Transaction].self, from: data), nil)
			} catch {
				completionHandler(nil, error)
			}
		}
		dataTask.resume()
	}
}
