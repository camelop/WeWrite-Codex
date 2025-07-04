import SwiftUI

struct CreateNovelView: View {
    var category: NovelCategory
    var onComplete: (Novel) -> Void

    @State private var title: String = ""
    @State private var idea: String = ""
    @State private var themes: [String] = []
    @State private var roles: [String] = []
    @State private var plots: [String] = []

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("标题")) {
                    TextField("小说标题", text: $title)
                }
                Section(header: Text("创意")) {
                    TextField("请输入创意", text: $idea)
                }
                // Additional options for themes, roles, plots
                Section(header: Text("主题")) {
                    MultipleSelectionView(options: NovelConstants.allThemes, selection: $themes)
                }
                Section(header: Text("角色")) {
                    MultipleSelectionView(options: NovelConstants.allRoles, selection: $roles)
                }
                Section(header: Text("情节")) {
                    MultipleSelectionView(options: NovelConstants.allPlots, selection: $plots)
                }
            }
            .navigationTitle("新建小说")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("提交") {
                        Task {
                            if let novel = await NovelService.shared.createNovel(title: title, idea: idea, category: category, themes: themes, roles: roles, plots: plots) {
                                onComplete(novel)
                            }
                        }
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("取消") {
                        onComplete(Novel.placeholder)
                    }
                }
            }
        }
    }
}

#Preview {
    CreateNovelView(category: .pureLove) { _ in }
}
