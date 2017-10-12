//
//  TripCell.swift
//  Carousel-Like UI
//
//  Created by Chris Huang on 12/10/2017.
//  Copyright © 2017 Chris Huang. All rights reserved.
//

import UIKit

class TripCell: UICollectionViewCell {
	
	@IBOutlet var imageView: UIImageView!
	@IBOutlet var cityLabel: UILabel!
	@IBOutlet var countryLabel: UILabel!
	@IBOutlet var totalDaysLabel: UILabel!
	@IBOutlet var priceLabel: UILabel!
	@IBOutlet var likeButton: UIButton!
	
	var trip: Trip? {
		didSet {
			guard let trip = trip else { return }
			cityLabel.text = trip.city
			countryLabel.text = trip.country
			totalDaysLabel.text = "\(trip.totalDays) Days"
			priceLabel.text = "$" + String(describing: trip.price)
			likeButton.setImage(trip.isLiked ? #imageLiteral(resourceName: "heartfull") : #imageLiteral(resourceName: "heart"), for: .normal)
			imageView.image = trip.featuredImage
		}
	}
}
