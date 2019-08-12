//
//  Month.swift
//  CalendarUI-2
//
//  Created by Joel Ton on 8/6/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

class MonthView: UIView {
	var monthNames = ["January", "February", "March", "April", "May", "June", "July",
					  "August", "September", "October", "November", "December"]
	var currentMonthIndex = 0
	var currentYear: Int = 0
	var delegate: MonthViewDelegate?
	
	let monthLabel: UILabel = {
		let label = UILabel()
		label.text = "Default Month Year text"
		label.textColor = Style.monthViewLabelColor
		label.textAlignment = .center
		label.font = UIFont.boldSystemFont(ofSize: 16)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	
	let nextMonthButton: UIButton = {
		let btn=UIButton()
		btn.setTitle(">", for: .normal)
		btn.setTitleColor(Style.nextMonthButtonColor, for: .normal)
		btn.translatesAutoresizingMaskIntoConstraints=false
		btn.addTarget(self, action: #selector(previousOrNextMonthButton(sender:)), for: .touchUpInside)
		return btn
	}()
	
	
	let previousMonthButton: UIButton = {
		let btn=UIButton()
		btn.setTitle("<", for: .normal)
		btn.setTitleColor(Style.previousMonthButtonColor, for: .normal)
		btn.translatesAutoresizingMaskIntoConstraints=false
		btn.addTarget(self, action: #selector(previousOrNextMonthButton(sender:)), for: .touchUpInside)
		btn.setTitleColor(UIColor.lightGray, for: .disabled)
		return btn
	}()
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor=UIColor.clear
		
		currentMonthIndex = Calendar.current.component(.month, from: Date()) - 1
		currentYear = Calendar.current.component(.year, from: Date())
		
		setupViews()
		
		previousMonthButton.isEnabled = false
	}
	
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	@objc func previousOrNextMonthButton(sender: UIButton) {
		if sender == nextMonthButton {
			currentMonthIndex += 1
			if currentMonthIndex > 11 {
				currentMonthIndex = 0
				currentYear += 1
			}
		} else {
			currentMonthIndex -= 1
			if currentMonthIndex < 0 {
				currentMonthIndex = 11
				currentYear -= 1
			}
		}
		monthLabel.text="\(monthNames[currentMonthIndex]) \(currentYear)"
		delegate?.didChange(month: currentMonthIndex, year: currentYear)
	}
	
	
	func setupViews() {
		self.addSubview(monthLabel)
		monthLabel.topAnchor.constraint(equalTo: topAnchor).isActive=true
		monthLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive=true
		monthLabel.widthAnchor.constraint(equalToConstant: 150).isActive=true
		monthLabel.heightAnchor.constraint(equalTo: heightAnchor).isActive=true
		monthLabel.text="\(monthNames[currentMonthIndex]) \(currentYear)"
		
		self.addSubview(nextMonthButton)
		nextMonthButton.topAnchor.constraint(equalTo: topAnchor).isActive=true
		nextMonthButton.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
		nextMonthButton.widthAnchor.constraint(equalToConstant: 50).isActive=true
		nextMonthButton.heightAnchor.constraint(equalTo: heightAnchor).isActive=true
		
		self.addSubview(previousMonthButton)
		previousMonthButton.topAnchor.constraint(equalTo: topAnchor).isActive=true
		previousMonthButton.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
		previousMonthButton.widthAnchor.constraint(equalToConstant: 50).isActive=true
		previousMonthButton.heightAnchor.constraint(equalTo: heightAnchor).isActive=true
	}
}












//class MonthView: UIView, UICollectionViewDelegate, UICollectionViewDataSource,
//									UICollectionViewDelegateFlowLayout, MonthViewDelegate {
//
//	var numOfDaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
//	var currentMonthIndex = 0
//	var currentYear = 0
//	var presentMonthIndex = 0
//	var presentYear = 0
//	var todaysDate = 0
//	var firstDayOfTheMonth = 0   //(Sunday-Saturday 1-7)
//
//	let monthView: MonthView = {
//		let view = MonthView()
//		view.translatesAutoresizingMaskIntoConstraints = false
//		return view
//	}()
//
//
//	override init(frame: CGRect) {
//		super.init(frame: frame)
//
//		initializeMonthView()
//	}
//
//	convenience init(theme: LightThemes) {
//		self.init()
//
//		if theme == .dark {
//			Style.darkTheme()
//		} else {
//			Style.lightTheme()
//		}
//
//		initializeMonthView()
//	}
//
//	required init?(coder aDecoder: NSCoder) {
//		fatalError("init(coder:) has not been implemented")
//	}
//
//
//	func changeLightTheme() {
//		myCollectionView.reloadData()
//
//		monthView.lblName.textColor = Style.monthViewLabelColor
//		monthView.btnRight.setTitleColor(Style.nextMonthButtonColor, for: .normal)
//		monthView.btnLeft.setTitleColor(Style.previousMonthButtonColor, for: .normal)
//
//		for i in 0..<7 {
//			(weekdaysView.myStackView.subviews[i] as! UILabel).textColor = Style.dayNameLabelColor
//		}
//
//	}
//
//
//	func initializeMonthView() {
//		currentMonthIndex = Calendar.current.component(.month, from: Date())
//		currentYear = Calendar.current.component(.year, from: Date())
//		todaysDate = Calendar.current.component(.day, from: Date())
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
//		setupViews()
//
//		calendarCollectionView.delegate = self
//		calendarCollectionView.dataSource = self
//		calendarCollectionView.register(dateCVCell.self,
//										forCellWithReuseIdentifier: "Cell")
//	}
//
//
//	func getFirstDay() -> Int {
//		// mm - dd - yyyy
//		return ("\(currentMonthIndex) - 01 - \(currentYear)".date?.firstDayOfMonth.dayOfWeek)!
//	}
//
//
//	func isLeapYear(currentYear: Int) -> Bool {
//		return currentYear % 4 == 0 && currentYear % 100 != 0 || currentYear % 400 == 0
//	}
//
//
//	func setupViews() {
//
//	}
//
//
//	// MARK: - Delegate & Data Source Methods
//
//	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//		return numOfDaysInMonth[currentMonthIndex - 1] + firstDayOfTheMonth - 1
//	}
//
//	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",
//								 for: indexPath) as! CalendarViewCell
//		if indexPath.item <= firstDayOfTheMonth - 2 {
//			cell.isHidden = true
//		} else {
//			let calculateDate = indexPath.row - firstDayOfTheMonth + 2
//			cell.isHidden = false
//			cell.dateCell.text = "\(calculateDate)"
//			if calculateDate < todaysDate && currentYear == presentYear &&
//									currentMonthIndex == presentMonthIndex {
//				cell.isUserInteractionEnabled = false
//				cell.dateCell.textColor = UIColor.lightGray
//			} else {
//				cell.isUserInteractionEnabled = true
//				cell.dateCell.textColor = Style.activeCellLabelColor
//			}
//		}
//		return cell
//
//	}
//
//
//	func collectionView(_ collectionView: UICollectionView,
//						didSelectItemAt indexPath: IndexPath) {
//
//		let cell = collectionView.cellForItem(at: indexPath)
//		cell?.backgroundColor = Colors.nightSky
//		let label = cell?.subviews[1] as! UILabel
//		label.textColor = UIColor.white
//	}
//
//
//	func collectionView(_ collectionView: UICollectionView,
//						didDeselectItemAt indexPath: IndexPath) {
//		let cell=collectionView.cellForItem(at: indexPath)
//		cell?.backgroundColor=UIColor.clear
//		let lbl = cell?.subviews[1] as! UILabel
//		lbl.textColor = Style.activeCellLabelColor
//	}
//
//
//	func collectionView(_ collectionView: UICollectionView,
//						layout collectionViewLayout: UICollectionViewLayout,
//						sizeForItemAt indexPath: IndexPath) -> CGSize {
//		let width = collectionView.frame.width / 7 - 8
//		let height: CGFloat = 40
//		return CGSize(width: width, height: height)
//	}
//
//
//	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//		return 8.0
//	}
//
//
//	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//		return 8.0
//	}
//
//
//	func didChange(month monthIndex: Int, year: Int) {
//
//		currentMonthIndex = monthIndex + 1
//		currentYear = year
//
//		// If leap year, February has 29 days
//		if monthIndex == 1 {
//			if isLeapYear(currentYear: currentYear) {
//				numOfDaysInMonth[monthIndex] = 29
//			} else {
//				numOfDaysInMonth[monthIndex] = 28
//			}
//		}
//		firstDayOfTheMonth = getFirstDay()
//		calendarCollectionView.reloadData()
//
//		// MARK: - May change this to allow going back two months???.
//		month.View.previousMonthButton.isEnabled =
//			!(currentMonthIndex == presentMonthIndex && currentYear == presentYear)
//
//	}
//}
