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
	public let merchant: TransactionMerchant?
	public let legs: [TransactionLeg]
	public let card: TransactionCard?
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


public struct TransactionMerchant: Codable {
	public let name: String
	public let city: String
	public let categoryCode: String
	public let country: String
}


public struct TransactionCard: Codable {
	public let cardNumber: String
	public let firstName: String?
	public let lastName: String?
	public let phone: String?
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
		case billCurrencyCode = "billCurrency"
		case billAmount
		case accountId
		case counterparty
		case purpose = "description"
	}
	
	public struct Account: Codable {
		public let id: String?
		public let accountType: Counterparty.AccountType
		public let accountId: String
	}
}
