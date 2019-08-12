//
//  DaysView.swift
//  CalendarUI-2
//
//  Created by Joel Ton on 8/11/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

class DaysView: UIView {

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = UIColor.clear
		
		setupViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	func setupViews() {
		addSubview(daysStackView)
		daysStackView.topAnchor.constraint(equalTo: topAnchor).isActive=true
		daysStackView.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
		daysStackView.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
		daysStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
		
		var dayAbbreviations = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
		for i in 0...6 {
			let dayLabel = UILabel()
			dayLabel.text=dayAbbreviations[i]
			dayLabel.textAlignment = .center
			dayLabel.textColor = Style.dayNameLabelColor
			daysStackView.addArrangedSubview(dayLabel)
		}
	}
	
	let daysStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.distribution = .fillEqually
		stackView.translatesAutoresizingMaskIntoConstraints=false
		return stackView
	}()
}
