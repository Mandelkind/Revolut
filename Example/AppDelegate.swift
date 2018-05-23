//
//  AppDelegate.swift
//  Example
//
//  Created by Marco Betschart on 02.03.18.
//  Copyright © 2018 MANDELKIND. All rights reserved.
//

import UIKit
import Revolut

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		// MARK: Set your Revolut API Key
		// It should have one of the following formats:
		//
		// Sandbox: sand_XXXXXXX
		// Production: prod_XXXXXXX
		Revolut.configure("sand_XXXXXXX")
		
		return true
	}
}
