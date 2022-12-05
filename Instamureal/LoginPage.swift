//
//  ContentView.swift
//  Instamureal
//
//  Created by Jack Willshire on 12/4/22.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginPage: View {
    @EnvironmentObject var sportVM: SportViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var buttonsOFF = true
    @State private var presentSheet = false
    @State private var user: User?
   @State private var path = NavigationPath()
    enum Field{
        case email, password
    }
    @FocusState private var focusField: Field?
    var body: some View {
        
        VStack{
            Text("Instamureals")
                .font(Font.custom("Avenir Next Condensed", size: 73))
                .bold()
            Image("Loggypoo")
                .resizable()
                .scaledToFit()
            Group{
                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .submitLabel(.next)
                    .focused($focusField, equals: .email)
                    .onSubmit {
                        focusField = .password
                    }
                    .onChange(of: email) { _ in
                        turnButtonsOn()
                    }
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .submitLabel(.done)
                    .focused($focusField, equals: .password)
                    .onSubmit {
                        focusField = nil
                    }
                    .onChange(of: password) { _ in
                        turnButtonsOn()
                    }
            }
            .overlay{
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray.opacity(0.5), lineWidth: 2)
            }
            .padding(.horizontal)
            HStack{
                Button {
                    Task{
                       await login()
                    }
                } label: {
                    Text("Login")
                }
                .padding(.trailing)
                
                Button {
                    Task{
                       await register()
                    }

                } label: {
                    Text("Start Playng!")
                }
                .padding(.leading)
                
            }
            .disabled(buttonsOFF)
            .buttonStyle(.borderedProminent)
            .tint(.green)
            .foregroundColor(.purple)
        }
        
        .alert(alertMessage, isPresented: $showingAlert) {
            Button("OK", role: .cancel) {
                
            }
        }
        .onAppear{
                if Auth.auth().currentUser != nil{
                    print("I guess it worked")
                    presentSheet = true
                }
            
        }
        .fullScreenCover(isPresented: $presentSheet) {
            NavigationStack{
                HomePage()
            }
        }
    }
    func turnButtonsOn(){
        let emailSubmited = email.count > 6 && email.contains("@")
        let passwordIsGood = password.count >= 6
        buttonsOFF = !(emailSubmited && passwordIsGood)
        
    }
    func register() async{
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DIDNT WORK KING")
                alertMessage = "Sorry King: \(error.localizedDescription)"
                showingAlert = true
            } else {
                
                presentSheet = true
            }
        }
    }
            
    func login() async{
        do{
            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            user = authResult.user
            presentSheet = true
        } catch{
            print("BINGBONG")
        }
        
    }
    }


struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
            .environmentObject(SportViewModel())
    }
}
