import SwiftUI

struct ReadingView: View {
    var novel: Novel
    @State private var chapters: [Chapter] = []
    @State private var currentIndex: Int = 0
    @State private var showFeedback = false
    @State private var feedback: String = ""

    var body: some View {
        VStack {
            if currentIndex < chapters.count {
                let chapter = chapters[currentIndex]
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        if let cover = chapter.coverURL {
                            AsyncImage(url: cover) { image in
                                image.resizable()
                            } placeholder: {
                                Color.clear
                            }
                            .frame(height: 200)
                        }
                        Text(chapter.content)
                            .padding()
                    }
                }
                .onAppear {
                    if currentIndex == chapters.count - 1 {
                        loadNextChoices()
                    }
                }
            } else {
                Text("加载中...")
            }
        }
        .navigationTitle(novel.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("下一章") {
                    if currentIndex + 1 < chapters.count {
                        currentIndex += 1
                    } else {
                        showFeedback = true
                    }
                }
            }
        }
        .sheet(isPresented: $showFeedback) {
            FeedbackView { like, opinion in
                showFeedback = false
                Task {
                    if like != .dislike {
                        if let next = await NovelService.shared.requestNextChapter(novelID: novel.id, opinion: like == .like ? nil : opinion) {
                            chapters.append(next)
                            currentIndex += 1
                        }
                    } else {
                        feedback = opinion
                        // maybe regenerate
                    }
                }
            }
        }
        .onAppear {
            Task {
                if let first = await NovelService.shared.fetchChapter(novelID: novel.id, chapterID: "1") {
                    chapters = [first]
                }
            }
        }
    }

    func loadNextChoices() {
        // TODO: display AI options and platform chapters
    }
}
