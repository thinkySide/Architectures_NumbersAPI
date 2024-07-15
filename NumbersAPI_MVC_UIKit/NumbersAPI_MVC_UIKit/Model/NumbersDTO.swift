//
//  NumbersDTO.swift
//  NumbersAPI_MVC_UIKit
//
//  Created by 김민준 on 7/15/24.
//

import Foundation

struct NumbersDTO: Codable {
    let text: String
    let number: Int
    let found: Bool
    let type: String
    
    /// Answer Entity로 변환합니다.
    var toAnswer: Answer {
        return Answer(
            number: self.number,
            text: self.text
        )
    }
}
