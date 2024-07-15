//
//  NumberViewController.swift
//  NumbersAPI_MVC_UIKit
//
//  Created by 김민준 on 7/15/24.
//

import UIKit

// MARK: - VC

final class NumberViewController: UIViewController {
    
    private let numberView = NumberView()
    private let numbersAPIService = NumbersAPIService()
    
    override func loadView() {
        view = numberView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupEvent()
    }
}

// MARK: - SetUp

extension NumberViewController {
    
    private func setupEvent() {
        numberView.button.addTarget(
            self,
            action: #selector(buttonTapped),
            for: .touchUpInside
        )
    }
}

// MARK: - Event

extension NumberViewController {
    
    @objc private func buttonTapped() {
        Task {
            let result = await numbersAPIService.fetchAnswer()
            switch result {
            case .success(let answer): numberView.content.text = answer.text
            case .failure(let failure): print(failure)
            }
        }
    }
}
