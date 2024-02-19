//
//  Account.swift
//  GroceryApp
//
//  Created by Missbo on 20/02/2024.
//

import SwiftUI
import Firebase
struct Account: View {
    
    @State var changeScreen = false
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        VStack{
            Image("avocado")
                .resizable()
                .scaledToFit()
                .frame(width:100, height: 120)
                .padding(.vertical, 32)
            VStack(spacing: 24){
                InputView(
                    text: $email,
                    title: "Email Address",
                    placeholder: "name@example.com"
                )
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                InputView(
                    text: $password,
                    title: "Password",
                    placeholder: "Enter your password",
                    isSecureField: true
                    )
                Button() {
                    Task{
                        do{
                            try await signIn()
                            changeScreen = true
                            return
                        }
                        catch {
                            print(error)
                        }
                    }
                   
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                        Text("Sign in")
                            .foregroundColor(.white)
                            .bold()
                    }
                }.frame(width: 200, height: 50)
                    .foregroundColor(.purple)
            }
            .navigationDestination(isPresented: $changeScreen) {
                Shop()
            }
            }
            .padding(.horizontal)
            .padding(.top,2)
        
          
        }
    func signIn() async throws{
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found")
            return
        }
        try await AuthenticationManager.shared.signInUser(email: email, password: password)
    }
    }

#Preview {
    Account()
}
