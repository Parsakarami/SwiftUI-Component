//
//  PhotoPickerPreview.swift
//  SwiftUI-Component
//
//  Created by Parsa Karami on 2024-01-30.
//

import SwiftUI


struct PhotoPickerPreview: View {
    @Binding var selectedImage : UIImage?
    @State var isImagePickerPresented : Bool = false
    @State var previewWidth : CGFloat = 125
    @State var previewHeight : CGFloat = 125
    @State var pickerWidth : CGFloat = 60
    @State var pickerHeight : CGFloat = 60
    var body: some View {
        VStack{
            if let image = selectedImage {
                VStack {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(.circle)
                            .frame(width: previewWidth, height: previewHeight)
                    
                    Button(action: {
                        isImagePickerPresented.toggle()
                    }){
                        Label("Replace",systemImage: "paperclip")
                            .foregroundStyle(.indigo)
                            .padding(5)
                    }
                }
                .padding(5)
            } else {
                Button(action: {
                    isImagePickerPresented.toggle()
                }){
                    Image("add.photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(12)
                        .tint(.indigo)
                        .frame(width: pickerWidth, height: pickerHeight)
                        .clipShape(.circle)
                        .overlay{
                            RoundedRectangle(cornerRadius: 15).stroke(Color.indigo,lineWidth:1)
                        }
                }
                .padding(5)
            }
        }
        .padding(5)
        .sheet(isPresented: $isImagePickerPresented) {
            PhotoPicker(selectedImage: $selectedImage)
        }
    }
}

#Preview {
    PhotoPickerPreview(selectedImage: .constant(UIImage(named: "Profile")))
}
