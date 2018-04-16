//
//  Transaction.swift
//  Revolut
//
//  Created by Marco Betschart on 08.04.18.
//  Copyright © 2018 MANDELKIND. All rights reserved.
//

import Foundation

public struct TransactionCreatedEvent: Codable {
	public let eventName: String
	public let timestamp: Date
	public let data: Transaction
	
	enum CodingKeys: String, CodingKey {
		case eventName = "event"
		case timestamp
		case data
	}
}


public struct TransactionStateChangedEvent: Codable {
	public let eventName: String
	public let timestamp: Date
	public let data: TransactionStateChanged
	
	enum CodingKeys: String, CodingKey {
		case eventName = "event"
		case timestamp
		case data
	}
}


public struct TransactionStateChanged: Codable {
	public let id: String
	public let oldState: TransactionState
	public let newState: TransactionState
}


public struct Transaction: Codable {
	public let id: String
	public let type: TransactionType
	public let requestId: String?
	public let state: TransactionState
	public let reasonCode: String?
	public let createdAt: Date
	public let updatedAt: Date?
	public let completedAt: Date?
	public let scheduledFor: Date?
	public let reference: String?
	public let legs: [TransactionLeg]
}


public enum TransactionType: String, Codable {
	case atm
	case cardPayment
	case cardRefund
	case cardChargeback
	case cardCredit
	case exchange
	case transfer
	case loan
	case fee
	case refund
	case topup
	case topupReturn
	case tax
	case taxRefund
}


public enum TransactionState: String, Codable {
	case pending
	case completed
	case failed
	case reverted
	case declined
}


public struct TransactionLeg: Codable {
	public let id: String
	public let currencyCode: String
	public let amount: Decimal
	public let billCurrencyCode: String?
	public let billAmount: Decimal?
	public let accountId: String
	public let counterparty: Account?
	public let purpose: String?
	
	enum CodingKeys: String, CodingKey {
		case id = "legId"
		case currencyCode = "currency"
		case amount
		case billCurrencyCode = "bill_currency"
		case billAmount = "bill_amount"
		case accountId
		case counterparty
		case purpose = "description"
	}
	
	public struct Account: Codable {
		public let id: String
		public let accountType: Counterparty.AccountType
		public let accountId: String
	}
}
