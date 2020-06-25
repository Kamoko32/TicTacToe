//
//  ViewController.swift
//  TicTacToe
//
//  Created by Kamil Gucik on 24/06/2020.
//  Copyright © 2020 Kamil Gucik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var button_1v1: UIButton! {
        didSet {
            button_1v1.layer.cornerRadius = 30
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        UINavigationBar.appearance().tintColor = .systemOrange
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

  
}

