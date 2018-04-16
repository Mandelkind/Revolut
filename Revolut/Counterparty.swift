//
//  Counterparty.swift
//  Revolut
//
//  Created by Marco Betschart on 16.04.18.
//  Copyright © 2018 MANDELKIND. All rights reserved.
//

import Foundation

public struct Counterparty: Codable {
	public let id: String
	public let name: String
	public let phone: String
	public let profileType: ProfileType
	public let bankCountry: String
	public let state: String
	public let createdAt: Date
	public let updatedAt: Date?
	
	public let accounts: [Account]
	
	public enum ProfileType: String, Codable {
		case business
		case personal
	}
}
