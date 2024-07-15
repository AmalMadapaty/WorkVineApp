//
//  AddEntry.swift
//  WorkVineApp
//
//  Created by user264764 on 7/15/24.
//

import SwiftUI

struct AddJobFormView: View {
    @Binding var jobTitle: String
    @Binding var companyName: String
    @Binding var city: String
    @Binding var period: String
    @Binding var hourlyRate: String
    @Binding var selectedImage: UIImage?
    @Binding var showingForm: Bool
    @Binding var showingImagePicker: Bool
    
    var submitJobEntry: () -> Void
    
    var body: some View {
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
    }
}

struct AddJobFormView_Previews: PreviewProvider {
    @State static var jobTitle = ""
    @State static var companyName = ""
    @State static var city = ""
    @State static var period = ""
    @State static var hourlyRate = ""
    @State static var selectedImage: UIImage? = nil
    @State static var showingForm = false
    @State static var showingImagePicker = false

    static var previews: some View {
        AddJobFormView(
            jobTitle: $jobTitle,
            companyName: $companyName,
            city: $city,
            period: $period,
            hourlyRate: $hourlyRate,
            selectedImage: $selectedImage,
            showingForm: $showingForm,
            showingImagePicker: $showingImagePicker,
            submitJobEntry: {}
        )
    }
}
