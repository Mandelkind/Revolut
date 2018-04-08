//
//  Account.swift
//  Revolut
//
//  Created by Marco Betschart on 02.03.18.
//  Copyright © 2018 MANDELKIND. All rights reserved.
//

import Foundation

public struct Account: Codable {
	public let id: String
	public let name: String?
	public let balance: Decimal
	public let currencyCode: String
	public let state: AccountState
	public let isPublic: Bool
	public let createdAt: Date
	public let updatedAt: Date
	
	enum CodingKeys: String, CodingKey {
		case id
		case name
		case balance
		case currencyCode = "currency"
		case state
		case isPublic = "public"
		case createdAt = "created_at"
		case updatedAt = "updated_at"
	}
}

public enum AccountState: String, Codable {
	case active = "active"
	case inactive = "inactive"
}
