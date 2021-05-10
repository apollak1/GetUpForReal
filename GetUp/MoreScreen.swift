import SwiftUI
struct MoreScreen: View {
    var body: some View {
        VStack {
            VStack {
                Link("Click for our subscription options", destination: URL(string: "https://sites.google.com/chsd117.org/the-getup/home")!)
                    .foregroundColor(.red)
                    .font(.system(size: 20))
            }
        }
    }
}
struct MoreScreen_Previews: PreviewProvider {
    static var previews: some View {
        MoreScreen()
    }
}
