//
//  OtherHome.swift
//  WorkVineApp
//
//  Created by user264764 on 7/11/24.
//

import Foundation
import SwiftUI

struct JobEntry: Identifiable {
    let id = UUID()
    var jobTitle: String
    var companyName: String
    var city: String
    var period: String
    var hourlyRate: String
    var photo: UIImage?
}

struct BusinessHome: View {
    @EnvironmentObject var dataModel: JobDataModel
    @State private var jobTitle: String = ""
    @State private var companyName: String = ""
    @State private var city: String = ""
    @State private var period: String = ""
    @State private var hourlyRate: String = ""
    @State private var selectedImage: UIImage?
    @State private var showingImagePicker = false
    @State private var showingForm = false

    var body: some View {
        let someColor = Color(red: 0/255, green: 44/255, blue: 92/255)
        let backColor = Color(red: 181/255, green: 202/255, blue: 231/255)
        ZStack {
            ZStack {
                Rectangle()
                    .fill(backColor)
                    .frame(width: 500, height: 90)
                Text("Welcome Back User!")
                    .font(.title)
                    .bold()
            }
            .padding(.bottom, 950)
            Divider()
                .frame(width: 400, height: 3)
                .background(.black)
                .padding(.top, 360)
            Rectangle()
                .frame(width: 60, height: 60)
                .padding(.top, 445)
                .padding(.trailing, 5)
                .foregroundColor(.white)
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
            Button(action: {
                showingForm = true
            }) {
                Image("Add Button")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding(.top, 447)
                    .padding(.trailing, 5)
            }
            ScrollView {
                VStack {
                    if showingForm {
                        ZStack {
                            Color(.systemGray6)
                            VStack {
                                Text("Add Job Entry")
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
                                TextField("Hourly Rate", text: $hourlyRate)
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
                                Button(action: submitJobEntry) {
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
                            Text("Jobs")
                                .font(.title)
                                .bold()
                                .padding(.trailing, 280)
                                .padding(.bottom, 2)
                        }
                    }

                    ForEach(dataModel.jobEntries) { entry in
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
                                Text(entry.hourlyRate) // Display hourly rate
                                    .font(.subheadline)
                            }
                            .padding(.leading, 10)
                            Spacer()
                            Button(action: {
                                deleteJobEntry(entry: entry)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                                    .padding(.trailing, 54)
                            }
                        }
                        .padding()
                        Divider()
                    }
                    .padding(.leading, 44)
                }
                .padding()
            }
            .frame(height: 607)
            .padding(.bottom, 253)
            .sheet(isPresented: $showingImagePicker, content: {
                ImagePicker(image: $selectedImage)
            })
        }
        .padding(.top, 300)
    }

    private func submitJobEntry() {
        // Convert hourlyRate string to Double
        let newEntry = JobEntry(jobTitle: jobTitle, companyName: companyName, city: city, period: period, hourlyRate: hourlyRate, photo: selectedImage)
        dataModel.jobEntries.append(newEntry)
        clearForm()
        showingForm = false
    }

    private func deleteJobEntry(entry: JobEntry) {
        if let index = dataModel.jobEntries.firstIndex(where: { $0.id == entry.id }) {
            dataModel.jobEntries.remove(at: index)
        }
    }

    private func clearForm() {
        jobTitle = ""
        companyName = ""
        city = ""
        period = ""
        hourlyRate = ""
        selectedImage = nil
    }
}

struct ImagePicker: UIViewControllerRepresentable {
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
        let parent: ImagePicker

        init(parent: ImagePicker) {
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

struct BusinessHome_Previews: PreviewProvider {
    static var previews: some View {
        BusinessHome().environmentObject(JobDataModel())
    }
}
