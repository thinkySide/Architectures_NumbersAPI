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
    
    /// Target Event를 설정합니다.
    private func setupEvent() {
        numberView.button.addTarget(
            self,
            action: #selector(randomButtonTapped),
            for: .touchUpInside
        )
    }
}

// MARK: - Event

extension NumberViewController {
    
    /// 랜덤 버튼을 탭합니다.
    @objc private func randomButtonTapped() {
        Task {
            let result = await numbersAPIService.fetchAnswer()
            switch result {
                
            case .success(let answer):
                numberView.targetNumber.text = String(answer.number)
                numberView.content.text = answer.text
                
            case .failure(let failure): print(failure)
            }
        }
    }
}
