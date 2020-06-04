//
//  AEAlertViewController.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 7/1/1399AP.
//  Copyright © 1399 AP Amirreza Eghtedari. All rights reserved.
//

import UIKit

class AEAlertViewController: UIViewController {

    let containerView = UIView()
    let alertTitle = AETitleLabel(textAlignment: .center, fontSize: 18)
    let alertMessage = AEBodyLabel(textAlignment: .center)
    let alertActionButton = AEButton(backgroundColor: UIColor.systemPink, text: "OK")
    
    let padding: CGFloat = 16
    
    init(title: String, message: String, buttonTitle: String) {
        
        super.init(nibName: nil, bundle: nil)

        alertTitle.text = title
        alertMessage.text = message
        alertActionButton.setTitle(buttonTitle, for: .normal)
        
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
        view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.75)
    }
    
    @objc func actionHandler() {
        dismiss(animated: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configContainerView()
    }
    
    func configContainerView() {
        
        view.addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.backgroundColor = UIColor.systemBackground
        
        NSLayoutConstraint.activate(
            [
                containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                containerView.widthAnchor.constraint(equalToConstant: 280),
                containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        configAlertTitle()
        configAlertActionButton()
        configAlertMessage()
    }
    
    func configAlertTitle() {
        
        containerView.addSubview(alertTitle)
        
        NSLayoutConstraint.activate([
            alertTitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            alertTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            alertTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            alertTitle.heightAnchor.constraint(equalToConstant: 28)
        ])
        
    }
    
    func configAlertMessage() {
            
        alertMessage.numberOfLines = 0
        containerView.addSubview(alertMessage)
        
        NSLayoutConstraint.activate([
            alertMessage.topAnchor.constraint(equalTo: alertTitle.bottomAnchor, constant: padding),
            alertMessage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            alertMessage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            alertMessage.bottomAnchor.constraint(equalTo: alertActionButton.topAnchor, constant: -padding)
        ])
    }
    
    func configAlertActionButton() {
        
        containerView.addSubview(alertActionButton)
        alertActionButton.addTarget(self, action: #selector(actionHandler), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            alertActionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            alertActionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            alertActionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            alertActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
