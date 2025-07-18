import SwiftUI

struct CountdownBar: View {
    @Binding var reset: Bool
    var onComplete: () -> Void

    @State private var timeLeft: CGFloat = 15.0
    let totalTime: CGFloat = 15.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var progress: CGFloat {
        timeLeft / totalTime
    }

    var body: some View {
        ProgressView(value: Double(progress))
            .progressViewStyle(LinearProgressViewStyle(tint: .white))
            .background(Color.gray.opacity(0.4))
            .frame(maxWidth: .infinity, maxHeight: 10)
            .scaleEffect(x: 1, y: 1, anchor: .center)
            .onReceive(timer) { _ in
                if timeLeft > 0 {
                    timeLeft -= 0.1
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
                    reset = false
                }
            }
    }
}
