import Foundation

class ScannerViewModel: ObservableObject {
    @Published var scannedWord: String = ""
    @Published var isScanning: Bool = false
    @Published var showResult: Bool = false
    
    // Имитация работы OCR (Optical Character Recognition) для симулятора
    func captureAndRecognize() {
        isScanning = true
        
        // Имитируем задержку обработки алгоритмами машинного зрения (Vision)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.scannedWord = "Development"
            self.isScanning = false
            self.showResult = true
        }
    }
}
