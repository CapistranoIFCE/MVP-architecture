//
//  RegisterViewController.swift
//  SwiftArquiteturas
//
//  Created by Davi Capistrano on 09/02/23.
//

import UIKit

class RegisterViewController: UIViewController {

    let presenter: RegisterPresenter = RegisterPresenter()

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmationPasswordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
    }

    @IBAction func registerButtonTap(_ sender: Any) {

        if let email = emailTextField.text,
           let password = passwordTextField.text,

           password == confirmationPasswordTextField.text {
            
            let userModel = UserModel(email: email, password: password)
            presenter.register(userModel: userModel)

        } else {
            showMessage(title: "Erro", message: "Nao confere")
        }
    }
    @IBAction func openButtonTap(_ sender: Any) {

    }
    
}

extension RegisterViewController: RegisterPresenterDelegate{
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }

    func goHome() {
        let home =
        self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        home.modalPresentationStyle = .fullScreen
        self.present(home, animated: true)
    }
}
