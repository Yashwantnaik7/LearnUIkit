//
//  SearchVC.swift
//  LearnUIkit
//
//  Created by Yatrik N on 04/02/24.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let searchTextField = LUTextField()
    let callToActionButton = LUButton(backgroundColor: .systemGreen, title: "Search")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // configuration
        configureImageView()
        configureTextField()
        configureActionButton()
        createDismissKeyboardTapGesture()
        
        // delegates
        searchTextField.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: Actions
    
    var isUserNameEntered : Bool {
        return !searchTextField.text!.isEmpty
    }
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc
    func pushFollowerListVC() {
        
        guard isUserNameEntered else {
            presentLUAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need to know who to look for 😃.", buttonTitle: "Ok")
            return
        }
        
        let followerListVC = FollowerListVC()
        followerListVC.username = searchTextField.text
        followerListVC.title = searchTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    //MARK: UI
    
    func configureImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "GitHub-logo")
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 320),
            logoImageView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    func configureTextField() {
        view.addSubview(searchTextField)
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            searchTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureActionButton() {
        view.addSubview(callToActionButton)
        
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
