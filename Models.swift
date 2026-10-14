import Foundation

// Модель личного словаря
struct DictionaryItem: Identifiable {
    let id = UUID()
    let name: String
    let totalWords: Int
    let wordsToRepeat: Int
}

// Модель для статистики изученных слов (Swift Charts)
struct DailyStat: Identifiable {
    let id = UUID()
    let day: String
    let learnedWordsCount: Int
}
