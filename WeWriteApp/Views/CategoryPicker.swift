import SwiftUI

struct CategoryPicker: View {
    @Binding var selectedCategory: NovelCategory

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(NovelCategory.allCases, id: \.self) { category in
                    Button(action: {
                        selectedCategory = category
                    }) {
                        Text(category.rawValue)
                            .padding(8)
                            .background(selectedCategory == category ? Color.blue.opacity(0.2) : Color.clear)
                            .cornerRadius(8)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    CategoryPicker(selectedCategory: .constant(.pureLove))
}
