//
//  Month.swift
//  CalendarUI-2
//
//  Created by Joel Ton on 8/6/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit


class Month: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource,
									UICollectionViewDelegateFlowLayout, MonthDelegate {
	
	
	var monthNames = ["January", "February", "March", "April", "May", "June", "July",
					  "August", "September", "October", "November", "December"]
	var numOfDaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
	var currentMonthIndex = 0
	var currentYear = 0
	var presentMonthIndex = 0
	var presentYear = 0
	var todaysDate = 0
	var firstDayOfTheMonth = 0   //(Sunday-Saturday 1-7)
	
	// Might be cheaper to use Calendar.current.component instead of creating an instace ?
	let aCalendar = Calendar(identifier: .gregorian)
	
//	var delegate: MonthDelegate?
	
	init() {
		super.init()
		initializeMonth()
	}
	
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
//	convenience init(calendarCollectionView: UICollectionView) {
//		self.init()
//
//		initializeMonth(calendarCollectionView: calendarCollectionView)
//	}
	
	
	convenience init(theme: LightThemes) {
		self.init()
		
		if theme == .dark {
			Style.darkTheme()
		} else {
			Style.lightTheme()
		}
		
		initializeMonth()
	}
	
	
	
	
//	func initializeMonth(calendarCollectionView: UICollectionView) {
//		currentMonthIndex = aCalendar.component(.month, from: Date())
//		currentYear = aCalendar.component(.year, from: Date())
//		todaysDate = aCalendar.component(.day, from: Date())
//		firstDayOfTheMonth = getFirstDay()
//
//		// Leap Year?
//		if isLeapYear(currentYear: currentYear) && currentMonthIndex == 2 {
//			numOfDaysInMonth[currentMonthIndex - 1] = 29
//		}
//
//		presentMonthIndex = currentMonthIndex
//		presentYear = currentYear
//
//		// setting the delegate and data source for the calandarCollectionView
//		calendarCollectionView.delegate = self
//		calendarCollectionView.dataSource = self
//	}
	
	
	func initializeMonth() {
		currentMonthIndex = aCalendar.component(.month, from: Date())
		currentYear = aCalendar.component(.year, from: Date())
		todaysDate = aCalendar.component(.day, from: Date())
		firstDayOfTheMonth = getFirstDay()
		
		// Leap Year?
		if isLeapYear(currentYear: currentYear) && currentMonthIndex == 2 {
			numOfDaysInMonth[currentMonthIndex - 1] = 29
		}
		
		presentMonthIndex = currentMonthIndex
		presentYear = currentYear
		
		// setting the delegate and data source for the calandarCollectionView
//		sharedRootViewController().calendarCollectionView.delegate = self
//		sharedRootViewController().calendarCollectionView.dataSource = self
	}
	
	
	func getFirstDay() -> Int {
		return ("\(currentMonthIndex) - 01 - \(currentYear)".date?.firstDayOfMonth.dayOfWeek)!
	}
	
	func sharedRootViewController() -> RootViewController {
//		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		/* The keyWindow is nil at this point.  So month is being called to initialize before the window appears. */
		return UIApplication.shared.keyWindow!.rootViewController as! RootViewController
	}
	
	func isLeapYear(currentYear: Int) -> Bool {
		return currentYear % 4 == 0 && currentYear % 100 != 0 || currentYear % 400 == 0
	}
	
	
	// MARK: - Delegate & Data Source Methods
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return numOfDaysInMonth[currentMonthIndex - 1] + firstDayOfTheMonth - 1
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",
								 for: indexPath) as! CalendarViewCell
		if indexPath.item <= firstDayOfTheMonth - 2 {
			cell.isHidden = true
		} else {
			let calculateDate = indexPath.row - firstDayOfTheMonth + 2
			cell.isHidden = false
			cell.dateCell.text = "\(calculateDate)"
			if calculateDate < todaysDate && currentYear == presentYear &&
									currentMonthIndex == presentMonthIndex {
				cell.isUserInteractionEnabled = false
				cell.dateCell.textColor = UIColor.lightGray
			} else {
				cell.isUserInteractionEnabled = true
				cell.dateCell.textColor = Style.activeCellLabelColor
			}
		}
		return cell
		
	}
	
	
	func collectionView(_ collectionView: UICollectionView,
						didSelectItemAt indexPath: IndexPath) {
		
		let cell = collectionView.cellForItem(at: indexPath)
		cell?.backgroundColor = UIColor.clear
		let label = cell?.subviews[1] as! UILabel
		label.textColor = Style.activeCellLabelColor
	}
	
	
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width = collectionView.frame.width / 7 - 8
		let height: CGFloat = 40
		return CGSize(width: width, height: height)
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 8.0
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 8.0
	}
	
	
	func didChange(month monthIndex: Int, year: Int) {
		
		currentMonthIndex = monthIndex + 1
		currentYear = year
		
		// If leap year, February has 29 days
		if monthIndex == 1 {
			if isLeapYear(currentYear: currentYear) {
				numOfDaysInMonth[monthIndex] = 29
			} else {
				numOfDaysInMonth[monthIndex] = 28
			}
		}
		firstDayOfTheMonth = getFirstDay()
		sharedRootViewController().calendarCollectionView.reloadData()
		
		// MARK: - May change this to allow going back two months???.
		sharedRootViewController().previousMonthButton.isEnabled =
			!(currentMonthIndex == presentMonthIndex && currentYear == presentYear)
		
	}
}
