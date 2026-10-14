import SwiftUI
import SwiftData

struct ScannerView: View {
    @StateObject private var viewModel = ScannerViewModel()
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle().fill(Color.black.opacity(0.8))
                VStack {
                    Text("Наведите камеру на слово").foregroundColor(.white).padding(.top, 40)
                    Spacer()
                    Rectangle()
                        .stroke(Color.green, lineWidth: 2)
                        .frame(width: 250, height: 80)
                        .overlay(
                            Group {
                                if viewModel.isScanning { ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white)) }
                            }
                        )
                    Spacer()
                }
            }
            .frame(height: 400).cornerRadius(20).padding()
            
            if viewModel.showResult {
                VStack(spacing: 10) {
                    Text("Распознано: \(viewModel.scannedWord)")
                        .font(.title2).fontWeight(.bold)
                    
                    Text("Перевод (из Realm): \(viewModel.foundTranslation)")
                        .foregroundColor(.blue)
                    
                    Button("Сохранить в личный словарь") {
                        viewModel.saveToPersonalDictionary(context: modelContext)
                        dismiss()
                    }
                    .padding().background(Color.green).foregroundColor(.white).cornerRadius(10)
                }
                .padding()
            }
            
            Spacer()
            
            Button(action: { viewModel.captureAndRecognize() }) {
                Image(systemName: "camera.circle.fill")
                    .resizable().frame(width: 80, height: 80)
                    .foregroundColor(viewModel.isScanning ? .gray : .green)
            }.disabled(viewModel.isScanning).padding(.bottom, 30)
        }
        .navigationTitle("Умное добавление")
    }
}
