//
//  Presenter.swift
//  CryptoViper
//
//  Created by Alejandro Guerra Hernandez on 10/01/25.
//

import Foundation

// Class, Protocol
// Talks to -> View, Interactor, Router

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    func interactorDidDownloadCrypto(result: Result<[Crypto],Error>)
}

class CryptoPresenter: AnyPresenter {
    var router: (any AnyRouter)?
    
    var interactor: (any AnyInteractor)?
    
    var view: (any AnyView)?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], any Error>) {
        switch result {
        case .success(let cryptos):
            //view update
            print("update")
        case .failure(let error):
            // view update error
            print("error")
        }
    }
    
    
}
