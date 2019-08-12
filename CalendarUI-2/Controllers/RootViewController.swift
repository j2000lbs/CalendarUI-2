//
//  RootViewController.swift
//  CalendarUI-2
//
//  Created by Joel Ton on 8/4/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
	
	var theme = LightThemes.dark
	var dayLabelOutlets: [UILabel] = []
	
	let calenderView: CalenderView = {
		let view = CalenderView(theme: LightThemes.dark)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = "Joel's Schedule"
		self.navigationController?.navigationBar.isTranslucent = false
		self.view.backgroundColor = Style.backgroundColor
		
		for label in dayLabelOutlets {
			label.textColor = Style.dayNameLabelColor
		}
			
			view.addSubview(calenderView)
			calenderView.topAnchor.constraint(equalTo: view.topAnchor,
											  constant: 10).isActive = true
			calenderView.rightAnchor.constraint(equalTo: view.rightAnchor,
												constant: -12).isActive = true
			calenderView.leftAnchor.constraint(equalTo: view.leftAnchor,
											   constant: 12).isActive = true
			calenderView.heightAnchor.constraint(equalToConstant: 365).isActive = true
			
			let rightBarButton = UIBarButtonItem(title: "Light",
												style: .plain,
												target: self,
												action: #selector(rightBarButtonAction))
			self.navigationItem.rightBarButtonItem = rightBarButton
		
	}
	
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		calenderView.calendarCollectionView.collectionViewLayout.invalidateLayout()
	}
	
	
	@objc func rightBarButtonAction(sender: UIBarButtonItem) {
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
		calenderView.changeTheme()
	}
}

