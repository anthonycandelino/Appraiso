//
//  AuthUtils.swift
//  Appraiso
//
//  Created by Anthony Candelino on 2024-12-12.
//

import Foundation
import FirebaseAuth

func createAccount(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
        if let error = error {
            completion(.failure(error))
        } else if let user = authResult?.user {
            completion(.success(user))
        }
    }
}

func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
        if let error = error {
            completion(.failure(error))
        } else if let user = authResult?.user {
            completion(.success(user))
        }
    }
}

func logout(completion: @escaping (Result<Void, Error>) -> Void) {
    do {
        try Auth.auth().signOut()
        completion(.success(()))
    } catch let signOutError as NSError {
        completion(.failure(signOutError))
    }
}
