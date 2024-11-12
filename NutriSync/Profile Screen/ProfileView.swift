//
//  ProfileView.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit

class ProfileView: UIView {

    // COMPONENTS
    var profileLabel: UILabel!
    var profilePicture: UIImageView!
    var editProfilePictureButton: UIButton!
    var userNameLabel: UILabel!
    var userEmailLabel: UILabel!
    
    var accountSettingsLabel: UILabel!
    var changeUsernameEmailButton: UIButton!
    var buttonSeparator: UIView!
    var changePasswordButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupProfileLabel()
        setupProfilePicture()
        setupEditProfilePictureButton()
        setupUsernameLabel()
        setupUserEmailLabel()
        setupAccountSettingsLabel()
        setupChangeUsernameEmailButton()
        setupButtonSeparator()
        setupChangePasswordButton()
        initConstraints()
    }
    
    func setupProfileLabel() {
        profileLabel = UILabel()
        profileLabel.text = "Profile"
        profileLabel.font = UIFont.boldSystemFont(ofSize: 24)
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileLabel)
    }
    
    func setupProfilePicture(){
        profilePicture = UIImageView()
        profilePicture.contentMode = .scaleAspectFill
        profilePicture.clipsToBounds = true
        profilePicture.layer.cornerRadius = 50
        profilePicture.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profilePicture)
    }
    
   
    func setupEditProfilePictureButton() {
        editProfilePictureButton = UIButton(type: .system)
        editProfilePictureButton.setTitle("Change profile picture", for: .normal)
        editProfilePictureButton.showsMenuAsPrimaryAction = true
        editProfilePictureButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(editProfilePictureButton)
    }
    
    func setupUsernameLabel() {
        userNameLabel = UILabel()
        userNameLabel.text = "Dana Abdo"
        userNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(userNameLabel)
    }
    
    func setupUserEmailLabel() {
        userEmailLabel = UILabel()
        userEmailLabel.text = "danaabdo@gmail.com"
        userEmailLabel.font = UIFont.boldSystemFont(ofSize: 14)
        userEmailLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(userEmailLabel)
    }
    
    func setupAccountSettingsLabel() {
        accountSettingsLabel = UILabel()
        accountSettingsLabel.text = "Account"
        accountSettingsLabel.font = UIFont.boldSystemFont(ofSize: 24)
        accountSettingsLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(accountSettingsLabel)
    }
    
    func setupChangeUsernameEmailButton() {
        changeUsernameEmailButton = UIButton(type: .system)
        changeUsernameEmailButton.setTitle("Change username or email", for: .normal)
        changeUsernameEmailButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        changeUsernameEmailButton.setTitleColor(.black, for: .normal)
        changeUsernameEmailButton.contentHorizontalAlignment = .left
        changeUsernameEmailButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(changeUsernameEmailButton)
    }
    
    func setupButtonSeparator() {
        buttonSeparator = UIView()
        buttonSeparator.backgroundColor = .lightGray // Set the line color
        buttonSeparator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(buttonSeparator)
    }
    
    func setupChangePasswordButton() {
        changePasswordButton = UIButton(type: .system)
        changePasswordButton.setTitle("Change password", for: .normal)
        changePasswordButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        changePasswordButton.setTitleColor(.black, for: .normal)
        changePasswordButton.contentHorizontalAlignment = .left
        changePasswordButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(changePasswordButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            profileLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            profileLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            profilePicture.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 20),
            profilePicture.centerXAnchor.constraint(equalTo: centerXAnchor),
            profilePicture.widthAnchor.constraint(equalToConstant: 100),
            profilePicture.heightAnchor.constraint(equalToConstant: 100),
            
            editProfilePictureButton.topAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: 10),
            editProfilePictureButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            userNameLabel.topAnchor.constraint(equalTo: editProfilePictureButton.bottomAnchor, constant: 20),
            userNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            userEmailLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 4),
            userEmailLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            accountSettingsLabel.topAnchor.constraint(equalTo: userEmailLabel.bottomAnchor, constant: 32),
            accountSettingsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            changeUsernameEmailButton.topAnchor.constraint(equalTo: accountSettingsLabel.bottomAnchor, constant: 20),
            changeUsernameEmailButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            changeUsernameEmailButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            buttonSeparator.topAnchor.constraint(equalTo: changeUsernameEmailButton.bottomAnchor, constant: 8),
            buttonSeparator.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            buttonSeparator.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            buttonSeparator.heightAnchor.constraint(equalToConstant: 1),
            
            changePasswordButton.topAnchor.constraint(equalTo: changeUsernameEmailButton.bottomAnchor, constant: 16),
            changePasswordButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            changePasswordButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
