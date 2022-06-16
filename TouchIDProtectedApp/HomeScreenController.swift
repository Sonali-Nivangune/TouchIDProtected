//
//  HomeScreenController.swift
//  TouchIDProtectedApp
//
//  Created by Apple on 15/06/22.
//

import UIKit

class HomeScreenController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
