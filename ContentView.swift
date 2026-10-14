import SwiftUI
import Charts

struct DashboardView: View {
    // Подключаем ViewModel к View
    @StateObject private var viewModel = DashboardViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    
                    // 1. Блок статистики (Swift Charts)
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
                    
                    // 2. Список личных словарей
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
                    
                    // 3. Кнопка запуска сессии
                    Button(action: {
                        viewModel.startRepetitionSession()
                    }) {
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
        }
    }
}

// Preview для Xcode
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
