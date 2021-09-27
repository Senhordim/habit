//
//  SplashViewModel.swift
//  Habit
//
//  Created by Diego Figueira Collares on 26/09/21.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    @Published var uiState: SplashUIState = .loading
    
    func onAppear(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.uiState = .error("Erro ao carregar")
        }
    }
}
