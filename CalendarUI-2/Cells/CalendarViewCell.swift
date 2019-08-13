//
//  CalendarViewCell.swift
//  CalendarUI-2
//
//  Created by Joel Ton on 8/4/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

class CalendarViewCell: UICollectionViewCell {
	
	let dateLabel: UILabel = {
		let label = UILabel()
		label.text = "00"
		label.textAlignment = .center
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = Colors.nightSky
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	
	override var isSelected: Bool {
		didSet {
			if self.isSelected {
				self.backgroundColor = Colors.nightSky
			} else {
				self.backgroundColor = UIColor.clear
			}
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		backgroundColor = UIColor.clear
		layer.cornerRadius = 5
		layer.masksToBounds = true
		
		setupViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	func setupViews() {
		addSubview(dateLabel)
		dateLabel.topAnchor.constraint(equalTo: topAnchor).isActive=true
		dateLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
		dateLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
		dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
	}
	
	
}
