//
//  Registration.swift
//  GroceryApp
//
//  Created by Missbo on 21/02/2024.
//

import SwiftUI
import Firebase
struct Registration: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var confirmpassword = ""
    @State var changeScreen = false
    @State private var userIsLoggedIn = false
    var body: some View {
        VStack{
            Image("avocado")
                .resizable()
                .scaledToFit()
                .frame(width:100, height: 120)
                .padding(.vertical, 32)
            VStack(spacing: 24){
                InputView(
                    text: $fullname,
                    title: "Full Name",
                    placeholder: "Enter your name"
                )
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
                InputView(
                    text: $confirmpassword,
                    title: "Confirm Password",
                    placeholder: "Confirm your password",
                    isSecureField: true
                )
                Button() {
                    register()
                    changeScreen = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                        Text("Sign up")
                            .foregroundColor(.white)
                            .bold()
                    }
                }.frame(width: 200, height: 50)
                    .foregroundColor(.purple)
            }
            .onAppear {
                Auth.auth().addStateDidChangeListener {
                    auth, user in
                    if user != nil {
                        userIsLoggedIn.toggle()
                    }
                }
            }
            }
            .padding(.horizontal)
            .padding(.top,12)
        Spacer()
        }
   
    func register(){
        Auth.auth().createUser(withEmail: email, password: password) {
            result,error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    }

#Preview {
    Registration()
}
