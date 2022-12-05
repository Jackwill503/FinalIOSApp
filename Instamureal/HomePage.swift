//
//  HomePage.swift
//  Instamureal
//
//  Created by Jack Willshire on 12/7/22.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct HomePage: View {
    @FirestoreQuery(collectionPath: "sportsNOPIC") var eventismos: [Basketball]
    @State private var sheetIsPresented = false
    @State private var sheet2IsPresented = false
    @State private var sheet3IsPresented = false
    @Environment(\.dismiss) private var dismiss
   
    var body: some View {
        
        List(eventismos) { help in
            DetailView(holdingValue: help)
        
        }
            .listStyle(.plain)
            .navigationBarBackButtonHidden()
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Sign Out"){
                        do{
                            try Auth.auth().signOut()
                            print("lougout")
                            dismiss()
                        } catch{
                            print("error")
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("My Stats"){
                        sheet2IsPresented.toggle()
                        
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("New Event!"){
                        sheetIsPresented.toggle()
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        sheet3IsPresented.toggle()
                    } label: {
                        Text("Totals")
                    }

                }
                
            }
        .sheet(isPresented: $sheetIsPresented, content: {
            NavigationStack{
                NewEvent(basketball: Basketball())
            }
        })
        .sheet(isPresented: $sheet2IsPresented, content: {
            NavigationStack{
                PersonalPage()
            }
        })
        .sheet(isPresented: $sheet3IsPresented, content: {
            NavigationStack{
                TotalsFile()
            }
        })
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            HomePage()
        }
    }
}
