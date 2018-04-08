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
		Revolut.api("sand_rCN8eyhbSXyRLLvHauZE57VeJkcuYG-y64KgSdnTQGs")
		Revolut.api.accounts{ accounts, error in
			
			print("accounts:",accounts,"error:",error)
		}
	}
}

