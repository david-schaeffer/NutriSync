//
//  ArticleViewController.swift
//  NutriSync
//
//  Created by Dana Abdo on 11/5/24.
//

import UIKit

class ArticleViewController: UIViewController {

    var articleView: ArticleView!

    override func loadView() {
        self.articleView = ArticleView()
        view = articleView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   


}
