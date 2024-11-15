//
//  LoadingView.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit
class LoadingView: UIView {
    
    // COMPONENTS
    var brandLabel: UILabel!
    var factLabel: UILabel!
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupBrandLabel()
        setupFactLabel()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBrandLabel() {
        brandLabel = UILabel()
        brandLabel.text = "NutriSync"
        brandLabel.font = UIFont.boldSystemFont(ofSize: 12)
        brandLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(brandLabel)
    }
    
    func setupFactLabel() {
        factLabel = UILabel()
        factLabel.text = "Omega-3 fatty acids found in fish are known to reduce symptoms of depression and anxiety"
        factLabel.font = UIFont.systemFont(ofSize: 24)
        factLabel.textAlignment = .center
        factLabel.numberOfLines = 0
        factLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(factLabel)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            // Center the fact label in the view
            factLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            factLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -20),
            factLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            factLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            // Position the brand label below the fact label
            brandLabel.topAnchor.constraint(equalTo: factLabel.bottomAnchor, constant: 20),
            brandLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

