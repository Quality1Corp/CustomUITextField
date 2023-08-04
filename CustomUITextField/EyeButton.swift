//
//  EyeButton.swift
//  CustomUITextField
//
//  Created by MikhaiL on 04.08.2023.
//

import UIKit

// MARK: - EyeButton
final class EyeButton: UIButton {
    
    // MARK: - Init
    /// Дополнительных параметров не будет, поэтому переопределыем родительский инициализатор
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupEyeButton()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupEyeButton() {
        setImage(UIImage(systemName: "eye.slash"), for: .normal)
        tintColor = .black
        /// Задаем ширину для системного изображения
        widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        isEnabled = false // Выключаем кнопку по умолчанию
    }
}
