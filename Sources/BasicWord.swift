import Foundation
import RealmSwift

class BasicWord: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var word: String
    @Persisted var translation: String
    @Persisted var example: String
    
    convenience init(word: String, translation: String, example: String) {
        self.init()
        self.word = word
        self.translation = translation
        self.example = example
    }
}
