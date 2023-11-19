//
//  OptionView.swift
//  quiz
//
//  Created by никита уваров on 19.11.23.
//

import UIKit
import SnapKit
import StoreKit

class OptionView: UIView {
    let backgraundImageView = UIImageView()
    let shareAppButton = UIButton()
    let rateUsButton = UIButton()
    let privacyPoliceButton = UIButton()

    let screengSize = UIScreen.main.bounds
    
//    var openGameHandler: (() -> Void)?
    
    func setup() {
        backgraundImageView.frame = frame
        backgraundImageView.image = UIImage(named: "1")
        addSubview(backgraundImageView)
        
        addSubview(shareAppButton)
        shareAppButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalToSuperview().offset(screengSize.height / 6)
            make.height.equalTo(60)
        }
        shareAppButton.backgroundColor = Colors.optionButtonColor
        shareAppButton.setTitle(Strings.shareAppButton, for: .normal)
        shareAppButton.layer.cornerRadius = 25
        shareAppButton.clipsToBounds = true
        shareAppButton.addTarget(self, action: #selector(tapShareAppButton), for: .touchUpInside)

        addSubview(rateUsButton)
        rateUsButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalTo(shareAppButton.snp.bottom).offset(30)
            make.height.equalTo(60)
        }
        rateUsButton.backgroundColor = Colors.optionButtonColor
        rateUsButton.setTitle(Strings.rateUsButton, for: .normal)
        rateUsButton.layer.cornerRadius = 25
        rateUsButton.clipsToBounds = true
        rateUsButton.addTarget(self, action: #selector(tapRateUsButton), for: .touchUpInside)

        addSubview(privacyPoliceButton)
        privacyPoliceButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalTo(rateUsButton.snp.bottom).offset(30)
            make.height.equalTo(60)
        }
        privacyPoliceButton.backgroundColor = Colors.optionButtonColor
        privacyPoliceButton.setTitle(Strings.privacyPoliceButton, for: .normal)
        privacyPoliceButton.layer.cornerRadius = 25
        privacyPoliceButton.clipsToBounds = true
        privacyPoliceButton.addTarget(self, action: #selector(tapPrivacyPoliceButton), for: .touchUpInside)
    }
    
    @objc private func tapShareAppButton() {
        
    }
    
    @objc private func tapRateUsButton() {
        SKStoreReviewController.requestReview()
    }
    
    @objc private func tapPrivacyPoliceButton() {

    }
}

