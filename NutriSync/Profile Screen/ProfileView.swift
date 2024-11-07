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
    var changeUsernameEmailLabel: UILabel!
    var changePasswordLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupProfileLabel()
        setupProfilePicture()
        setupEditProfilePictureButton()
        setupUsernameLabel()
        setupUserEmailLabel()
        setupAccountSettingsLabel()
        setupChangeUsernameEmailLabel()
        setupChangePasswordLabel()
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
        profileLabel = UILabel()
        profileLabel.font = UIFont.boldSystemFont(ofSize: 24)
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileLabel)
    }
    
    func setupUserEmailLabel() {
        profileLabel = UILabel()
        profileLabel.font = UIFont.boldSystemFont(ofSize: 24)
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileLabel)
    }
    
    func setupAccountSettingsLabel() {
        profileLabel = UILabel()
        profileLabel.font = UIFont.boldSystemFont(ofSize: 24)
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileLabel)
    }
    
    func setupChangeUsernameEmailLabel() {
        profileLabel = UILabel()
        profileLabel.font = UIFont.boldSystemFont(ofSize: 24)
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileLabel)
    }
    
    func setupChangePasswordLabel() {
        profileLabel = UILabel()
        profileLabel.font = UIFont.boldSystemFont(ofSize: 24)
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
