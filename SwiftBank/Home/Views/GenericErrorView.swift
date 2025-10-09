//
//  GenericErrorView.swift
//  SwiftBank
//
//  Created by Maria Clara Dias on 09/10/25.
//

import SwiftUI

struct GenericErrorView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // MARK: - UI Components
    
    private let backgroundColor = Color(red: 240.0/255.0,
                                        green: 240.0/255.0,
                                        blue: 240.0/255.0)
    
    private let yellowColor = Color(red: 255.0/255.0,
                                    green: 186.0/255.0,
                                    blue: 5.0/255.0)
    
    // MARK: - View
    
    public var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(gradient: Gradient(colors: [yellowColor, backgroundColor]), startPoint: .top, endPoint: .bottom)
            
            VStack {
                cardView
                    .padding(.top, 110)
                    .padding(.horizontal)
            }
        }
        .ignoresSafeArea()
    }
    
    var cardView: some View {
        RoundedRectangle(cornerRadius: 7)
            .frame(maxWidth: .infinity)
            .frame(height: 350)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 7))
            .shadow(color: Color.gray.opacity(0.5), radius: 7, x: 0, y: 2)
            .overlay {
                VStack(alignment: .leading) {
                    errorView
                        .padding(.top, 20)
                        .padding(.horizontal)
                    
                    Spacer()
                }
            }
    }
    
    var errorView: some View {
        VStack(alignment: .center) {
            Image("error-icon")
                .resizable()
                .frame(width: 150, height: 130)
            
            Text("Ocorreu um erro!")
                .font(.system(size: 19))
                .foregroundColor(.black)
                .fontWeight(.medium)
                .padding(.bottom, 5)
            
            backButton
                .padding(.top, 20)
            
            updateButton
                .padding(.top, 20)
        }
    }
    
    var backButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Text("Tela Inicial")
                .padding(.horizontal, 85)
                .font(.system(size: 18).bold())
                .foregroundColor(.white)
                .padding(8)
                .background(Color.black)
                .cornerRadius(25)
        }
    }
    
    var updateButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Text("Atualizar")
                .padding(.horizontal, 85)
                .font(.system(size: 18).bold())
                .foregroundColor(.black)
                .padding(8)
                .background(Color.white)
                .cornerRadius(25)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black, lineWidth: 2)
                )
        }
    }
}

#Preview {
    GenericErrorView()
}
