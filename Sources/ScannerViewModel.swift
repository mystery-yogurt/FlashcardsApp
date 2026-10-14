import Foundation
import RealmSwift
import SwiftData

class ScannerViewModel: ObservableObject {
    @Published var scannedWord: String = ""
    @Published var foundTranslation: String = ""
    @Published var isScanning: Bool = false
    @Published var showResult: Bool = false
    
    func captureAndRecognize() {
        isScanning = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.scannedWord = "Development"
            self.lookupInRealm(word: "Development")
            self.isScanning = false
            self.showResult = true
        }
    }
    
    private func lookupInRealm(word: String) {
        do {
            let realm = try Realm()
            if let matchedWord = realm.objects(BasicWord.self).filter("word == %@", word).first {
                self.foundTranslation = matchedWord.translation
            } else {
                self.foundTranslation = "Перевод не найден"
            }
        } catch {
            print("Ошибка чтения Realm")
        }
    }
    
    func saveToPersonalDictionary(context: ModelContext) {
        let newPersonalWord = PersonalWord(word: scannedWord, translation: foundTranslation)
        context.insert(newPersonalWord)
        try? context.save()
        print("Слово сохранено в SwiftData!")
    }
}
