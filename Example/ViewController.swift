//
//  ViewController.swift
//  Example
//
//  Created by Marco Betschart on 02.03.18.
//  Copyright © 2018 MANDELKIND. All rights reserved.
//

import UIKit
import Revolut

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		Revolut.configure("sand_rCN8eyhbSXyRLLvHauZE57VeJkcuYG-y64KgSdnTQGs")
//		Revolut.shared.accounts{ accounts, error in
//			print("accounts:",accounts,"error:",error)
//		}
		
//		Revolut.shared.transactions{ transactions, error in
//			print("transactions:",transactions,"error:",error)
//		}
		
		Revolut.shared.transaction(withId: "45393444-4513-458b-be68-d16f15456970") { transaction, error in
			print("transaction:",transaction,"error:",error)
		}
	}
}

