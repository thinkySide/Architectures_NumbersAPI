//
//  NumberViewController.swift
//  NumbersAPI_MVC_UIKit
//
//  Created by 김민준 on 7/15/24.
//

import UIKit

final class NumberViewController: UIViewController {
    
    private let numberView = NumberView()
    
    override func loadView() {
        view = numberView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
