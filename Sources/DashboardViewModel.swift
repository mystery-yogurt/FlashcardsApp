import Foundation

class DashboardViewModel: ObservableObject {
    @Published var dictionaries: [DictionaryItem] = []
    @Published var weeklyStats: [DailyStat] = []
    
    init() {
        loadMockData()
    }
    
    private func loadMockData() {
        dictionaries = [
            DictionaryItem(name: "Английский - Топ 1000", totalWords: 1000, wordsToRepeat: 45),
            DictionaryItem(name: "IT Термины", totalWords: 150, wordsToRepeat: 12),
            DictionaryItem(name: "Путешествия", totalWords: 300, wordsToRepeat: 0)
        ]
        
        weeklyStats = [
            DailyStat(day: "Пн", learnedWordsCount: 15),
            DailyStat(day: "Вт", learnedWordsCount: 22),
            DailyStat(day: "Ср", learnedWordsCount: 8),
            DailyStat(day: "Чт", learnedWordsCount: 30),
            DailyStat(day: "Пт", learnedWordsCount: 12),
            DailyStat(day: "Сб", learnedWordsCount: 40),
            DailyStat(day: "Вс", learnedWordsCount: 25)
        ]
    }
    
    func startRepetitionSession() {
        print("Сессия запущена!")
    }
}
