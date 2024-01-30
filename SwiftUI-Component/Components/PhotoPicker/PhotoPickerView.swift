//
//  PhotoPickerView.swift
//  SwiftUI-Component
//
//  Created by Parsa Karami on 2024-01-30.
//

import SwiftUI
import Foundation

class PhotoPickerViewModel : ObservableObject {
    @Published var selectedImage : UIImage? = nil
}

struct PhotoPickerView: View {
    @StateObject var viewModel = PhotoPickerViewModel()
    var body: some View {
        VStack{
            PhotoPickerPreview(selectedImage: $viewModel.selectedImage)
        }
        .navigationTitle("Photo Picker")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PhotoPickerView()
}
