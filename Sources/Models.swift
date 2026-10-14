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
