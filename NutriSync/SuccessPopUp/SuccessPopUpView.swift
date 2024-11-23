//
//  SuccessPopUpView.swift
//  NutriSync
//
//  Created by David Schaeffer on 11/23/24.
//

import UIKit

class SuccessPopUpView: UIView {
    var backgroundView: UIView!
    var stackView: UIStackView!
    var successLabel: UILabel!
    var successImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        
        setupBackground()
        setupLabel()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBackground() {
        backgroundView = UIView()
        backgroundView.backgroundColor = .black.withAlphaComponent(0.2)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundView)
    }
    
    private func setupLabel() {
        successLabel = UILabel()
        successLabel.text = "Success!"
        successLabel.font = .boldSystemFont(ofSize: 24)
        successLabel.textColor = .black
        successLabel.textAlignment = .center
        successLabel.translatesAutoresizingMaskIntoConstraints = false
        
        successImage = UIImageView(image: UIImage(systemName: "checkmark.circle"))
        successImage.tintColor = .systemGreen
        successImage.contentMode = .scaleAspectFit
        successImage.translatesAutoresizingMaskIntoConstraints = false
        
        stackView = UIStackView(arrangedSubviews: [successImage, successLabel])
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.axis = .vertical
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.backgroundColor = .white
        stackView.layer.masksToBounds = true
        stackView.layer.cornerRadius = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.widthAnchor.constraint(equalTo: widthAnchor),
            backgroundView.heightAnchor.constraint(equalTo: heightAnchor),
            
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}
