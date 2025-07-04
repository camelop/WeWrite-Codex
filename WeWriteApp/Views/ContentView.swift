import SwiftUI

struct ContentView: View {
    @State private var selectedCategory: NovelCategory = .pureLove
    @State private var novels: [Novel] = []
    @State private var showCreateModal = false

    var body: some View {
        NavigationView {
            VStack {
                CategoryPicker(selectedCategory: $selectedCategory)
                BookshelfView(novels: novels, onCreate: {
                    showCreateModal = true
                }, onSelect: { novel in
                    // navigate to reading view
                })
            }
            .navigationTitle("WeWrite")
        }
        .sheet(isPresented: $showCreateModal) {
            CreateNovelView(category: selectedCategory) { newNovel in
                // handle created novel
            }
        }
        .onAppear {
            loadNovels()
        }
    }

    func loadNovels() {
        Task {
            novels = await NovelService.shared.fetchNovels(category: selectedCategory)
        }
    }
}

#Preview {
    ContentView()
}
