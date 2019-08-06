//
//  CalendarView.swift
//  CalendarUI-2
//
//  Created by Joel Ton on 8/4/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

class CalendarView: UIView, UICollectionViewDelegate, UICollectionViewDataSource,
									UICollectionViewDelegateFlowLayout, MonthViewDelegate {
	
	var numberOfDaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
	var currentMonthIndex = 0
	var currentYear = 0
	var presentMonthIndex = 0
	var presentYear = 0
	var todaysDate = 0
	var firstDayOfMonth = 0			// Sunday - Saturday is 1 - 7
	
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
//		initializeView()
	}
	
	convenience init(theme: LightThemes) {
		self.init()
		
		if theme == .dark {
			Style.darkTheme()
		} else {
			Style.lightTheme()
		}
		
//		initializeView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	
//	func changeTheme() {
//		calendarCollectionView.reloadData()
//		
//		monthView.monthYearLabelName.textColor = Style.monthViewLabelColor
//		monthView.rightButton.setTitleColor(Style.monthViewRightButtonColor, for: .normal)
//		monthView.leftButton.setTitleColor(Style.monthViewLeftButtonColor, for: .normal)
//		
//		for i in 0...6 {
//			(daysView.daysStackView.subviews[i] as! UILabel).textColor = Style.dayNameLabelColor
//		}
//	}
	
	
	
	
	
	
	
	
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
// MARK: - this is just so it will build and needs to be removed
		let cell: UICollectionViewCell? = nil
		return cell!
	}
	
	func didChange(month monthIndex: Int, year: Int) {
		
	}
	
	
}
