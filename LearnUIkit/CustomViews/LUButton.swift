//
//  LUButton.swift
//  LearnUIkit
//
//  Created by Yatrik N on 04/02/24.
//

import UIKit

class LUButton: UIButton {
    override init(frame: CGRect) {
        // inherite all the default behavior of UIButton
        super.init(frame: frame)
        // custom code
        configure()
    }
    
    // this method execute when this button initialsed through storyboard
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 10
        layer.masksToBounds = true
        titleLabel?.textColor = .white
        // built-in text font which adopt dynamic type(size)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        // enable auto layout
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
