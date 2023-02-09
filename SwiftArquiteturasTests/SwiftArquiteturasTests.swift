//
//  SwiftArquiteturasTests.swift
//  SwiftArquiteturasTests
//
//  Created by Davi Capistrano on 23/01/23.
//

import XCTest
@testable import SwiftArquiteturas

final class SwiftArquiteturasTests: XCTestCase {

    func testRegister() {
        var userModel = UserModel()

        let exp = expectation(description: "Check Login is sucessful")
        let manager = UserManager(business: UserBusiness())

        manager.register(email: "teste@teste.com",
                         password: "a12345") { userM in
            print(userM)
            userModel = userM
        } failureHandler: { error in
            print(error)
        }

        waitForExpectations(timeout: 30) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertEqual(userModel != nil, true)
        }
    }

//    func testLogin() throws{
//        let manager = UserManager(business: UserBusiness())
//
//        manager.login(email: "teste@teste.com", password: "a12345") { userModel in
//            print(userModel)
//        }   failureHandler: { error in
//            print(error)
//        }
//
//    }

}
