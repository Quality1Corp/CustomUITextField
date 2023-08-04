//
//  RegisterTextField.swift
//  CustomUITextField
//
//  Created by MikhaiL on 04.08.2023.
//

import UIKit

// MARK: - RegisterTextField
final class RegisterTextField: UITextField {
    
    // MARK: - Private Property
    private let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 40)
    
    // MARK: - Init
    init(placeholder: String) {
        super.init(frame: .zero)
        // Вызываем метод при инициализации кастомного класса.
        setupTextField(placeholder: placeholder)
    }
    
    @available(*, unavailable) // -> НЕ ИСПОЛЬЗУЕМ.
    
    // Инициализатор coder: отностится к storyboard
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override Methods
    /// Настраиваем размещение текстового поля внесенного пользователем
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        /// Настраиваем новые размеры прямоугольника TF
        bounds.inset(by: padding)
    }
    /// Размещение плейсхолдера:
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    /// Размещение уже отредактированного текста
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    // MARK: - Private Methods
    private func setupTextField(placeholder: String) {
        textColor = .black
        
        layer.cornerRadius = 10
        layer.backgroundColor = #colorLiteral(red: 0.8891640306, green: 0.9637838006, blue: 0, alpha: 1)
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 15, height: 15)
        
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.3)])
        font = .boldSystemFont(ofSize: 18)
        
        isSecureTextEntry = true
        
        heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
