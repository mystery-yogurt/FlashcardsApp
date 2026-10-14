import Foundation
import SwiftData

@Model
final class PersonalWord {
    var word: String
    var translation: String
    var nextRepetitionDate: Date
    var easinessFactor: Double 
    
    init(word: String, translation: String) {
        self.word = word
        self.translation = translation
        self.nextRepetitionDate = Date()
        self.easinessFactor = 2.5 
    }
}
