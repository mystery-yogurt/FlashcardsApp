import SwiftUI
import Charts

struct DashboardView: View {
    @StateObject private var viewModel = DashboardViewModel()
    
    // Моковые данные для запуска сессии
    let sampleCard = Flashcard(
        word: "Swift",
        transcription: "swɪft",
        translation: "Стриж / Быстрый",
        example: "Apple introduced the Swift programming language in 2014.",
        memorizationLevel: 0.6
    )
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    
                    // Блок статистики
                    VStack(alignment: .leading) {
                        Text("Статистика за неделю")
                            .font(.headline)
                            .padding(.bottom, 8)
                        
                        Chart(viewModel.weeklyStats) { stat in
                            BarMark(
                                x: .value("День", stat.day),
                                y: .value("Слов", stat.learnedWordsCount)
                            )
                            .foregroundStyle(Color.blue.gradient)
                            .cornerRadius(4)
                        }
                        .frame(height: 180)
                    }
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(16)
                    .padding(.horizontal)
                    
                    // Список словарей
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Мои словари")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ForEach(viewModel.dictionaries) { dictionary in
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(dictionary.name)
                                        .font(.system(size: 18, weight: .semibold))
                                    Text("Всего: \(dictionary.totalWords) | К повторению: \(dictionary.wordsToRepeat)")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(12)
                            .padding(.horizontal)
                        }
                    }
                    
                    // Кнопка перехода к Флэш-карточкам (NavigationLink)
                    NavigationLink(destination: FlashcardView(viewModel: FlashcardViewModel(card: sampleCard))) {
                        Text("Начать повторение")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(16)
                            .shadow(color: .green.opacity(0.3), radius: 10, x: 0, y: 5)
                    }
                    .padding(.horizontal)
                    .padding(.top, 16)
                    
                }
                .padding(.vertical)
            }
            .navigationTitle("Тренажер слов")
            // Кнопка перехода к Сканеру (Камере)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ScannerView()) {
                        Image(systemName: "camera.viewfinder")
                            .font(.title3)
                    }
                }
            }
        }
    }
}
