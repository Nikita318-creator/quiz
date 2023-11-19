//
//  TopicsView.swift
//  quiz
//
//  Created by никита уваров on 19.11.23.
//

import UIKit
import SnapKit

class TopicsView: UIView {
    let topImageView = UIImageView()
    let okBtton = UIButton()

    let screengSize = UIScreen.main.bounds
        
    func setup() {
        backgroundColor = Colors.topicsBackgraundColor
        
        okBtton.frame.size = CGSize(width: screengSize.width / 2, height: screengSize.width / 8)
        okBtton.center = CGPoint(x: center.x, y: screengSize.height - 150)
        okBtton.layer.cornerRadius = 23
        okBtton.clipsToBounds = true
        okBtton.backgroundColor = Colors.mainButtonColor
        okBtton.setTitle("OK", for: .normal)
        okBtton.addTarget(self, action: #selector(tapOKBtton), for: .touchUpInside)
        addSubview(okBtton)
        
        addSubview(topImageView)
        topImageView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.bottom.equalTo(okBtton.snp.top).inset(-100)
            make.top.equalToSuperview().inset(100)
        }
        topImageView.image = UIImage(named: "topics")
    }
    
    @objc func tapOKBtton() {
        UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveLinear, animations: {
            self.removeFromSuperview()
        })
    }
}

