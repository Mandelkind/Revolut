//
//  Revolut+Transaction.swift
//  Revolut
//
//  Created by Marco Betschart on 16.04.18.
//  Copyright © 2018 MANDELKIND. All rights reserved.
//

import Foundation

extension Revolut {
	
	public func transaction(withId id: String, completionHandler: @escaping ((Transaction?, Swift.Error?) -> Void)) {
		transactions(where: [.id(id)]) { transactions, error in
			guard let transactions = transactions else {
				return completionHandler(nil, error)
			}
			for transaction in transactions {
				if transaction.id == id {
					return completionHandler(transaction, error)
				}
			}
			completionHandler(nil, error)
		}
	}
}
