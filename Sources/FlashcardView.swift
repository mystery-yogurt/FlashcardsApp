import SwiftUI

struct FlashcardView: View {
    @StateObject var viewModel: FlashcardViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            ZStack {
                // Передняя сторона (Слово и Транскрипция)
                CardFace(isFront: true, card: viewModel.currentCard)
                    .opacity(viewModel.isFlipped ? 0 : 1)
                    .rotation3DEffect(.degrees(viewModel.isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                
                // Задняя сторона (Перевод, Пример, Прогресс)
                CardFace(isFront: false, card: viewModel.currentCard)
                    .opacity(viewModel.isFlipped ? 1 : 0)
                    .rotation3DEffect(.degrees(viewModel.isFlipped ? 0 : -180), axis: (x: 0, y: 1, z: 0))
            }
            .frame(height: 400)
            .onTapGesture {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    viewModel.flipCard()
                }
            }
            
            // Кнопки действий (появляются только на обратной стороне)
            if viewModel.isFlipped {
                HStack(spacing: 20) {
                    Button(action: { viewModel.markAsLearned(isKnown: false) }) {
                        Text("Не помню")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(12)
                    }
                    
                    Button(action: { viewModel.markAsLearned(isKnown: true) }) {
                        Text("Помню")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Повторение")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CardFace: View {
    let isFront: Bool
    let card: Flashcard
    
    var body: some View {
        VStack(spacing: 20) {
            if isFront {
                Text(card.word)
                    .font(.system(size: 40, weight: .bold))
                Text("[\(card.transcription)]")
                    .font(.title2)
                    .foregroundColor(.secondary)
                
                Text("Нажмите, чтобы перевернуть")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.top, 50)
            } else {
                Text(card.translation)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.blue)
                
                VStack(spacing: 8) {
                    Text("Пример использования:")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(card.example)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding(.top, 20)
                
                // Уровень запоминания
                VStack(spacing: 5) {
                    Text("Уровень запоминания")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    ProgressView(value: card.memorizationLevel)
                        .progressViewStyle(LinearProgressViewStyle(tint: .green))
                        .padding(.horizontal, 40)
                }
                .padding(.top, 30)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
    }
}
