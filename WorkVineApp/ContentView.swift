//
//  ContentView.swift
//  WorkVineApp
//
//  Created by user264764 on 7/9/24.
//

import SwiftUI

struct ContentView: View {
    @State private var businessName: String = "Business Name"
    @State private var cityState: String = "City, State"
    @State private var bio: String = "Enter bio here..."
    @State private var isEditingBusinessName: Bool = false
    @State private var isEditingCityState: Bool = false
    @State private var isEditingBio: Bool = false
    @State private var profileImage: UIImage? = nil
    @State private var showImagePicker: Bool = false
    
    var body: some View {
        let profileColor = Color(red: 211/255, green: 211/255, blue: 211/255)
        
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(colors: [Color.red, Color.purple], startPoint: .leading, endPoint: .trailing)
                )
                .drawingGroup()
                .frame(width: 400, height: 170)
                .padding(.bottom, 1010)
            ZStack {
                if let image = profileImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 110, height: 110)
                        .clipShape(Circle())
                        .padding(.trailing, 238)
                        .padding(.bottom, 850)
                } else {
                    Circle()
                        .frame(width: 110, height: 110)
                        .foregroundColor(profileColor)
                        .padding(.bottom, 850)
                        .padding(.trailing, 238)
                        .overlay(
                            Text("Click to Upload")
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 850)
                                .padding(.trailing, 241)
                        )
                }
            }
            .onTapGesture {
                self.showImagePicker = true
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: self.$profileImage)
            }
            Text("--")
                .font(.title)
                .bold()
                .padding(.trailing, 235)
                .padding(.bottom, 597)
                .padding(.trailing, 76)
            Text("Icon")
                .foregroundColor(.white)
                .padding(.bottom, 15)
                .padding(.trailing, 253)
            Rectangle()
                .frame(width: 538, height: 90)
                .foregroundColor(.white)
                .padding(.top, 450)
            Divider()
                .frame(width: 400, height: 3)
                .background(.black)
                .padding(.top, 360)
            Image("Add Button")
                .resizable()
                .frame(width: 60, height: 60)
                .padding(.top, 445)
                .padding(.trailing, 5)
            Image("Home Button")
                .resizable()
                .frame(width: 55, height: 55)
                .padding(.top, 445)
                .padding(.trailing, 225)
            Image("Account Button")
                .resizable()
                .frame(width: 55, height: 55)
                .padding(.top, 448)
                .padding(.leading, 210)
            Text("Jobs Postings")
                .font(.title)
                .bold()
                .padding(.bottom, 260)
                .padding(.trailing, 160)
            ZStack(alignment: .leading) {
                if !isEditingBusinessName && !isEditingCityState && !isEditingBio {
                    Button(action: {
                        isEditingBusinessName = true
                    }) {
                        Image("Edit Button")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.bottom, 795)
                            .padding(.leading, 335)
                            .padding(.trailing, 20)
                    }
                }
                if isEditingBusinessName {
                    TextField("Business Name", text: $businessName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 328, alignment: .center)
                        .padding(.bottom, 670)
                        .padding(.trailing, 30)
                        .onSubmit {
                            isEditingBusinessName = false
                            isEditingCityState = true
                        }
                } else {
                    Text(businessName)
                        .font(.largeTitle)
                        .lineLimit(1)
                        .frame(width: 350, alignment: .leading)
                        .bold()
                        .padding(.bottom, 665)
                        .padding(.leading, 10)
                        .fixedSize(horizontal: false, vertical: false)
                }
                if isEditingCityState {
                    TextField("City, State", text: $cityState)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onSubmit {
                            isEditingCityState = false
                            isEditingBio = true
                        }
                        .frame(width: 330, alignment: .center)
                        .padding(.trailing, 30)
                        .padding(.bottom, 535)
                } else {
                    Text(cityState)
                        .padding(.bottom, 530)
                        .padding(.leading, 10)
                }
                
                if isEditingBio {
                    TextField("Enter bio here...", text: $bio)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onSubmit {
                            isEditingBio = false
                        }
                        .frame(width: 330, alignment: .center)
                        .padding(.trailing, 26)
                        .padding(.bottom, 375)
                } else {
                    Text(bio)
                        .padding(.bottom, 380)
                        .padding(.leading, 10)
                        .frame(width: 330, height: 50, alignment: .leading)
                        .fixedSize(horizontal: true, vertical: false)
                }
            }
            .padding(.leading, 27)
            Text("Bio")
                .font(.title)
                .bold()
                .padding(.bottom, 450)
                .padding(.trailing, 296)
            Rectangle()
                .frame(width: 340, height: 1)
                .padding(.bottom, 320)
        }
        .padding(.top, 300)
    }
}

struct ImagePick: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePick

        init(parent: ImagePick) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let editedImage = info[.editedImage] as? UIImage {
                parent.image = editedImage
            } else if let originalImage = info[.originalImage] as? UIImage {
                parent.image = originalImage
            }
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}


struct BusinessAcc_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
