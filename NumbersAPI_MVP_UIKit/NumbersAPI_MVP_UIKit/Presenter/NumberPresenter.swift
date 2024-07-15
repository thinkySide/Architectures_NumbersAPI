//
//  NumberPresenter.swift
//  NumbersAPI_MVP_UIKit
//
//  Created by 김민준 on 7/15/24.
//

import Foundation

final class NumberPresenter {
    
    private weak var numberView: NumberViewInterface?
    private let numberService = NumbersService()
    
    /// 외부의 View를 주입 받기 위한 메서드
    func setupView(_ numberView: NumberViewInterface) {
        self.numberView = numberView
    }
}

// MARK: - Effect

extension NumberPresenter {
    
    /// 랜덤 넘버를 통해 답변을 생성합니다.
    /// UI 업데이트 작업이므로, MainActor
    @MainActor
    func createRandomNumberAnswer() {
        Task {
            let result = await numberService.fetchAnswer()
            switch result {
            case .success(let answer):
                self.numberView?.createRandomNumberAnswer(answer)
                
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
