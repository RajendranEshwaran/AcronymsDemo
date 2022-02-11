//
//  ContentView.swift
//  AcronymsDemo
//
//  Created by Rajendran Eshwaran on 2/10/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var acyVM = AcronymsViewModel()
    @State private var txtValue : String = ""
    @State private var values : String = "Click Acronyms Button"
    var body: some View {
        VStack{
            Text("Acronyms")
                .font(.largeTitle)
                .padding()
            
            Button("Check Acronyms") {
                getAcronyms()}
            .tint(.red)
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
            Text(values)
                .padding()
                .border(Color.red, width: 2)
            Spacer()
        }
        .onAppear{
            self.acyVM.serviceInitialize()
        }
        
    }
    func getAcronyms()
    {
        values = ""
        let model = self.acyVM.acronymModel[0]
        values += "sf: \(model[0].sf)"
        for modelItem in model[0].lfs{
            values += "lf: \(modelItem.lf) , freq: \(modelItem.freq) , since: \(modelItem.since)"
            if let variation = modelItem.vars{
                for variationItems in variation{
                    values += "lf: \(variationItems.lf), freq: \(variationItems.freq) , since: \(variationItems.since)"
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(acyVM: AcronymsViewModel())
    }
}
