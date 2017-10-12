//
//  Trip.swift
//  Carousel-Like UI
//
//  Created by Chris Huang on 12/10/2017.
//  Copyright © 2017 Chris Huang. All rights reserved.
//

import UIKit
import Parse

struct Trip {
	
	struct Info {
		static let city = "city"
		static let country = "country"
		static let featuredImage = "featuredImage"
		static let pirce = "price"
		static let totalDays = "totalDays"
		static let isLiked = "isLiked"
	}
	
	var tripId = ""
	var city = ""
	var country = ""
	var featuredImage: PFFile?
	var price:Int = 0
	var totalDays:Int = 0
	var isLiked = false
	
	init(tripId: String, city: String, country: String, featuredImage: PFFile!,
	     price: Int, totalDays: Int, isLiked: Bool) {
		self.tripId = tripId
		self.city = city
		self.country = country
		self.featuredImage = featuredImage
		self.price = price
		self.totalDays = totalDays
		self.isLiked = isLiked
	}
	
	init(pfObject: PFObject) {
		self.tripId = pfObject.objectId!
		self.city = pfObject[Info.city] as! String
		self.country = pfObject[Info.country] as! String
		self.featuredImage = pfObject[Info.featuredImage] as? PFFile
		self.price = pfObject[Info.pirce] as! Int
		self.totalDays = pfObject[Info.totalDays] as! Int
		self.isLiked = pfObject[Info.isLiked] as! Bool
	}
	
	func toPFObject() -> PFObject {
		let tripObject = PFObject(className: "Trip")
		tripObject.objectId = tripId
		tripObject[Info.city] = city
		tripObject[Info.country] = country
		tripObject[Info.featuredImage] = featuredImage
		tripObject[Info.pirce] = price
		tripObject[Info.totalDays] = totalDays
		tripObject[Info.isLiked] = isLiked
		return tripObject
	}
}
