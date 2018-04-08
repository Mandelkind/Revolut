//
//  CounterPartyAccount.swift
//  Revolut
//
//  Created by Marco Betschart on 08.04.18.
//  Copyright © 2018 MANDELKIND. All rights reserved.
//

import Foundation


public struct CounterPartyAccount: Codable {
	var accountId: String
	var type: CounterPartyAccountType
}

public enum CounterPartyAccountType: String, Codable {
	case revolut
	case external
}
