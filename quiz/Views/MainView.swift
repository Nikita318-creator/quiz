//
//  MainView.swift
//  quiz
//
//  Created by никита уваров on 18.11.23.
//

import UIKit
import SnapKit

class MainView: UIView {
    let backgraundImageView = UIImageView()
    let topImageView = UIImageView()
    let startButton = UIButton()
    let topicsButton = UIButton()
    let educationButton = UIButton()
    let topicsView = TopicsView()

    let screengSize = UIScreen.main.bounds
    
    var openGameHandler: (() -> Void)?
    var openEducationVCHandler: (() -> Void)?
    
    func setup() {
        backgraundImageView.frame = frame
        backgraundImageView.image = UIImage(named: "1")
        addSubview(backgraundImageView)
        
        addSubview(topImageView)
        topImageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(screengSize.height / 3)
        }
        topImageView.image = UIImage(named: "2")
        
        addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalTo(topImageView.snp.bottom).offset(30)
            make.height.equalTo(60)
        }
        startButton.backgroundColor = Colors.mainButtonColor
        startButton.setTitle(Strings.startButton, for: .normal)
        startButton.layer.cornerRadius = 25
        startButton.clipsToBounds = true
        startButton.addTarget(self, action: #selector(tapStartButton), for: .touchUpInside)

        addSubview(topicsButton)
        topicsButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalTo(startButton.snp.bottom).offset(30)
            make.height.equalTo(60)
        }
        topicsButton.backgroundColor = Colors.mainButtonColor
        topicsButton.setTitle(Strings.topicsButton, for: .normal)
        topicsButton.layer.cornerRadius = 25
        topicsButton.clipsToBounds = true
        topicsButton.addTarget(self, action: #selector(tapTopicsButton), for: .touchUpInside)

        addSubview(educationButton)
        educationButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalTo(topicsButton.snp.bottom).offset(30)
            make.height.equalTo(60)
        }
        educationButton.backgroundColor = Colors.mainButtonColor
        educationButton.setTitle(Strings.educationButton, for: .normal)
        educationButton.layer.cornerRadius = 25
        educationButton.clipsToBounds = true
        educationButton.addTarget(self, action: #selector(tapEducationButton), for: .touchUpInside)
        
    }
    
    @objc private func tapStartButton() {
        openGameHandler?()
    }
    
    @objc private func tapTopicsButton() {
        topicsView.frame = frame
        topicsView.setup()
        addSubview(topicsView)
    }
    
    @objc private func tapEducationButton() {
        openEducationVCHandler?()
    }
}

