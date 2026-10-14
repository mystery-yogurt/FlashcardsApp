import Foundation
import Combine

class DashboardViewModel: ObservableObject {
    // @Published уведомляет View об изменении данных
    @Published var dictionaries: [DictionaryItem] = []
    @Published var weeklyStats: [DailyStat] = []
    
    init() {
        loadMockData()
    }
    
    // Заглушка для Лаб 1. В будущем здесь будет запрос к БД (SwiftData/Realm)
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
    
    // Функция запуска сессии повторения
    func startRepetitionSession() {
        print("Сессия интервального повторения запущена!")
        // В следующих лабах здесь будет логика навигации на экран карточек
    }
}
