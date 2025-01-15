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
        guard let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/IA32-CryptoComposeData/main/cryptolist.json") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            print("data",data as Any,"response",response as Any,"error",error as Any)
            
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.NetworkFailed))
                return
            }
            do{
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                self?.presenter?.interactorDidDownloadCrypto(result: .success(cryptos))
            } catch {
                self?.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.ParsingFailed))
            }
        }
        task.resume()
    }
    
}
