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
	static var deselecttedCellLabelTextColor = UIColor.clear			// was .white
	static var selectedCellLabelTextColor = UIColor.white
	static var selectedCellBackgroundColor = Colors.nightSky			// was .black
	static var dayNameLabelColor = UIColor.white
	
	static func darkTheme() {
		backgroundColor = Colors.nightSky
		monthViewLabelColor = UIColor.white
		nextMonthButtonColor = UIColor.white
		previousMonthButtonColor = UIColor.white
		deselecttedCellLabelTextColor = UIColor.white
		selectedCellLabelTextColor = UIColor.white
		selectedCellBackgroundColor = Colors.nightSky  // used ot be UIColor.black
		dayNameLabelColor = UIColor.white
	}
	
	static func lightTheme() {
		backgroundColor = Colors.skyBlue
		monthViewLabelColor = UIColor.black
		nextMonthButtonColor = UIColor.black
		previousMonthButtonColor = UIColor.black
		deselecttedCellLabelTextColor = UIColor.black
		selectedCellLabelTextColor = UIColor.white
		selectedCellBackgroundColor = Colors.nightSky		// was .white
		dayNameLabelColor = UIColor.black
	}
}
