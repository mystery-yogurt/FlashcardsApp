import Foundation

class FlashcardViewModel: ObservableObject {
    @Published var currentCard: Flashcard
    @Published var isFlipped: Bool = false
    
    init(card: Flashcard) {
        self.currentCard = card
    }
    
    // Логика переворота карточки
    func flipCard() {
        isFlipped.toggle()
    }
    
    // Кнопки оценки (Знаю / Не знаю). 
    // В Лаб.4 здесь будет логика интервальных повторений SuperMemo SM-2.
    func markAsLearned(isKnown: Bool) {
        print(isKnown ? "Слово помню" : "Слово забыл")
        // Здесь будет переход к следующей карточке
    }
}
