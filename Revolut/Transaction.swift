//
//  Transaction.swift
//  Revolut
//
//  Created by Marco Betschart on 08.04.18.
//  Copyright © 2018 MANDELKIND. All rights reserved.
//

import Foundation

public struct TransactionCreatedEvent: Codable {
	var eventName: String
	var timestamp: Date
	var data: Transaction
	
	enum CodingKeys: String, CodingKey {
		case eventName = "event"
		case timestamp
		case data
	}
}


public struct TransactionStateChangedEvent: Codable {
	var eventName: String
	var timestamp: Date
	var data: TransactionStateChanged
	
	enum CodingKeys: String, CodingKey {
		case eventName = "event"
		case timestamp
		case data
	}
}


public struct TransactionStateChanged: Codable {
	var id: String
	var oldState: TransactionState
	var newState: TransactionState
}


public struct Transaction: Codable {
	var id: String
	var type: TransactionType
	var requestId: String
	var state: TransactionState
	var createdAt: Date
	var updatedAt: Date?
	var completedAt: Date?
	var reference: String
	var legs: [TransactionLeg]
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
	var id: String
	var currencyCode: String
	var amount: Decimal?
	var accountId: String
	var counterParty: CounterPartyAccount
	
	enum CodingKeys: String, CodingKey {
		case id = "legId"
		case currencyCode = "currency"
		case amount
		case accountId
		case counterParty = "counterparty"
	}
}
