//
//  TripCardViewController.swift
//  Carousel-Like UI
//
//  Created by Chris Huang on 12/10/2017.
//  Copyright © 2017 Chris Huang. All rights reserved.
//

import UIKit

class TripCardViewController: UIViewController {
	
	override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }

	@IBOutlet weak var backgroundImageView: UIImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		backgroundImageView.image = #imageLiteral(resourceName: "cloud")
		let blurEffect = UIBlurEffect(style: .dark)
		let blurEffectView = UIVisualEffectView(effect: blurEffect)
		blurEffectView.frame = view.bounds
		backgroundImageView.addSubview(blurEffectView)
	}
}
