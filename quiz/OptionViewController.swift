//
//  OptionViewController.swift
//  quiz
//
//  Created by никита уваров on 19.11.23.
//

import UIKit

class OptionViewController: UIViewController {
    let scringSize = UIScreen.main.bounds
    let optionView = OptionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        optionView.frame = view.frame
        optionView.setup()
        view.addSubview(optionView)
    }
}
