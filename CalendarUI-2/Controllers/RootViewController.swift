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
		//		calendarView.changeTheme()
	}
	
	
	@IBAction func previousMonth(_ sender: Any) {
		
	}
	
	
	@IBAction func nextMonth(_ sender: Any) {
		
	}
	
	
	
	var theme = LightThemes.dark

	override func viewDidLoad() {
		super.viewDidLoad()
		
		mainView.backgroundColor = Style.backgroundColor
		
		monthYearNameLabel.text = "Default Month Year Text"
		monthYearNameLabel.textColor = Style.monthViewLabelColor
		
		nextMonthButton.setTitleColor(Style.nextMonthButtonColor, for: .normal)
		nextMonthButton.setTitleColor(UIColor.lightGray, for: .disabled)
		
		previousMonthButton.setTitleColor(Style.previousMonthButtonColor, for: .normal)
		previousMonthButton.setTitleColor(UIColor.lightGray, for: .disabled)
		
		let dayLabelOutlets = [sundayLabel, mondayLabel, tuesdayLabel, wednesdayLabel,
							   thursdayLabel, fridayLabel, saturdayLabel]
		for label in dayLabelOutlets {
			label?.textColor = Style.dayNameLabelColor
		}
	}


}

