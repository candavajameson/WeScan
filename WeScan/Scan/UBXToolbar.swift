//
//  UBXToolbar.swift
//  WeScan
//
//  Created by Jameson Candava on 3/25/20.
//  Copyright © 2020 WeTransfer. All rights reserved.
//

import UIKit

@IBDesignable
public class UBXToolbar: UIView {
    
    @IBInspectable
    public var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    @IBInspectable
    public var buttonImage: UIImage? {
        didSet {
            if let mainButtonImage = buttonImage {
                mainButton.setImage(mainButtonImage, for: .normal)
            }
        }
    }
    
    lazy var mainButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(tapMainButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Action
    public var tappedMainButton: (()->Void)?
    
    @objc func tapMainButton() {
        self.tappedMainButton?()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        
        self.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        addSubview(mainButton)
        addSubview(titleLabel)
        
        var mainButtonConstraints = [NSLayoutConstraint]()
        var titleLabelConstraints = [NSLayoutConstraint]()
        
        mainButtonConstraints = [
            mainButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            mainButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            mainButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 20.0),
            mainButton.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        
        titleLabelConstraints = [
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: mainButton.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(mainButtonConstraints + titleLabelConstraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override public var intrinsicContentSize: CGSize {
        return CGSize(width: bounds.width, height: 80)
    }
    
    
}
