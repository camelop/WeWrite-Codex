import SwiftUI

struct MultipleSelectionView: View {
    var options: [String]
    @Binding var selection: [String]

    var body: some View {
        List(options, id: \.self) { option in
            HStack {
                Text(option)
                Spacer()
                if selection.contains(option) {
                    Image(systemName: "checkmark")
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                if selection.contains(option) {
                    selection.removeAll { $0 == option }
                } else {
                    selection.append(option)
                }
            }
        }
    }
}

#Preview {
    MultipleSelectionView(options: ["A", "B"], selection: .constant([]))
}
