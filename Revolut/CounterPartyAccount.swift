//
//  CounterPartyAccount.swift
//  Revolut
//
//  Created by Marco Betschart on 08.04.18.
//  Copyright © 2018 MANDELKIND. All rights reserved.
//

import Foundation


public struct CounterPartyAccount: Codable {
	public let accountId: String
	public let type: CounterPartyAccountType
}

public enum CounterPartyAccountType: String, Codable {
	case revolut
	case external
}
