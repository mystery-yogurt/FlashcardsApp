import Foundation

struct DictionaryItem: Identifiable {
    let id = UUID()
    let name: String
    let totalWords: Int
    let wordsToRepeat: Int
}

struct DailyStat: Identifiable {
    let id = UUID()
    let day: String
    let learnedWordsCount: Int
}

// НОВАЯ МОДЕЛЬ: Флэш-карточка
struct Flashcard: Identifiable {
    let id = UUID()
    let word: String
    let transcription: String
    let translation: String
    let example: String
    let memorizationLevel: Double // От 0.0 до 1.0 (процент запоминания)
}
