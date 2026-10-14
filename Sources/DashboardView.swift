import SwiftUI
import Charts
import SwiftData

struct DashboardView: View {
    @StateObject private var viewModel = DashboardViewModel()

    @Query private var personalWords: [PersonalWord]
    
    let sampleCard = Flashcard(word: "Swift", transcription: "swɪft", translation: "Стриж / Быстрый", example: "Apple introduced Swift in 2014.", memorizationLevel: 0.6)
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {

                    VStack {
                        Text("Моя База Данных (SwiftData)")
                            .font(.headline)
                        Text("Изучаемых слов: \(personalWords.count)")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(16)
                    .padding(.horizontal)

                    VStack(alignment: .leading) {
                        Text("Статистика за неделю")
                            .font(.headline).padding(.bottom, 8)
                        Chart(viewModel.weeklyStats) { stat in
                            BarMark(x: .value("День", stat.day), y: .value("Слов", stat.learnedWordsCount))
                                .foregroundStyle(Color.blue.gradient).cornerRadius(4)
                        }.frame(height: 180)
                    }
                    .padding().background(Color(UIColor.secondarySystemBackground)).cornerRadius(16).padding(.horizontal)
                    
                    NavigationLink(destination: FlashcardView(viewModel: FlashcardViewModel(card: sampleCard))) {
                        Text("Начать повторение")
                            .font(.headline).foregroundColor(.white).frame(maxWidth: .infinity)
                            .padding().background(Color.green).cornerRadius(16)
                    }.padding(.horizontal).padding(.top, 16)
                }
                .padding(.vertical)
            }
            .navigationTitle("Тренажер слов")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ScannerView()) {
                        Image(systemName: "camera.viewfinder").font(.title3)
                    }
                }
            }
        }
    }
}
