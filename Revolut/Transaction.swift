//
//  Transaction.swift
//  Revolut
//
//  Created by Marco Betschart on 08.04.18.
//  Copyright © 2018 MANDELKIND. All rights reserved.
//

import Foundation

public struct TransactionCreatedEvent: Codable {
	let eventName: String
	let timestamp: Date
	let data: Transaction
	
	enum CodingKeys: String, CodingKey {
		case eventName = "event"
		case timestamp
		case data
	}
}


public struct TransactionStateChangedEvent: Codable {
	let eventName: String
	let timestamp: Date
	let data: TransactionStateChanged
	
	enum CodingKeys: String, CodingKey {
		case eventName = "event"
		case timestamp
		case data
	}
}


public struct TransactionStateChanged: Codable {
	let id: String
	let oldState: TransactionState
	let newState: TransactionState
}


public struct Transaction: Codable {
	let id: String
	let type: TransactionType
	let requestId: String
	let state: TransactionState
	let createdAt: Date
	let updatedAt: Date?
	let completedAt: Date?
	let reference: String
	let legs: [TransactionLeg]
	let amount: Decimal
	let currencyCode: String
	
	enum CodingKeys: String, CodingKey {
		case id
		case type
		case requestId = "request_id"
		case state
		case createdAt = "created_at"
		case updatedAt = "updated_at"
		case completedAt = "completed_at"
		case reference
		case legs
		case amount
		case currencyCode = "currency"
	}
}


public enum TransactionType: String, Codable {
	case atm
	case cardPayment = "card_payment"
	case cardRefund = "card_refund"
	case cardChargeback = "card_chargeback"
	case cardCredit = "card_credit"
	case exchange
	case transfer
	case loan
	case fee
	case refund
	case topup
	case topupReturn = "topup_return"
	case tax
	case taxRefund = "tax_refund"
}


public enum TransactionState: String, Codable {
	case pending
	case completed
	case failed
	case reverted
	case declined
}


public struct TransactionLeg: Codable {
	let id: String
	let accountId: String
	let counterParty: CounterPartyAccount
}
