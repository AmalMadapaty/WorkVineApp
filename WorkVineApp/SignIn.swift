//
//  SignIn.swift
//  WorkVineApp
//
//  Created by user264764 on 7/9/24.
//

import SwiftUI
import CoreData

class User: Identifiable {
    var id = UUID()
    var username: String
    var password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    func validateCredentials() -> Bool {
        return !username.isEmpty && !password.isEmpty
    }
}
enum Destination: Hashable {
    case studentHome
    case businessHome
}
struct HomeView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showingStudentLoginForm: Bool = false
    @State private var showingBusinessLoginForm: Bool = false
    @State private var users: [User] = []
    @State private var isSigningUp: Bool = false
    @State private var errorMessage: String? = nil
    @State private var navigationSelection: Destination? = nil
    var body: some View {
        NavigationStack {
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 350, height: 220)
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 40)
                    .padding(.bottom, 50)
                Spacer()
                
                if !showingStudentLoginForm && !showingBusinessLoginForm {
                    Button(action: {
                        showingStudentLoginForm = true
                        isSigningUp = false
                    }) {
                        Text("Sign In as a Student")
                            .font(.title2)
                            .frame(width: 300, height: 25)
                            .padding()
                            .background(Color.init(red: 0.0/255.0, green: 44.0/255.0, blue: 92.0/255.0))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    Spacer()
                    Spacer()
                    Button(action: {
                        showingBusinessLoginForm = true
                        isSigningUp = false
                    }) {
                        Text("Sign In As a Business")
                            .font(.title2)
                            .frame(width: 300, height: 25)
                            .padding()
                            .background(Color.init(red: 0.0/255.0, green: 44.0/255.0, blue: 92.0/255.0))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    Spacer()
                } else {
                    VStack {
                        Text(isSigningUp ? "Sign Up" : "Login")
                            .font(.largeTitle)
                            .padding(.bottom, 40)
                        
                        TextField("Username", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom, 20)
                        
                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom, 40)
                        
                        if let errorMessage = errorMessage {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .padding(.bottom, 20)
                        }
                        
                        if isSigningUp {
                            Button(action: {
                                let newUser = User(username: username, password: password)
                                if newUser.validateCredentials() {
                                    users.append(newUser)
                                    print("New user signed up: \(username)")
                                    self.errorMessage = nil
                                    if showingStudentLoginForm {
                                        navigationSelection = .studentHome
                                    } else {
                                        navigationSelection = .businessHome
                                    }
                                } else {
                                    self.errorMessage = "Invalid sign-up credentials"
                                }
                            }) {
                                Text("Sign Up")
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        } else {
                            Button(action: {
                                if users.first(where: { $0.username == username && $0.password == password }) != nil {
                                    print("Username: \(username), Password: \(password)")
                                    self.errorMessage = nil
                                    if showingStudentLoginForm {
                                        navigationSelection = .studentHome
                                    } else {
                                        navigationSelection = .businessHome
                                    }
                                } else {
                                    self.errorMessage = "Invalid credentials"
                                }
                            }) {
                                Text("Submit")
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            Spacer()
                        }
                    }
                    if !isSigningUp {
                        Button(action: {
                            isSigningUp = true
                            self.errorMessage = nil
                        }) {
                            Text("Sign Up")
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                }
                
                Spacer()
                
                NavigationLink(destination: StudentHome(), tag: Destination.studentHome, selection: $navigationSelection) {
                    EmptyView()
                }
                NavigationLink(destination: BusinessHome(), tag: Destination.businessHome, selection: $navigationSelection) {
                    EmptyView()
                }
            }
        }
    }
}
struct SignIn: View {
    var body: some View {
        HomeView()
    }
}
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
