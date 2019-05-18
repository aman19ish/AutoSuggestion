//
//  BaseViewController.swift
//  MapMyIndiaProject
//
//  Created by Aman gupta on 16/05/19.
//  Copyright © 2019 Aman Gupta. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - Outlets
    
    // MARK: - View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Setup View Controller
    
    // MARK: - ALerts
    func showAlert(messageTitle: String = kAppTitle, messageText: String, actionTitle: String = kOk,  handler:@escaping () -> Void) {
        let alert = UIAlertController(title: kAppTitle, message: messageText, preferredStyle: .alert)
        let okAction =  UIAlertAction(title: actionTitle, style: .default) { (action) -> Void in
            return handler()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showOkAlert(messageTitle: String = kAppTitle, messageText: String, actionTitle: String = kOk) {
        let alert = UIAlertController(title: kAppTitle, message: messageText, preferredStyle: .alert)
        let okAction =  UIAlertAction(title: actionTitle, style: .default) { (action) -> Void in
            return
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

}
