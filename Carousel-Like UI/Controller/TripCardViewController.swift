//
//  TripCardViewController.swift
//  Carousel-Like UI
//
//  Created by Chris Huang on 12/10/2017.
//  Copyright © 2017 Chris Huang. All rights reserved.
//

import UIKit
import Parse

class TripCardViewController: UIViewController {
	
	/*
	private var trips = [Trip(tripId: "Paris001", city: "Paris", country: "France",
	                          featuredImage: UIImage(named: "paris"), price: 2000, totalDays: 5, isLiked: false),
	                     Trip(tripId: "Rome001", city: "Rome", country: "Italy", featuredImage:
							UIImage(named: "rome"), price: 800, totalDays: 3, isLiked: false),
	                     Trip(tripId: "Istanbul001", city: "Istanbul", country: "Turkey",
	                          featuredImage: UIImage(named: "istanbul"), price: 2200, totalDays: 10, isLiked:false),
	                     Trip(tripId: "London001", city: "London", country: "United Kingdom",featuredImage: UIImage(named: "london"), price: 3000, totalDays: 4, isLiked: false),
	                     Trip(tripId: "Sydney001", city: "Sydney", country: "Australia",
	                          featuredImage: UIImage(named: "sydney"), price: 2500, totalDays: 8, isLiked: false),
	                     Trip(tripId: "Santorini001", city: "Santorini", country: "Greece",
	                          featuredImage: UIImage(named: "santorini"), price: 1800, totalDays: 7, isLiked:false),
	                     Trip(tripId: "NewYork001", city: "New York", country: "United States",
	                          featuredImage: UIImage(named: "newyork"), price: 900, totalDays: 3, isLiked:false),
	                     Trip(tripId: "Kyoto001", city: "Kyoto", country: "Japan", featuredImage:
							UIImage(named: "kyoto"), price: 1000, totalDays: 5, isLiked: false)] */

	private var trips = [Trip]()
	
	override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }

	@IBOutlet weak var backgroundImageView: UIImageView!
	
	@IBOutlet weak var collectionView: UICollectionView! {
		didSet {
			collectionView.dataSource = self
			collectionView.delegate = self
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		backgroundImageView.image = #imageLiteral(resourceName: "cloud")
		let blurEffect = UIBlurEffect(style: .dark)
		let blurEffectView = UIVisualEffectView(effect: blurEffect)
		blurEffectView.frame = view.bounds
		backgroundImageView.addSubview(blurEffectView)
		
		collectionView.backgroundColor = .clear
		
		if UIScreen.main.bounds.size.height == 568 {
			guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
			flowLayout.itemSize = CGSize(width: 250.0, height: 330.0)
		}
		
		fetchTripsFromParse()
	}
	
	private func fetchTripsFromParse() {
		
		trips.removeAll(keepingCapacity: true)
		collectionView.reloadData()
		
		// fetch data from parse
		let query = PFQuery(className: "Trip")
		query.findObjectsInBackground { [weak self] (objects, error) in
			if let error = error { print(error.localizedDescription); return }
			guard let objects = objects else { return }
			for (index, object) in objects.enumerated() {
				// Convert PFObject to Trip object
				let trip = Trip(pfObject: object)
				self?.trips.append(trip)
				
				let indexPath = IndexPath(item: index, section: 0)
				self?.collectionView.insertItems(at: [indexPath])
			}
		}
	}
	
	@IBAction func reload(_ sender: UIButton) {
		fetchTripsFromParse()
	}
}

extension TripCardViewController: UICollectionViewDataSource, UICollectionViewDelegate {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return trips.count
	}
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TripCell
		cell.delegate = self
		cell.trip = trips[indexPath.row]
		cell.layer.cornerRadius = 4.0
		return cell
	}
}

extension TripCardViewController: TripCellDelegate {
	
	func didPressLikeButton(cell: TripCell) {
		guard let indexPath = collectionView.indexPath(for: cell) else { return }
		trips[indexPath.item].isLiked = trips[indexPath.item].isLiked ? false : true
		cell.trip = trips[indexPath.item]
	}
}
