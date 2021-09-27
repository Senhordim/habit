//
//  SplashView.swift
//  Habit
//
//  Created by Diego Figueira Collares on 25/09/21.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel

    var body: some View {
        Group{
            switch viewModel.uiState {
                case .loading:
                    loadingView()
                case .goToSignInScreen:
                    Text("Login")
                case .goToHomeScreen:
                    Text("Home")
                case .error(let message):
                    loadingView(error: message)
            }
        }.onAppear(perform: {
            viewModel.onAppear()
        })
    }
}

extension SplashView {
    func loadingView(error: String? = nil) -> some View{
        ZStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(20)
                .background(Color.white)
                .ignoresSafeArea()
            
            if let error = error {
                Text("").alert(isPresented: .constant(true)){
                    Alert(
                        title: Text("Habit"),
                        message: Text(error),
                        dismissButton: .default(Text("OK")){
                            // faz algo quando some o alerta
                        })
                    
                }
            }
        }
    }
}

// Alternativa
//extension SplashView {
//    var loadingView: View{
//        ZStack{
//            Image("logo")
//                .resizable()
//                .scaledToFit()
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .padding(20)
//                .background(Color.white)
//                .ignoresSafeArea()
//        }
//    }
//}

//struct LoadingView: View {
//    var body: some View {
//        ZStack{
//            Image("logo")
//                .resizable()
//                .scaledToFit()
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .padding(20)
//                .background(Color.white)
//                .ignoresSafeArea()
//        }
//    }
//}


struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SplashViewModel()
        SplashView(viewModel: viewModel)
    }
}
