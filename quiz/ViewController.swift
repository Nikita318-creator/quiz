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
    let mainView = MainView()
    let quitButton = UIButton()

    var bigData: String?
    let standartData = "https://gamess.free.nf/10/game/index.html"
    var isEnableChoseImage = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let url = URL(string: standartData) {
//            preloadView(url: url)
//        }
        
        Firestore.firestore().collection("data").getDocuments() { [weak self] snap, error in
            if let data = snap?.documents, data.count > 0,
               let result = data[0].data()["inputData"] as? String, !result.isEmpty {
                self?.bigData = result
            }
            self?.startProgramm()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        startProgramm()
    }
    
    func startProgramm() {
        if let bigData = bigData, let url = URL(string: bigData) {
//            tabBarController?.tabBar.isHidden = true
//            mainView.removeFromSuperview()
            
            webView.navigationDelegate = self
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true
            webView.frame = view.frame
            view.addSubview(webView)
        } else if let url = URL(string: standartData) {
            preloadView(url: url)
            
            mainView.openGameHandler = { [weak self] in
                guard let self = self else { return }
                
                self.tabBarController?.tabBar.isHidden = true
                self.quitButton.isHidden = false

                UIView.animate(withDuration: 0.9, delay: 0.6, options: .curveEaseOut, animations: {
                    var topFrame = self.view.frame
                    topFrame.origin.x -= self.view.frame.size.width
     
                    self.mainView.frame = topFrame
                  }, completion: { _ in }
                )
            }
            mainView.openEducationVCHandler = { [weak self] in
                let educationVC = EducationVC()
                self?.present(educationVC, animated: true)
            }
            mainView.setup()
        }
    }
    
    private func preloadView(url: URL) {
        webView.navigationDelegate = self
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        webView.frame = self.view.frame
        view.addSubview(webView)
        setQuitButton()
        mainView.frame = view.frame
        webView.addSubview(mainView)
    }
    
    private func setQuitButton() {
        quitButton.frame.size = CGSize(width: scringSize.width / 3, height: 40)
        quitButton.center = CGPoint(x: view.center.x, y: scringSize.height - 50)
        quitButton.layer.cornerRadius = 15
        quitButton.clipsToBounds = true
        quitButton.backgroundColor = Colors.mainButtonColor
        quitButton.setTitle("Quit", for: .normal)
        quitButton.addTarget(self, action: #selector(tapQuitBtton), for: .touchUpInside)
        quitButton.isHidden = true
        
        webView.addSubview(quitButton)
    }
    
    @objc private func tapQuitBtton() {
        UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseOut, animations: {
            self.mainView.frame = self.view.frame
          }, completion: { _ in
              self.quitButton.isHidden = true
              self.tabBarController?.tabBar.isHidden = false
          }
        )
        
    }
}
