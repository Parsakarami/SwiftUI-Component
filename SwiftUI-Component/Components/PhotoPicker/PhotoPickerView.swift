//
//  PhotoPickerView.swift
//  SwiftUI-Component
//
//  Created by Parsa Karami on 2024-01-30.
//

import SwiftUI

struct PhotoPickerView: View {
    @Binding var selectedImage : UIImage?
    
    var body: some View {
        VStack{
            PhotoPickerPreview(selectedImage: $selectedImage)
        }
        .navigationTitle("Photo Picker")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PhotoPickerView(selectedImage: .constant(nil))
}
