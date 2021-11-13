//
//  RegistrationView.swift
//  Getway Network
//
//  Created by Rebin Aziz on 11/12/21.
//

import SwiftUI

struct RegistrationView: View {
    
    
    @State private var email = ""
    @State private var fullname = ""
    @State private var username = ""
    @State private var password = ""
    @Environment(\.presentationMode) var mode
    
    @State private var selectedImage: UIImage?
    @State private var image: Image?
    @State var imagePickerPresented = false
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.gray, Color.blue]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            VStack {
                ZStack {
                    if let image = image {
                        image
                            
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140, height: 140)
                            .clipShape(Circle())
                            .padding(.top, 44)
                        
                    } else {
                        Button(action: {
                            imagePickerPresented.toggle()
                        }, label: {
                            Image(systemName: "plus.viewfinder")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                            .frame(width: 140, height: 140)
                            .foregroundColor(.white)
                        }).sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                            ImagePicker(image: $selectedImage)
                        }).padding()
                    }
                }.padding(.top, 44)
                
                VStack{
                    VStack(spacing: 15) {
                        CustomTextField(text: $email, placeHolder: Text("Email"), imgName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                        
                        CustomTextField(text: $username, placeHolder: Text("Username"), imgName: "person")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                        
                        CustomTextField(text: $fullname, placeHolder: Text("Fullname"), imgName: "person")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                        
                        CustomSecureField(text: $password, placeHolder: Text("Password"))
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                    }
                    .padding(.top, 24)
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Text("Forgot Password?")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.top)
                                .padding(.trailing, 28)
                        }
                        
                        
                    }
                    
                    Button(action: {
                        viewModel.register(withEmail: email, password: password, image: selectedImage, fullname: fullname, username: username)
                    }) {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background(Color(#colorLiteral(red: 0.1176470444, green: 0.1176470444, blue: 0.1176470444, alpha: 1)))
                            .clipShape(Capsule())
                            .padding()
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        mode.wrappedValue.dismiss()
                    }, label: {
                        HStack {
                            Text("Have an account??")
                                .font(.system(size: 14))
                            
                            Text("Sign In")
                                .font(.system(size: 14, weight: .semibold))
                        }.foregroundColor(.white)

                    })
                }
            }
            
        }

    }
}

extension RegistrationView {
    func loadImage() {
        guard let selectedImage = selectedImage else {
            return
        }
        image = Image(uiImage: selectedImage)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
