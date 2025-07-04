import SwiftUI

struct BookshelfView: View {
    var novels: [Novel]
    var onCreate: () -> Void
    var onSelect: (Novel) -> Void

    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 16) {
                Button(action: onCreate) {
                    VStack {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 80, height: 120)
                            .foregroundColor(.gray)
                        Text("新建小说")
                    }
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(PlainButtonStyle())

                ForEach(novels) { novel in
                    Button(action: {
                        onSelect(novel)
                    }) {
                        VStack {
                            AsyncImage(url: novel.coverURL) { image in
                                image.resizable()
                            } placeholder: {
                                Rectangle().foregroundColor(.gray.opacity(0.3))
                            }
                            .frame(width: 80, height: 120)
                            Text(novel.title)
                                .font(.caption)
                                .lineLimit(1)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
        }
    }
}

#Preview {
    BookshelfView(novels: [], onCreate: {}, onSelect: { _ in })
}
