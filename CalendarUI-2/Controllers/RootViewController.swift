//
//  RootViewController.swift
//  CalendarUI-2
//
//  Created by Joel Ton on 8/4/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
	
	@IBOutlet var mainView: UIView!
	@IBOutlet var calendarCollectionView: UICollectionView!
	@IBOutlet weak var nextMonthButton: UIButton!
	@IBOutlet weak var previousMonthButton: UIButton!
	@IBOutlet weak var monthYearNameLabel: UILabel!
	
	// Day label outlets
	@IBOutlet weak var sundayLabel: UILabel!
	@IBOutlet weak var mondayLabel: UILabel!
	@IBOutlet weak var tuesdayLabel: UILabel!
	@IBOutlet weak var wednesdayLabel: UILabel!
	@IBOutlet weak var thursdayLabel: UILabel!
	@IBOutlet weak var fridayLabel: UILabel!
	@IBOutlet weak var saturdayLabel: UILabel!
	

	var month: Month!
	
	var lightThemeHelper = LightThemeHelpers()
	
	/* Month is initializing here before the window loads and the initializations requires access to the window */
//	var month: Month {
//		get {
//			return Month(calendarCollectionView: calendarCollectionView)
//		}
//	}
	
	var theme = LightThemes.dark
	var dayLabelOutlets: [UILabel] = []
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		mainView.backgroundColor = Style.backgroundColor
		
		monthYearNameLabel.textColor = Style.monthViewLabelColor
		
		nextMonthButton.setTitleColor(Style.nextMonthButtonColor, for: .normal)
		nextMonthButton.setTitleColor(UIColor.lightGray, for: .disabled)
		
		previousMonthButton.setTitleColor(Style.previousMonthButtonColor, for: .normal)
		previousMonthButton.setTitleColor(UIColor.lightGray, for: .disabled)
		
		dayLabelOutlets = [sundayLabel, mondayLabel, tuesdayLabel, wednesdayLabel,
							   thursdayLabel, fridayLabel, saturdayLabel]
		for label in dayLabelOutlets {
			label.textColor = Style.dayNameLabelColor
		}
		
		
		calendarCollectionView.delegate = month
		calendarCollectionView.dataSource = month
	}
	
	
	@IBAction func lightThemeButton(_ sender: UIBarButtonItem) {
		if theme == .dark {
			sender.title = "Dark"
			theme = .light
			Style.lightTheme()
		} else {
			sender.title = "Light"
			theme = .dark
			Style.darkTheme()
		}
		self.view.backgroundColor = Style.backgroundColor
		lightThemeHelper.changeTheme(calendarCollectionView: calendarCollectionView,
									 monthYearNameLabel: monthYearNameLabel,
									 nextMonthButton: nextMonthButton,
									 previousMonthButton: previousMonthButton)
	}
	
	
	@IBAction func previousMonth(_ sender: Any) {
		
		/*  Need to add isEnabled = false when this has been used once */
		month.currentMonthIndex -= 1
		if month.currentMonthIndex < 0 {
			month.currentMonthIndex = 11
			month.currentYear -= 1
		}
		makeChanges(currentMonthIndex: month.currentMonthIndex,
					currentYear: month.currentYear)
		
		// MARK: - Delete these if the above method works.
//		monthYearNameLabel.text="\(month.monthNames[month.currentMonthIndex]) \(month.currentYear)"
//		month.delegate?.didChange(month: month.currentMonthIndex, year: month.currentYear)
	}
	
	
	@IBAction func nextMonth(_ sender: Any) {
		
		/* Need to add isEnabled = false when prior to the 14th of a month */
		month.currentMonthIndex += 1
		if month.currentMonthIndex > 11 {
			month.currentMonthIndex = 0
			month.currentYear += 1
		}
		makeChanges(currentMonthIndex: month.currentMonthIndex,
					currentYear: month.currentYear)
		
		// MARK: - Delete these if the above method works.
//		monthYearNameLabel.text="\(month.monthNames[month.currentMonthIndex]) \(month.currentYear)"
//		month.delegate?.didChange(month: month.currentMonthIndex, year: month.currentYear)
	}
	
	func makeChanges(currentMonthIndex: Int, currentYear: Int) {
		monthYearNameLabel.text="\(month.monthNames[month.currentMonthIndex]) \(month.currentYear)"
		month.didChange(month: month.currentMonthIndex, year: month.currentYear)
	}
	
	



}

