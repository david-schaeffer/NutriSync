//
//  LoadingViewController.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit

class LoadingViewController: UIViewController {
    
    var loadingView: LoadingView!
    
    override func loadView() {
        self.loadingView = LoadingView()
        view = loadingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create and add the LoadingView
        loadingView.factLabel.text = "Omega-3 fatty acids found in fish are known to reduce symptoms of depression and anxiety."
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

