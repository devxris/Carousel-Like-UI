//
//  TripCell.swift
//  Carousel-Like UI
//
//  Created by Chris Huang on 12/10/2017.
//  Copyright © 2017 Chris Huang. All rights reserved.
//

import UIKit
import Parse

protocol TripCellDelegate: class {
	func didPressLikeButton(cell: TripCell)
}

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
			
			// imageView.image = trip.featuredImage
			if let featuredImage = trip.featuredImage {
				featuredImage.getDataInBackground(block: { (data, error) in
					if let imageData = data {
						DispatchQueue.main.async {
							self.imageView.image = UIImage(data: imageData)
						}
					}
				})
			}
		}
	}
	
	weak var delegate: TripCellDelegate?
	
	@IBAction func likeButtonTapped(sender: UIButton) {
		delegate?.didPressLikeButton(cell: self)
	}
}
