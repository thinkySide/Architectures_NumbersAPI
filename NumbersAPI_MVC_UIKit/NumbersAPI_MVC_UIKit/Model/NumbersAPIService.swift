//
//  NumbersAPI.swift
//  NumbersAPI_MVC_UIKit
//
//  Created by 김민준 on 7/15/24.
//

import Foundation

// MARK: - Service

struct NumbersAPIService {
    
    /// 네트워크 에러 열거형
    enum NetworkError: Error {
        case noURL
        case urlSessionFailed
        case decodeFailed
        case unknownError
    }
    
    /// 랜덤 숫자를 통해 답변을 반환합니다.
    func fetchAnswer() async -> Result<Answer, NetworkError> {
        do {
            let (data, _) = try await requestData(url())
            let answer = try decodeData(data)
            return .success(answer)
        } catch {
            guard let networkError = error as? NetworkError
            else { return .failure(.unknownError) }
            return .failure(networkError)
        }
    }
}

// MARK: - Helper

extension NumbersAPIService {
    
    /// 랜덤 숫자를 반환합니다.
    private var randomNumber: Int {
        return (0...100).randomElement() ?? 0
    }
    
    /// 랜덤 숫자를 통한 URL을 반환합니다.
    private func url() throws ->  URL {
        let urlString = "http://numbersapi.com/\(randomNumber)?json"
        if let url = URL(string: urlString) {
            return url
        } else {
            throw NetworkError.noURL
        }
    }
    
    /// URLSession을 이용해 Data를 요청합니다.
    private func requestData(_ url: URL) async throws -> (Data, URLResponse) {
        do {
            return try await URLSession.shared.data(from: url)
        } catch {
            throw NetworkError.urlSessionFailed
        }
    }
    
    /// Answer 데이터로 디코딩합니다.
    private func decodeData(_ data: Data) throws -> Answer {
        do {
            let decodeData = try JSONDecoder().decode(NumbersDTO.self, from: data)
            return decodeData.toAnswer
        } catch {
            throw NetworkError.decodeFailed
        }
    }
}
