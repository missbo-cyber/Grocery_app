//
//  ContentView.swift
//  GroceryApp
//
//  Created by Missbo on 19/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var changeScreen = false
    @State var gotoAccount = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Image("avocado")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                Text("We deliver\n grocery at your\n doorstep")
                    .font(.system(size: 42, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.center)
                Text("Grocerr gives you fresh vegetables and fruits,\nOrder fresh at grocerr")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                VStack{
                Button() {
                    changeScreen = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                        Text("Get Started")
                            .foregroundColor(.white)
                            .bold()
                    }
                }.frame(width: 200, height: 50)
                    .foregroundColor(.purple)
            }
            .navigationDestination(isPresented: $changeScreen) {
                Registration()
            }
                Button(){
                    gotoAccount = true
                }
            label:{
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                    Text("Sign in")
                        .foregroundColor(.white)
                        .bold()
                }
            }.frame(width: 200, height: 50)
                .foregroundColor(.purple)
        }
        .navigationDestination(isPresented: $gotoAccount) {
            Account()
        }
            }
        }
        }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
