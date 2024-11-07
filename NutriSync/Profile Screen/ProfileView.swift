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
    var profilePicture: UIImage!
    var editProfilePictureButton: UIButton!
    var userNameLabel: UILabel!
    var userEmailLabel: UILabel!
    
    var accountSettingsLabel: UILabel!
    var changeUsernameEmailButton: UIButton!
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
        setupChangePasswordButton()
    }
    
    func setupProfileLabel() {
        profileLabel = UILabel()
        profileLabel.text = "Profile"
        profileLabel.font = UIFont.boldSystemFont(ofSize: 24)
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileLabel)
    }
    
    func setupProfilePicture() {
        profilePicture = UIImage(named: "profilePicture"), for: .normal
        profilePicture.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profilePicture)
    }
    
    func setupEditProfilePictureButton() {
        editProfilePictureButton = UIButton()
        editProfilePictureButton.setTitle("Change profile picture", for: .normal)
        editProfilePictureButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        editProfilePictureButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(editProfilePictureButton)
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
        accountSettingsLabel.font = UIFont.boldSystemFont(ofSize: 24)
        accountSettingsLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(accountSettingsLabel)
    }
    
    func setupChangeUsernameEmailButton() {
        changeUsernameEmailButton = UIButton()
        changeUsernameEmailButton.setTitle("Change username or email", for: .normal)
        changeUsernameEmailButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        changeUsernameEmailButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(changeUsernameEmailButton)
    }
    
    func setupChangePasswordButton() {
        changePasswordButton = UIButton()
        changePasswordButton.setTitle("Change password", for: .normal)
        changePasswordButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        changePasswordButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(changePasswordButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
