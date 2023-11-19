//
//  ViewController.swift
//  quiz
//
//  Created by никита уваров on 18.11.23.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase
import FirebaseCore
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    let scringSize = UIScreen.main.bounds
    var webView = WKWebView()
    
    var bigData: String?
    let standartData = "https://gamess.free.nf/10/game/index.html"
    var isEnableChoseImage = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Firestore.firestore().collection("data").getDocuments() { [weak self] snap, error in
            if let data = snap?.documents, data.count > 0 {
                self?.bigData = data[0].data()["inputData"] as? String
                self?.startProgramm()
            } else {
                self?.startProgramm()
            }
        }
    }
    
    func startProgramm() {
        if let bigData = bigData, let url = URL(string: bigData) {
            webView.navigationDelegate = self
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true
            webView.frame = view.frame
            view.addSubview(webView)
        } else if let url = URL(string: standartData) {
            let mainView = MainView(frame: view.frame)
            mainView.openGameHandler = { [weak self] in
                guard let self = self else { return }
                
                self.tabBarController?.tabBar.isHidden = true

                self.webView.navigationDelegate = self
                self.webView.load(URLRequest(url: url))
                self.webView.allowsBackForwardNavigationGestures = true
                self.webView.frame = self.view.frame
                self.setQuitButton()
                self.view.addSubview(self.webView)
            }
            mainView.setup()
            view.addSubview(mainView)
            

        }
    }
    
    private func setQuitButton() {
        let quitButton = UIButton()
        quitButton.frame.size = CGSize(width: scringSize.width / 3, height: 40)
        quitButton.center = CGPoint(x: view.center.x, y: scringSize.height - 50)
        quitButton.layer.cornerRadius = 15
        quitButton.clipsToBounds = true
        quitButton.backgroundColor = UIColor(red: 30 / 255, green: 34 / 255, blue: 85 / 255, alpha: 1)
        quitButton.setTitle("Quit", for: .normal)
        quitButton.addTarget(self, action: #selector(tapQuitBtton), for: .touchUpInside)
        
        webView.addSubview(quitButton)
    }
    
    @objc private func tapQuitBtton() {
        webView.removeFromSuperview()
        self.tabBarController?.tabBar.isHidden = false
    }
}
