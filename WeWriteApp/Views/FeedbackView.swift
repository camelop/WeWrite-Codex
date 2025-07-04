import SwiftUI

enum FeedbackChoice {
    case like, neutral, dislike
}

struct FeedbackView: View {
    var completion: (FeedbackChoice, String) -> Void

    @State private var opinion: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("喜欢程度")) {
                    Picker("", selection: $selected) {
                        Text("喜欢").tag(FeedbackChoice.like)
                        Text("一般").tag(FeedbackChoice.neutral)
                        Text("不喜欢").tag(FeedbackChoice.dislike)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                if selected == .dislike {
                    Section(header: Text("具体意见")) {
                        TextField("请输入意见", text: $opinion)
                    }
                }
            }
            .navigationTitle("本章评价")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("确定") {
                        completion(selected, opinion)
                    }
                }
            }
        }
    }

    @State private var selected: FeedbackChoice = .like
}
