//
//  LightThemeHelpers.swift
//  CalendarUI-2
//
//  Created by Joel Ton on 8/7/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

struct LightThemeHelpers {
	
	// used to access the dayLabelOutlets property of RootViewController
	let appDelegate = UIApplication.shared.delegate as! AppDelegate
	
	mutating func changeTheme(calendarCollectionView: UICollectionView,
							  monthYearNameLabel: UILabel, nextMonthButton: UIButton,
							  previousMonthButton: UIButton) {
		
		let rootViewController = appDelegate.window!.rootViewController! as! RootViewController
		
		calendarCollectionView.reloadData()
		
		monthYearNameLabel.textColor = Style.monthViewLabelColor
		nextMonthButton.setTitleColor(Style.nextMonthButtonColor, for: .normal)
		previousMonthButton.setTitleColor(Style.previousMonthButtonColor, for: .normal)
		
		for label in rootViewController.dayLabelOutlets {
			label.textColor = Style.dayNameLabelColor
		}
	}
}
