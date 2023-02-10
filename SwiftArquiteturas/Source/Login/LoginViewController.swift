//
//  LoginViewController.swift
//  SwiftArquiteturas
//
//  Created by Davi Capistrano on 09/02/23.
//

import UIKit

class LoginViewController: UIViewController {
    let presenter: LoginPresenter = LoginPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.delegate = self
    }

    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!

    @IBAction func openButtonTap(_ sender: Any) {
        if let email = emailTextField.text,
           let password = passwordTextField.text {

            let userModel = UserModel(email: email, password: password)
            presenter.login(userModel: userModel)
        }
    }
    @IBAction func registerButtonTap(_ sender: Any) {
        

    }
}

extension LoginViewController: LoginPresenterDelegate {
    func goHome() {
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        let home = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController

        home.modalPresentationStyle = .fullScreen
        self.present(home, animated: true)
    }

    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}
