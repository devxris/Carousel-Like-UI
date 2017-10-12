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
	
	var isLiked: Bool = false {
		didSet {
			likeButton.setImage(isLiked ? #imageLiteral(resourceName: "heartfull") : #imageLiteral(resourceName: "heart"), for: .normal)
		}
	}
}
