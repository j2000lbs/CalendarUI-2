//
//  Styles.swift
//  CalendarUI-2
//
//  Created by Joel Ton on 8/4/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit


struct Style {
	static var backgroundColor = UIColor.white
	static var monthViewLabelColor = UIColor.white
	static var nextMonthButtonColor = UIColor.white
	static var previousMonthButtonColor = UIColor.white
	static var activeCellLabelColor = UIColor.white
	static var activeCellLabelColorHighlighted = UIColor.black
	static var dayNameLabelColor = UIColor.white
	
	static func darkTheme() {
		backgroundColor = Colors.nightSky
		monthViewLabelColor = UIColor.white
		nextMonthButtonColor = UIColor.white
		previousMonthButtonColor = UIColor.white
		activeCellLabelColor = UIColor.white
		activeCellLabelColorHighlighted = Colors.red
		dayNameLabelColor = UIColor.white
	}
	
	static func lightTheme() {
		backgroundColor = Colors.skyBlue
		monthViewLabelColor = UIColor.black
		nextMonthButtonColor = UIColor.black
		previousMonthButtonColor = UIColor.black
		activeCellLabelColor = UIColor.black
		activeCellLabelColorHighlighted = Colors.red
		dayNameLabelColor = UIColor.black
	}
}
