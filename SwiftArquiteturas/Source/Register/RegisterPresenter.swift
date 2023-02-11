//
//  RegisterPresenter.swift
//  SwiftArquiteturas
//
//  Created by Davi Capistrano on 11/02/23.
//

import Foundation

protocol RegisterPresenterDelegate {
    func showMessage(title: String, message: String)
    func goHome()
}

class RegisterPresenter {
    var delegate: RegisterPresenterDelegate?

    func register(userModel: UserModel){
        let manager = UserManager(business: UserBusiness())

        manager.register(email: userModel.email, password: userModel.password) {[weak self] model in
            self?.delegate?.goHome()
        } failureHandler: {[weak self] error in
            self?.delegate?.showMessage(title: "Erro", message: error!.localizedDescription)
        }

    }
}
