import SwiftUI

struct ScannerView: View {
    @StateObject private var viewModel = ScannerViewModel()
    
    var body: some View {
        VStack {
            // Имитация видоискателя камеры
            ZStack {
                Rectangle()
                    .fill(Color.black.opacity(0.8))
                
                VStack {
                    Text("Наведите камеру на слово")
                        .foregroundColor(.white)
                        .padding(.top, 40)
                    
                    Spacer()
                    
                    // Рамка сканера
                    Rectangle()
                        .stroke(Color.green, lineWidth: 2)
                        .frame(width: 250, height: 80)
                        .overlay(
                            Group {
                                if viewModel.isScanning {
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                }
                            }
                        )
                    
                    Spacer()
                }
            }
            .frame(height: 400)
            .cornerRadius(20)
            .padding()
            
            if viewModel.showResult {
                VStack(spacing: 10) {
                    Text("Распознано:")
                        .foregroundColor(.gray)
                    Text(viewModel.scannedWord)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Button("Добавить в словарь") {
                        // В Лаб.3 и 4 здесь будет логика отправки слова в БД и брокер сообщений
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
            }
            
            Spacer()
            
            Button(action: {
                viewModel.captureAndRecognize()
            }) {
                Image(systemName: "camera.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(viewModel.isScanning ? .gray : .green)
            }
            .disabled(viewModel.isScanning)
            .padding(.bottom, 30)
        }
        .navigationTitle("Умное добавление")
        .navigationBarTitleDisplayMode(.inline)
    }
}
