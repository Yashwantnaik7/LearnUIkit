//
//  UIViewController+Extension.swift
//  LearnUIkit
//
//  Created by Yatrik N on 04/02/24.
//

import UIKit

extension UIViewController {
    func presentLUAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = LUAlertVC(alertTitle: title, message: message, buttontitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
