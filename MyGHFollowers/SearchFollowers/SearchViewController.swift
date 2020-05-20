//
//  ViewController.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 13/12/1398AP.
//  Copyright © 1398 AP Amirreza Eghtedari. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    let logoImageView = UIImageView()
    let textField = AETextField()
    let callToActionButton = AEButton(backgroundColor: UIColor.systemGreen, text: "Get followers")
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = UIColor.secondarySystemBackground
        
        configLogoImageView()
        configTextField()
        configCallToActionButton()
        configDismissKeyboadTabGesture()
    }

    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.isNavigationBarHidden = true
//        navigationController?.navigationBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func actionButtonTapped() {
        pushFollowersListViewController()
    }
    
    var isUsernameEntered: Bool {
        return !textField.text!.isEmpty
    }
    
    func pushFollowersListViewController() {
        
        guard isUsernameEntered else {
            presentAEAlert(title: "Empty username!", message: "Enter a username to searh for its followers", buttonTitle: "OK")
            return
        }
        
		let followersListViewController = FollowersViewControllerComposer.makeModule()
        followersListViewController.username = textField.text
        followersListViewController.modalPresentationStyle = .automatic
        show(followersListViewController, sender: self)
    }
    
    func configDismissKeyboadTabGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(endEdit))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func endEdit() {
        view.endEditing(true)
    }
    
    func configLogoImageView() {
        
        view.addSubview(logoImageView)
        logoImageView.image = UIImage(named: "Logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configTextField() {
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            textField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        textField.delegate = self
    }
    
    func configCallToActionButton() {

        view.addSubview(callToActionButton)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            callToActionButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        callToActionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
}

extension SearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        pushFollowersListViewController()

        
        return true
    }
}
