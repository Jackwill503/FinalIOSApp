//
//  SelectedSportScreen.swift
//  Instamureal
//
//  Created by Jack Willshire on 12/8/22.
//

import SwiftUI
import PhotosUI


struct NewEvent: View {
    @State var basketball: Basketball
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var sportVM: SportViewModel
    @EnvironmentObject var storageVM: StorageManager
    @State var stat1 = ""
    @State var stat2 = ""
    @State var stat3 = ""
    @State var message1 = ""
    @State var message2 = ""
    @State var message3 = ""
    @State var teemateName = ""
    @State var imageName = ""
    @State var teematesArray: [String] = []
    @State var victory = true
    @State private var selectedDate = Date()
    @State private var selectedPhoto: PhotosPickerItem?
    @State var neededPhoto: UIImage = UIImage()
    enum SportsName: String, CaseIterable{
        case Basketball, Soccer, FlagFootball, PickleBall, Softball
    }
    @State private var sportSelected: SportsName = .Basketball
    var body: some View {
        VStack {
           Text("What Sport Did you Play?")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.red)
            Picker("Not gonna see", selection: $sportSelected) {
                ForEach(SportsName.allCases, id: \.self) { sporty in
                    Text(sporty.rawValue)
                }
                .onChange(of: sportSelected) { newValue in
                    if sportSelected.rawValue == "Basketball"{
                        message1 = "Points:"
                        message2 = "Assists:"
                        message3 = "Rebounds:"
                        imageName = "PickupBbal"
                    } else if sportSelected.rawValue == "Soccer"{
                        message1 = "Goals:"
                        message2 = "Assists:"
                        message3 = "Saves:"
                        imageName = "atlantaSoccer"
                    } else if sportSelected.rawValue == "FlagFootball"{
                        message1 = "Touchdowns:"
                        message2 = "Catches:"
                        message3 = "Tackles:"
                        imageName = "FlagFutty"
                    } else if sportSelected.rawValue == "PickleBall"{
                        message1 = "Aces:"
                        message2 = "Spikes:"
                        message3 = "Volleys:"
                        imageName = "PickleSmall"
                    } else if sportSelected.rawValue == "Softball"{
                        message1 = "Hits:"
                        message2 = "Homeruns:"
                        message3 = "Strikes:"
                        imageName = "SuftBall"
                    }
                }
            }
            .pickerStyle(.segmented)
            Spacer()
            Image(imageName)
                .resizable()
                .scaledToFit()
//                .frame()
            Group{
                VStack(alignment: .leading){
                    Text(message1)
                        .font(.title3)
                    TextField(message1, text: $stat1)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                        .overlay{
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray)
                        }
                }
            }
            Group{
                VStack(alignment: .leading){
                    Text(message2)
                        .font(.title3)
                    TextField(message2, text: $stat2)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                        .overlay{
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray)
                        }
                }
            }
            Group{
                VStack(alignment:.leading){
                    Text(message3)
                        .font(.title3)
                    TextField(message3, text: $stat3)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                        .overlay{
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray)
                        }
                }
            }
            .padding(.bottom)
//            PhotosPicker(selection: $selectedPhoto, matching: .images, preferredItemEncoding: .automatic) {
//                Label("Photo Library", systemImage: "photo.fill.on.rectangle.fill")
//            }
            Toggle("Did you win the Game \(victory ? "YES" : "no"):", isOn: $victory)
                .padding(.bottom)
                .font(.title3)
            DatePicker("Date Of Event: ", selection: $selectedDate)
                .font(.title3)
            
            
            
           
        }
        .padding()
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }

            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    basketball = Basketball(firstStat: Int(stat1) ?? 0, secondStat: Int(stat2) ?? 0, thridStat: Int(stat3) ?? 0, pictureUploaded: teemateName, win: victory, theSport: sportSelected.rawValue, dateOfGame: selectedDate)
                    Task{
                        let success = await sportVM.saveSports(bball: basketball)
                        if success{
                            dismiss()
                        } else{
                            print("Dang Nabbit")
                        }
                    }
//                    Task{
//                        if let data = try? await selectedPhoto?.loadTransferable(type: Data.self){
//                            let uiImage = UIImage(data: data) ?? UIImage()
//                            neededPhoto = uiImage
//
//                        }
//                        storageVM.upload(image: neededPhoto)
//                    }
                    

                } label: {
                    Text("Save")
                }

            }
        }
        
    }
}

struct NewEvent_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            NewEvent(basketball: Basketball(firstStat: 0, secondStat: 0, thridStat: 0, pictureUploaded: "", win: true, theSport: "", dateOfGame: Date()))
                .environmentObject(SportViewModel())
                .environmentObject(StorageManager())
        }
    }
}
