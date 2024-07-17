//
//  StudentProfile.swift
//  WorkVineApp
//
//  Created by user264764 on 7/14/24.
//

import SwiftUI

struct ResumeEntry: Identifiable {
    let id = UUID()
    var jobTitle: String
    var companyName: String
    var city: String
    var period: String
    var photo: UIImage?
}

struct StudentAcc: View {
    @State private var businessName: String = "First Last"
    @State private var cityState: String = "City, State"
    @State private var bio: String = "Email, Phone #"
    @State private var isEditingBusinessName: Bool = false
    @State private var isEditingCityState: Bool = false
    @State private var isEditingBio: Bool = false
    @State private var profileImage: UIImage? = nil
    @State private var showImagePicker: Bool = false
    @State private var resumeEntries: [ResumeEntry] = []
    @State private var jobTitle: String = ""
    @State private var companyName: String = ""
    @State private var city: String = ""
    @State private var period: String = ""
    @State private var selectedImage: UIImage?
    @State private var showingImagePicker = false
    @State private var showingForm = false
    
    var body: some View {
        let someColor = Color(red: 0/255, green: 44/255, blue: 92/255)
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
                ImagPicker(image: self.$profileImage)
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
                    TextField("Email, Phone #", text: $bio)
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
            Text("Contact")
                .font(.title)
                .bold()
                .padding(.bottom, 450)
                .padding(.trailing, 236)
            Rectangle()
                .frame(width: 340, height: 1)
                .padding(.bottom, 320)
            ScrollView {
                VStack {
                    if showingForm {
                        ZStack {
                            Color(.systemGray6)
                            VStack {
                                Text("Add Resume Entry")
                                    .font(.headline)
                                    .padding()
                                TextField("Job Title", text: $jobTitle)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding([.leading, .trailing, .top])
                                TextField("Company Name", text: $companyName)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding([.leading, .trailing])
                                TextField("City, State", text: $city)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding([.leading, .trailing])
                                TextField("Working Hours", text: $period)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding([.leading, .trailing])
                                Button(action: {
                                    showingImagePicker = true
                                }) {
                                    Text("Upload Photo")
                                }
                                .padding()
                                if let selectedImage = selectedImage {
                                    Image(uiImage: selectedImage)
                                        .resizable()
                                        .frame(width: 90, height: 90)
                                        .clipShape(Circle())
                                        .padding()
                                }
                                Button(action: submitResumeEntry) {
                                    Text("Add")
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                                .padding()
                            }
                            .padding()
                            .frame(width: 338)
                        }
                        .cornerRadius(10)
                        .padding()
                    } else {
                        HStack {
                            Text("Resume")
                                .font(.title)
                                .bold()
                                .padding(.bottom, 2)
                            Button(action: {
                                showingForm = true
                            }) {
                                Image("Add2")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding(.leading, 200)
                            }
                        }
                    }

                    ForEach(resumeEntries) { entry in
                        HStack {
                            if let photo = entry.photo {
                                Image(uiImage: photo)
                                    .resizable()
                                    .frame(width: 90, height: 90)
                            } else {
                                Rectangle()
                                    .fill(someColor)
                                    .frame(width: 90, height: 90)
                            }
                            VStack(alignment: .leading) {
                                Text(entry.jobTitle)
                                    .font(.headline)
                                Text(entry.companyName)
                                    .font(.subheadline)
                                Text(entry.city)
                                    .font(.subheadline)
                                Text(entry.period)
                                    .font(.subheadline)
                            }
                            .padding(.leading, 10)
                            Spacer()
                            Button(action: {
                                deleteResumeEntry(entry: entry)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                            .padding(.trailing, 70)
                        }
                        .padding()
                        Divider()
                    }
                    .padding(.leading, 64)
                }
                .padding()
            }
            .padding(.top, 20)
            .frame(height: 360)
            .sheet(isPresented: $showingImagePicker, content: {
                ImagPicker(image: $selectedImage)
            })
            
        }
        .padding(.top, 300)
    }
    
    private func submitResumeEntry() {
        // Convert hourlyRate string to Double
        let newEntry = ResumeEntry(jobTitle: jobTitle, companyName: companyName, city: city, period: period, photo: selectedImage)
        resumeEntries.append(newEntry)
        clearForm()
        showingForm = false
    }

    private func deleteResumeEntry(entry: ResumeEntry) {
        if let index = resumeEntries.firstIndex(where: { $0.id == entry.id }) {
            resumeEntries.remove(at: index)
        }
    }

    private func clearForm() {
        jobTitle = ""
        companyName = ""
        city = ""
        period = ""
        selectedImage = nil
    }
}

struct ImagPicker: UIViewControllerRepresentable {
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
        let parent: ImagPicker

        init(parent: ImagPicker) {
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

struct StudentAcc_Previews: PreviewProvider {
    static var previews: some View {
        StudentAcc()
    }
}
