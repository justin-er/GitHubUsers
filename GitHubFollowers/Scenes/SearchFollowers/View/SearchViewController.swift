//
//  ViewController.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 13/12/1398AP.
//  Copyright © 1398 AP Amirreza Eghtedari. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
	let scrollView 			= UIScrollView(frame: .zero)
	let contentView			= UIView(frame: .zero)
    let logoImageView 		= UIImageView()
    let textField 			= AETextField()
    let callToActionButton 	= AEButton(backgroundColor: UIColor.systemGreen, text: "Get followers")
    
	var activeTextField: UITextField!
	
	let padding = CGFloat(16)
	
	let alerViewProvider: AlertViewControllerProvider
	
	init(alertViewProvider: AlertViewControllerProvider) {
		
		self.alerViewProvider		= alertViewProvider
		
		super.init(nibName: nil, bundle: nil)
		
		title = "Search"
        tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
        
        super.viewDidLoad()
		
		configViewController()
		configScrollView()
		configContentView()
        configLogoImageView()
        configTextField()
        configCallToActionButton()
        configDismissKeyboadTabGesture()
		registerForKeyboardNotifications()
    }

    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.isNavigationBarHidden = true
//        navigationController?.navigationBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
	
	func registerForKeyboardNotifications(){
		//Adding notifies on keyboard appearing
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIWindow.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIWindow.keyboardWillHideNotification, object: nil)
	}
	
	@objc
	func keyboardWillShow(notification: NSNotification) {
		
		guard let keyboareRect =  notification.userInfo?[UIWindow.keyboardFrameBeginUserInfoKey] as? CGRect else { return }
		let keyboardSize = keyboareRect.size
		
		let insets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
		scrollView.contentInset = insets
		scrollView.scrollIndicatorInsets = insets
		
		var aRect = self.view.frame
		aRect.size.height -= keyboardSize.height
		
		guard let activeTextField = self.activeTextField else { return }
		
		if !aRect.contains(activeTextField.frame.origin) {
			scrollView.scrollRectToVisible(activeTextField.frame, animated: true)
		}
	}
	
	@objc
	func keyboardWillHide(notification: NSNotification) {
		
		scrollView.contentInset = UIEdgeInsets.zero
		scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
	}

    @objc func actionButtonTapped() {
        pushFollowersListViewController()
    }
    
    var isUsernameEntered: Bool {
        return !textField.text!.isEmpty
    }
    
    func pushFollowersListViewController() {
        
        guard isUsernameEntered else {
	
			DispatchQueue.main.async {
				
				self.alerViewProvider.showAlert(presentingViewController: self,
				title: "Empty username!",
				message: "Enter a username to searh for its followers", bottonTitle: "OK")
			}
			
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
	
	private func configViewController() {
		
		view.backgroundColor = UIColor.secondarySystemBackground
	}
	
	func configScrollView() {
		
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(scrollView)
		NSLayoutConstraint.activate([
			scrollView.topAnchor.constraint(equalTo: view.topAnchor),
			scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
		])
	}
	
	func configContentView() {

		scrollView.addSubview(contentView)
		contentView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
			contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
			contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
			contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
		])
	}
    
    func configLogoImageView() {
        
        contentView.addSubview(logoImageView)
        logoImageView.image = UIImage(named: "Logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
			logoImageView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 80),
			logoImageView.centerXAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configTextField() {
        contentView.addSubview(textField)
		textField.text = "sallen0400"
		textField.isUserInteractionEnabled = true
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 100),
			textField.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: padding),
			textField.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -padding),
            textField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        textField.delegate = self
    }
    
    func configCallToActionButton() {

        contentView.addSubview(callToActionButton)
        
        NSLayoutConstraint.activate([
			callToActionButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 50),
			callToActionButton.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: padding),
			callToActionButton.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -padding),
			callToActionButton.heightAnchor.constraint(equalToConstant: 50),
			callToActionButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
            
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
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		activeTextField = textField
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		activeTextField = nil
	}
}
