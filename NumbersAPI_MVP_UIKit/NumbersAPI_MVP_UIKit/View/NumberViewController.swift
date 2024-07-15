//
//  ViewController.swift
//  NumbersAPI_MVP_UIKit
//
//  Created by 김민준 on 7/15/24.
//

import UIKit

final class NumberViewController: UIViewController {
    
    private let numberView = NumberView()
    private let presenter = NumberPresenter()
    
    override func loadView() {
        view = numberView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setupView(self)
        setupEvent()
    }
}

// MARK: - Add Target

extension NumberViewController {
    
    /// Target Event를 설정합니다.
    private func setupEvent() {
        numberView.button.addTarget(
            self,
            action: #selector(randomButtonTapped),
            for: .touchUpInside
        )
    }
    
    /// 랜덤 버튼을 탭합니다.
    @objc private func randomButtonTapped() {
        presenter.createRandomNumberAnswer()
    }
}

// MARK: - NumberViewInterface

extension NumberViewController: NumberViewInterface {
    
    /// Delegate 메서드와 같은 방식임.
    /// 1. 버튼이 탭 됐을 때 presenter의 createRandomNumberAnswer가 호출됨.
    /// 2. Presenter는 해당 로직을 처리 후, 주입 받은 NumberView의 createRandomNumberAnswer 함수 호출
    /// 3. UI 업데이트
    func createRandomNumberAnswer(_ answer: Answer) {
        numberView.targetNumber.text = String(answer.number)
        numberView.content.text = answer.text
    }
}
