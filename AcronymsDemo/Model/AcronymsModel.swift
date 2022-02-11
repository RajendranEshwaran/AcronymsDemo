//
//  AcronymsModel.swift
//  AcronymsDemo
//
//  Created by Rajendran Eshwaran on 2/10/22.
//

import Foundation
import SwiftUI

// MARK: - WelcomeElement
struct AcronmymsBaseModel:Identifiable {
    //var id = UUID()
    let sf:String
    let lfs: [LF]
    var id: String {
            self.sf
        }
}

// MARK: - LF
struct LF: Decodable {
    let lf: String
    let freq, since: Int
    let vars: [LF]? 
}

extension AcronmymsBaseModel:Decodable{
    enum CodingKeys: String, CodingKey {
        case sf,lfs
    }
}
typealias AcronmymsModel = [AcronmymsBaseModel]


