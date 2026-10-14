import Foundation
import SwiftData

@Model
final class PersonalWord {
    var id: UUID
    var word: String
    var translation: String
    var nextRepetitionDate: Date
    var easinessFactor: Double
    
    init(word: String, translation: String) {
        self.id = UUID()
        self.word = word
        self.translation = translation
        self.nextRepetitionDate = Date()
        self.easinessFactor = 2.5
    }
}
