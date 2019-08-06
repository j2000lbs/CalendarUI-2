//
//  CalendarViewCell.swift
//  CalendarUI-2
//
//  Created by Joel Ton on 8/4/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

class CalendarViewCell: UICollectionViewCell {
	
	@IBOutlet weak var dateCell: UILabel!
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		backgroundColor = UIColor.clear
		layer.cornerRadius = 5
		layer.masksToBounds = true
		
		dateCell.textColor = Colors.skyBlue
	}
	
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}
