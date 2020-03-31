//
//  ViewController.swift
//  CustomControlsTest
//
//  Created by Amirreza Eghtedari on 6/1/1399AP.
//  Copyright © 1399 AP Amirreza Eghtedari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var doSomethingButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        configAETitleLabel()
//        configAEBodyLabel()
    }

    @IBAction func doSomethingTapped(_ sender: Any) {
        
        configAEAlertViewController()
//        configAlert()
//        configActionSheet()
//        configPopoverAEAlert()
    }
    
    func configPopoverAEAlert() {
        
        let aeAlert = AEAlertViewController(title: "Delete", message: "Delete something important", buttonTitle: "Delete")
        aeAlert.modalPresentationStyle = .popover
        
        if let popover = aeAlert.popoverPresentationController {
            popover.sourceView = doSomethingButton
        }
        
        present(aeAlert, animated: true)
    }
    
    func configAlert() {
        let alert = UIAlertController(title: "Delete account?", message: "Are you sure to delete account?", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: nil)
        alert.addAction(deleteAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel done")
        }
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func configActionSheet() {
        let alert = UIAlertController(title: "Delete account?", message: "Are you sure to delete account?", preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: nil)
        alert.addAction(deleteAction)
        let archiveAction = UIAlertAction(title: "Archive", style: .default)
        alert.addAction(archiveAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel done")
        }
        alert.addAction(cancelAction)
        
        if let popover = alert.popoverPresentationController {
            popover.sourceView = doSomethingButton
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    func configAETitleLabel() {
        
        let aeTitleLabel = AETitleLabel(textAlignment: .center, fontSize: 18)
        aeTitleLabel.text = "Salam Amir, Wie geht's?"
        view.addSubview(aeTitleLabel)
        NSLayoutConstraint.activate([
            aeTitleLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 100),
            aeTitleLabel.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            aeTitleLabel.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor)
        ])
        
        let aeTitleLabel2 = AETitleLabel(textAlignment: .center, fontSize: 18)
        aeTitleLabel2.text = "Salam Amir, Wie geht's? Wie alt bist du? Wann treffen Sie die Faru?"
        view.addSubview(aeTitleLabel2)
        NSLayoutConstraint.activate([
            aeTitleLabel2.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 150),
            aeTitleLabel2.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            aeTitleLabel2.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor)
        ])
    }

    func configAEBodyLabel() {
        
        let aeBodyLabel = AEBodyLabel(textAlignment: .left)
        aeBodyLabel.numberOfLines = 3
        aeBodyLabel.text = "Salam Amir, Wie geht's? Wie alt bist du? Wann treffen Sie die Faru?, Salam Amir, Wie geht's? Wie alt bist du? Wann treffen Sie die Faru? Salam Amir, Wie geht's? Wie alt bist du? Wann treffen Sie die Faru?, Salam Amir, Wie geht's? Wie alt bist du? Wann treffen Sie die Faru?"
        view.addSubview(aeBodyLabel)
        NSLayoutConstraint.activate([
            aeBodyLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 200),
            aeBodyLabel.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            aeBodyLabel.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor)
        ])
    }
    
    func configAEAlertViewController() {
        presentAEAlert(title: "Something went wrong", message: "Bad news, there is something wrong with your doings!", buttonTitle: "OK")
    }
}

