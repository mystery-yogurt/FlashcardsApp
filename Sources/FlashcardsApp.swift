import SwiftUI
import SwiftData
import RealmSwift

@main
struct FlashcardsApp: App {
    
    init() {
        seedRealmDatabase()
    }
    
    var body: some Scene {
        WindowGroup {
            DashboardView()
        }
        .modelContainer(for: PersonalWord.self)
    }
    
    private func seedRealmDatabase() {
        do {
            let realm = try Realm()
            if realm.objects(BasicWord.self).isEmpty {
                try realm.write {
                    realm.add(BasicWord(word: "Development", translation: "Разработка", example: "Software development is complex."))
                    realm.add(BasicWord(word: "Swift", translation: "Стриж / Быстрый", example: "Swift is a fast bird."))
                    realm.add(BasicWord(word: "Apple", translation: "Яблоко", example: "I ate a green apple."))
                }
                print("Realm: Базовый словарь успешно загружен!")
            }
        } catch {
            print("Ошибка инициализации Realm: \(error)")
        }
    }
}
