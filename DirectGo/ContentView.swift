import SwiftUI
import PhotosUI
import UIKit

struct ContentView: View {
    @State private var messages: [String] = ["Welcome to DirectGo! Upload your itinerary to start."]
    @State private var selectedImage: Image?
    @State private var isShowingPhotoPicker = false

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(messages, id: \.self) { message in
                        Text(message)
                            .padding()
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(10)
                    }
                }
            }
            .frame(maxHeight: 300)

            Button(action: {
                isShowingPhotoPicker = true
            }) {
                Text("Upload Itinerary Photo")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .sheet(isPresented: $isShowingPhotoPicker) {
            PhotoPickerView(selectedImage: $selectedImage, onImageSelected: { image in
                messages.append("Analyzing your itinerary...")
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    messages.append("Itinerary parsed: Flight on March 10, Hotel XYZ confirmed.")
                }
            })
        }
    }
}

// 照片选择器视图（用View包裹UIViewControllerRepresentable）
struct PhotoPickerView: View {
    @Binding var selectedImage: Image?
    var onImageSelected: (Image) -> Void

    var body: some View {
        PhotoPicker(selectedImage: $selectedImage, onImageSelected: onImageSelected)
            .ignoresSafeArea()
    }
}

// 照片选择器（UIViewControllerRepresentable实现）
struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var selectedImage: Image?
    var onImageSelected: (Image) -> Void

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: PhotoPicker

        init(parent: PhotoPicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)

            guard let result = results.first else { return }
            result.itemProvider.loadObject(ofClass: UIImage.self) { (object, error) in
                if let image = object as? UIImage {
                    DispatchQueue.main.async {
                        let swiftUIImage = Image(uiImage: image)
                        self.parent.selectedImage = swiftUIImage
                        self.parent.onImageSelected(swiftUIImage)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
