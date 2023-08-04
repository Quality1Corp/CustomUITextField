//
//  AuthViewController.swift
//  CustomUITextField
//
//  Created by MikhaiL on 04.08.2023.
//

import UIKit

// MARK: - AuthViewController
final class AuthViewController: UIViewController {
    
    // MARK: - Private Property
    private let registerTextField = RegisterTextField(
        placeholder: "Enter your password"
    )
    private let eyeButton = EyeButton()
    
    private var isPrivate = true
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Actions
    @objc private func displayBookMarks() {
        let imageName = isPrivate ? "eye" : "eye.slash"
        
        registerTextField.isSecureTextEntry.toggle()
        eyeButton.setImage(UIImage(systemName: imageName), for: .normal)
        isPrivate.toggle()
    }
}

// MARK: - Setting Views
private extension AuthViewController {
    func setupView() {
        view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        
        addSubviews()
        addAction()
        setupPasswordTF()
        setupLayout()
    }
}

// MARK: - Setting
private extension AuthViewController {
    func addSubviews() {
        view.addSubview(registerTextField)
    }
    
    func addAction() {
        eyeButton.addTarget(self, action: #selector(displayBookMarks), for: .touchUpInside)
    }
    
    func setupPasswordTF() {
        /// Реализовывать методы протокола UITextFieldDelegate будет класс AuthViewController, а вызывать эти методы будет UITextField
        registerTextField.delegate = self
        
        registerTextField.rightView = eyeButton
        /// В какой момент должно отображаться изображение - всегда:
        registerTextField.rightViewMode = .always
    }
}

// MARK: - Layout
private extension AuthViewController {
    func setupLayout() {
        registerTextField.translatesAutoresizingMaskIntoConstraints = false
        
        registerTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            .isActive = true
        registerTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            .isActive = true
        registerTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
            .isActive = true // -> Ширина текстового поля будет равна 80% от ширины супервью.
    }
}

extension AuthViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        /// Кнопка активна, если в ней есть текст
        eyeButton.isEnabled = !text.isEmpty
    }
}
