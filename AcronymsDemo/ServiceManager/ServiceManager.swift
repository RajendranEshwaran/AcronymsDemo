//
//  ServiceManager.swift
//  AcronymsDemo
//
//  Created by Rajendran Eshwaran on 2/10/22.
//

import Foundation

enum NetworkErrors:Error{
    case urlError
    case noResponseError
    case decorderError
    case unKnownError
}
class ServiceManager{    
    func getAcronymsDataFromService(completion:@escaping ([AcronmymsModel]) -> ()) {
        guard let url = URL.getUrl() else { return print(NetworkErrors.urlError) }
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    let decodedData = try JSONDecoder().decode(AcronmymsModel.self, from: todoData)
                    completion([decodedData])
                } else {
                    print(NetworkErrors.decorderError)
                }
            } catch {
                print(NetworkErrors.noResponseError)
            }
        }
        .resume()
    }
}
