//
//  AcronymsViewModel.swift
//  AcronymsDemo
//
//  Created by Rajendran Eshwaran on 2/10/22.
//

import Foundation
class AcronymsViewModel:ObservableObject{
    @Published var acronymModel = [AcronmymsModel]()
    
    func serviceInitialize(){
        ServiceManager().getAcronymsDataFromService(completion: { result in
            DispatchQueue.main.async {
                self.acronymModel = result
                print(result)
            }
        })
    }
}
