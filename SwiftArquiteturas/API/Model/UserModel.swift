//
//  UserModel.swift
//  SwiftArquiteturas
//
//  Created by Davi Capistrano on 18/12/22.
//

import Foundation

struct UserModel: Codable {
    let email: String
    let password: String

    init() {
        self.email = String()
        self.password = String()
    }

    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

//nossa class não possa ser utilizado pra colocar valores dentro dela
// a nao ser que para os iniciadores
