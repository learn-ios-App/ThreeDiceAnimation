import SwiftUI

struct Dice {
    var diceNumber: Int
    
    init(diceNumber: Int) {
        self.diceNumber = diceNumber
    }
}

struct ContentView: View {
    @State var firstDice = Dice(diceNumber: 1)
    @State var secondDice = Dice(diceNumber: 2)
    @State var thirdDice = Dice(diceNumber: 3)
    
    @State var timer: Timer?
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Image(systemName: "die.face.\(firstDice.diceNumber)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width/3)
                    .padding()
                Image(systemName: "die.face.\(secondDice.diceNumber)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width/3)
                    .padding()
            }
            Image(systemName: "die.face.\(thirdDice.diceNumber)")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width/3)
                .padding()
            Spacer()
            
            Button(action: {
                timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                    firstDice.diceNumber = Int.random(in: 1...6)
                    secondDice.diceNumber = Int.random(in: 1...6)
                    thirdDice.diceNumber = Int.random(in: 1...6)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    timer?.invalidate()
                    timer = nil
                }
                ShuffleDice()
            }) {
                Text("Roll")
                    .font(.largeTitle)
            }
            Spacer()
        }
    }
    func ShuffleDice() {
        firstDice.diceNumber = Int.random(in: 1...6)
        secondDice.diceNumber = Int.random(in: 1...6)
        thirdDice.diceNumber = Int.random(in: 1...6)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
