import SwiftUI

struct StudentHome: View {
    @State private var searchText: String = ""
    @State private var isSearching: Bool = false // Track search state
    @EnvironmentObject var dataModel: JobDataModel

    var body: some View {
        let someColor = Color(red: 0/255, green: 44/255, blue: 92/255)
        let backColor = Color(red: 181/255, green: 202/255, blue: 231/255)
        VStack {
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Button(action: {
                    // Action when button is tapped
                    self.isSearching.toggle() // Toggle search state
                    print("Search button tapped with text: \(searchText)")
                    // Implement your search logic here
                }) {
                    HStack {
                        Image(systemName: "magnifyingglass") // Search icon
                        TextField("Search", text: $searchText, onEditingChanged: { editing in
                            // Optional: Handle editing changed event
                        }, onCommit: {
                            print("Search text committed: \(searchText)")
                            // Implement your search logic here
                        })
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .disabled(isSearching) // Disable text field when searching
                    }
                }
                .padding()
                .foregroundColor(.blue)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
                Spacer()
                ZStack {
                    Rectangle()
                        .fill(backColor)
                        .frame(width: 500, height: 90)
                        .padding(.top, 10)
                    Text("Welcome Back User!")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 20)
                    Text("Here's what's new: ")
                        .padding(.top, 40)
                }
                Spacer()
                ZStack {
                    Text("Jobs")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 480)
                        .padding(.trailing, 280)
                   
                    VStack {
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
                                // Plus button to add the entry to myJobs
                                Button(action: {
                                    dataModel.myJobs.append(entry)
                                }) {
                                    Image(systemName: "plus")
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .clipShape(Circle())
                                }
                            }
                            .padding()
                            Divider()
                        }
                    }
                    .padding(.top, 30)
                }
                Spacer()
                HStack {
                    Button(action: {
                        // Action for homeScreen button
                        print("Home button tapped")
                    }) {
                        Image("homeScreen")
                            .resizable()
                            .frame(width: 60, height: 50)
                            .padding(2)
                            .background(Color.white)
                    }
                    Button(action: {
                        // Action for jobScreen button
                        print("Job button tapped")
                    }) {
                        Image("jobScreen")
                            .resizable()
                            .frame(width: 60, height: 50)
                            .padding(.top, 10)
                            .background(Color.white)
                    }
                    Button(action: {
                        // Action for chatScreen button
                        print("Chat button tapped")
                    }) {
                        Image("chatScreen")
                            .resizable()
                            .frame(width: 70, height: 50)
                            .padding(2)
                            .background(Color.white)
                    }
                    Button(action: {
                        // Action for account button
                        print("Account button tapped")
                    }) {
                        Image("account")
                            .resizable()
                            .frame(width: 45, height: 55)
                            .padding(2)
                            .background(Color.white)
                    }
                    Button(action: {
                        // Action for notif button
                        print("Notification button tapped")
                    }) {
                        Image("notif")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .padding(2)
                            .background(Color.white)
                    }
                }
                .padding(.bottom, 5)
                Spacer()
            }
        }
        .padding()
    }
}

struct StudentHome_Previews: PreviewProvider {
    static var previews: some View {
        StudentHome().environmentObject(JobDataModel())
    }
}

