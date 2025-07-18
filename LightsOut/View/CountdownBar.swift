import SwiftUI

struct CountdownBar: View {
    @Binding var reset: Bool  // ← Binding trigger
    var onComplete: () -> Void

    @State private var progress: CGFloat = 1.0
    @State private var timeLeft: CGFloat = 15.0
    let totalTime: CGFloat = 15.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color.gray.opacity(0.4))
                .frame(height: 10)

            Rectangle()
                .fill(Color.white)
                .frame(maxWidth: .infinity)
                .scaleEffect(x: progress, y: 1, anchor: .leading)
        }
        .frame(height: 10)
        .onReceive(timer) { _ in
            if timeLeft > 0 {
                timeLeft -= 0.1
                withAnimation(.linear(duration: 0.1)) {
                    progress = timeLeft / totalTime
                }
            } else {
                timer.upstream.connect().cancel()
                DispatchQueue.main.async {
                    onComplete()
                }
            }
        }
        .onChange(of: reset) { newValue in
            if newValue {
                timeLeft = totalTime
                progress = 1.0
                reset = false
            }
        }
    }
}
