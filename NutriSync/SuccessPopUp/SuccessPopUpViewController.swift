//
//  SuccessPopUpViewController.swift
//  NutriSync
//
//  Created by David Schaeffer on 11/23/24.
//

import UIKit

class SuccessPopUpViewController: UIViewController {
    private var successPopUpView: SuccessPopUpView!
    
    init() {
        super.init(nibName: "SuccessPopUpViewController", bundle: nil)
        self.modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        successPopUpView = SuccessPopUpView()
        view = successPopUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
}
