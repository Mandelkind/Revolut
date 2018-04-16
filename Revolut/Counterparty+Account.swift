//
//  CounterpartyAccount.swift
//  Revolut
//
//  Created by Marco Betschart on 08.04.18.
//  Copyright © 2018 MANDELKIND. All rights reserved.
//

import Foundation


extension Counterparty {
	
	public struct Account: Codable {
		public let id: String
		public let accountId: String
		public let currencyCode: String
		public let type: AccountType
		public let accountNo: String
		public let iban: String
		public let sortCode: String
		public let routingNumber: String
		public let bic: String
		public let recipientCharges: RecipientChargesPossibility
	}
	
	public enum AccountType: String, Codable {
		case revolut
		case external
		case mySelf = "self"
	}
	
	public enum RecipientChargesPossibility: String, Codable {
		case no
		case expected
	}
}
