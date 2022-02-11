//
//  URL+Extension.swift
//  AcronymsDemo
//
//  Created by Rajendran Eshwaran on 2/10/22.
//

import Foundation

extension URL{
    
    public static func getUrl()-> URL?
    {
        guard let url = URL(string: "http://www.nactem.ac.uk/software/acromine/dictionary.py?sf=HMM")else{return nil}
        return url
    }
}
