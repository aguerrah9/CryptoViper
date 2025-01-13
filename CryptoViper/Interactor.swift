//
//  Interactor.swift
//  CryptoViper
//
//  Created by Alejandro Guerra Hernandez on 10/01/25.
//

import Foundation

// Class, Protocol
// Talks to -> Presenter

protocol AnyInteractor {
    var presenter: AnyPresenter? {get set}
    
    func downloadCryptos()
}

class CryptoInteractor: AnyInteractor {
    var presenter: (any AnyPresenter)?
    
    func downloadCryptos() {
        guard let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21") else { return <#return value#> }
    }
    
    
}
