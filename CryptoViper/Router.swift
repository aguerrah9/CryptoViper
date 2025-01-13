//
//  Router.swift
//  CryptoViper
//
//  Created by Alejandro Guerra Hernandez on 10/01/25.
//

import Foundation

// Class, Protocol
// Entry Point

protocol AnyRouter {
    static func startExecution() -> AnyRouter
}

class CrypoRouter: AnyRouter {
    static func startExecution() -> any AnyRouter {
        let router = CrypoRouter()
        return router
    }
}
