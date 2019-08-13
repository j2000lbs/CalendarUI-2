//
//  CalendarView.swift
//  CalendarUI-2
//
//  Created by Joel Ton on 8/11/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

class CalenderView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MonthViewDelegate {
	
	// MARK: - Property Definitions
	var numOfDaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
	var currentMonthIndex: Int = 0
	var currentYear: Int = 0
	var presentMonthIndex = 0
	var presentYear = 0
	var todaysDate = 0
	var firstDayOfMonth = 0   //(Sunday-Saturday 1-7)
	var previouslySelectedCellDate: String?
	
	let helpers = Helpers()
	
	let monthView: MonthView = {
		let view = MonthView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	let daysView: DaysView = {
		let view = DaysView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	let calendarCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		
		let calendarCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
		calendarCollectionView.showsHorizontalScrollIndicator = false
		calendarCollectionView.translatesAutoresizingMaskIntoConstraints = false
		calendarCollectionView.backgroundColor = UIColor.clear
		calendarCollectionView.allowsMultipleSelection = false
		return calendarCollectionView
	}()
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		initializeView()
	}
	
	convenience init(theme: LightThemes) {
		self.init()
		
		if theme == .dark {
			Style.darkTheme()
		} else {
			Style.lightTheme()
		}
		
		initializeView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	func changeTheme() {
		calendarCollectionView.reloadData()
		
		monthView.monthLabel.textColor = Style.monthViewLabelColor
		monthView.nextMonthButton.setTitleColor(Style.nextMonthButtonColor, for: .normal)
		monthView.previousMonthButton.setTitleColor(Style.previousMonthButtonColor,
													for: .normal)
		
		for i in 0..<7 {
			(daysView.daysStackView.subviews[i] as! UILabel).textColor =
				Style.dayNameLabelColor
		}
	}
	
	func initializeView() {
		currentMonthIndex = Calendar.current.component(.month, from: Date())
		currentYear = Calendar.current.component(.year, from: Date())
		todaysDate = Calendar.current.component(.day, from: Date())
		firstDayOfMonth=getFirstDayOfMonth()
		
		//for leap year, make february a month of 29 days
		if currentMonthIndex == 2 && helpers.isLeapYear(currentYear: currentYear) {
			numOfDaysInMonth[currentMonthIndex - 1] = 29
		}
		
		presentMonthIndex = currentMonthIndex
		presentYear = currentYear
		
		setupViews()
		
		calendarCollectionView.delegate=self
		calendarCollectionView.dataSource=self
		calendarCollectionView.register(CalendarViewCell.self,
								  forCellWithReuseIdentifier: "Cell")
	}
	
	func getFirstDayOfMonth() -> Int {
		let day =
			("\(currentMonthIndex)-01-\(currentYear)".date?.firstDayOfMonth.dayOfWeek)!
		return day
	}
	
	func didChange(month monthIndex: Int, year: Int) {
		currentMonthIndex = monthIndex + 1
		currentYear = year
		
		//for leap year, make february month of 29 days
		if monthIndex == 1 {
			if helpers.isLeapYear(currentYear: currentYear) {
				numOfDaysInMonth[monthIndex] = 29
			} else {
				numOfDaysInMonth[monthIndex] = 28
			}
		}
		
		firstDayOfMonth = getFirstDayOfMonth()
		
		calendarCollectionView.reloadData()
		
		monthView.previousMonthButton.isEnabled = !(currentMonthIndex == presentMonthIndex
			&& currentYear == presentYear)
	}
	
	func setupViews() {
		addSubview(monthView)
		monthView.topAnchor.constraint(equalTo: topAnchor).isActive = true
		monthView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
		monthView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
		monthView.heightAnchor.constraint(equalToConstant: 35).isActive = true
		monthView.delegate = self
		
		addSubview(daysView)
		daysView.topAnchor.constraint(equalTo: monthView.bottomAnchor).isActive = true
		daysView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
		daysView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
		daysView.heightAnchor.constraint(equalToConstant: 30).isActive = true
		
		addSubview(calendarCollectionView)
		calendarCollectionView.topAnchor.constraint(equalTo: daysView.bottomAnchor,
											  constant: 0).isActive = true
		calendarCollectionView.leftAnchor.constraint(equalTo: leftAnchor,
											   constant: 0).isActive = true
		calendarCollectionView.rightAnchor.constraint(equalTo: rightAnchor,
												constant: 0).isActive = true
		calendarCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
	}
	
	
	// MARK: - Delegate and Data Source methods
	func collectionView(_ collectionView: UICollectionView,
						numberOfItemsInSection section: Int) -> Int {
		return numOfDaysInMonth[currentMonthIndex - 1] + firstDayOfMonth - 1
	}
	
	func collectionView(_ collectionView: UICollectionView,
						cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",
												for: indexPath) as! CalendarViewCell
		cell.backgroundColor = UIColor.clear
		if indexPath.item <= firstDayOfMonth - 2 {
			cell.isHidden = true
		} else {
			let calculateDate = indexPath.row - firstDayOfMonth + 2
			cell.isHidden = false
			cell.dateLabel.text = "\(calculateDate)"
			if calculateDate < todaysDate && currentYear == presentYear &&
				currentMonthIndex == presentMonthIndex {
				cell.isUserInteractionEnabled = false
				cell.dateLabel.textColor = UIColor.lightGray
			} else {
				cell.isUserInteractionEnabled = true
				cell.dateLabel.textColor = Style.activeCellLabelColor
				/* The following if-statemet fixes the bug of a selected cell not having the correct background color after scrolling. */
				if cell.isSelected {
					cell.backgroundColor = Colors.nightSky
				}
				
			}
		}
		return cell
	}
	
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let cell = collectionView.cellForItem(at: indexPath)
		cell?.backgroundColor = Colors.nightSky
		let cellLabel = cell?.subviews[1] as! UILabel
		cellLabel.textColor = UIColor.white
	}
	
	func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
		let cell = collectionView.cellForItem(at: indexPath)
		cell?.backgroundColor = UIColor.clear
		let cellLabel = cell?.subviews[1] as! UILabel
		cellLabel.textColor = Style.activeCellLabelColor
	}
	
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		let width = collectionView.frame.width / 7 - 8
//*******	let height: CGFloat = collectionView.frame.height / 5	// was: = 40
		return CGSize(width: width, height: width)	// was: height: height
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 8.0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 8.0
	}
	
	
	
}
