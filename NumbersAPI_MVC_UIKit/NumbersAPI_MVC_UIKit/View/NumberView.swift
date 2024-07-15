//
//  NumberView.swift
//  NumbersAPI_MVC_UIKit
//
//  Created by 김민준 on 7/15/24.
//

import UIKit

// MARK: - NumberView

final class NumberView: UIView {
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "버튼을 탭 해 랜덤 숫자에 대한\n정보를 확인해보세요!"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("RANDOM!", for: .normal)
        return button
    }()
    
    let content: UILabel = {
        let label = UILabel()
        label.text = "어떤 결과가 나올까요?"
        label.textColor = .red
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup UI

extension NumberView {
    
    private func setupUI() {
        backgroundColor = .white
    }
    
    private func setupAutoLayout() {
        [title, button, content]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -32),
            
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            
            content.centerXAnchor.constraint(equalTo: centerXAnchor),
            content.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 24),
            content.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 56),
            content.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -56),
        ])
    }
}
