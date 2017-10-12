//
//  AppDelegate.swift
//  Carousel-Like UI
//
//  Created by Chris Huang on 12/10/2017.
//  Copyright © 2017 Chris Huang. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		let configuration = ParseClientConfiguration {
			$0.applicationId = "qJktCCbmcJwAgNy6TUe7Eb3nqOgM2dpdNtKrVZjo"
			$0.clientKey = "o0nNFPLr4YPad630n1eGpruB9K7FyuqIkf6NGOHb"
			$0.server = "https://parseapi.back4app.com/"
		}
		Parse.initialize(with: configuration)
		
		return true
	}

}
