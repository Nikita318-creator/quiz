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
        optionView.openActivityVCHandler = { [weak self] in
            let shareVC = UIActivityViewController(activityItems: [Strings.shareText], applicationActivities: nil)
            self?.present(shareVC, animated: true)
        }
        optionView.openPrivacyVCHandler = { [weak self] in
            let privacyVC = PrivacyViewController()
            self?.present(privacyVC, animated: true)
        }
        view.addSubview(optionView)
    }
}
