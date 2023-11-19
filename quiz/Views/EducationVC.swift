//
//  EducationVC.swift
//  quiz
//
//  Created by никита уваров on 19.11.23.
//

import UIKit

class EducationVC: UIViewController {
    let PrivacyViewLabel = UILabel()
    let okBtton = UIButton()
    
    let scringSize = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rulesView = UIView()
        rulesView.frame = view.frame
        rulesView.backgroundColor = Colors.backgraundColor
        view.addSubview(rulesView)

        PrivacyViewLabel.frame.size = CGSize(width: scringSize.width / 1.2, height: scringSize.height / 2)
        PrivacyViewLabel.center = CGPoint(x: view.center.x, y: 200)
        PrivacyViewLabel.text = Strings.educationText
        PrivacyViewLabel.font = UIFont(name: "Helvetica Neue", size: 24)
        PrivacyViewLabel.numberOfLines = 0
        rulesView.addSubview(PrivacyViewLabel)

        okBtton.frame.size = CGSize(width: scringSize.width / 2, height: scringSize.width / 8)
        okBtton.center = CGPoint(x: view.center.x, y: scringSize.height - 150)
        okBtton.layer.cornerRadius = 23
        okBtton.clipsToBounds = true
        okBtton.backgroundColor = Colors.mainButtonColor
        okBtton.setTitle("OK", for: .normal)
        okBtton.addTarget(self, action: #selector(tapOKBtton), for: .touchUpInside)
        rulesView.addSubview(okBtton)
    }
    
    @objc func tapOKBtton() {
        UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveLinear, animations: {
            self.dismiss(animated: true)
        })
    }
}

