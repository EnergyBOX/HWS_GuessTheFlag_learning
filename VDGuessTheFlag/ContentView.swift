import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitel = ""
    @State private var scoreCount = 0

    
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Spacer()
                
                Text("Gues the Flag")
                    .foregroundStyle(.white)
                    .font(.largeTitle.bold())
                
         
                
                VStack(spacing: 10) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(num: number)
                            
                        } label: {
                            Image(countries[number])
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                            
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(Rectangle()).cornerRadius(20)
                
                Spacer()
                Spacer()
                
                Text("Score: \(scoreCount)")
                
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                
                Spacer()
                
            }
            .padding()
        }
        .alert(scoreTitel, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(scoreCount)")
        }
    }
    
    
    
    //MARK: continue hear
    func flagTapped(num: Int) {
        if num == correctAnswer {
            scoreCount += 1
        }
        
        switch scoreCount {
            case 0..<5 :
                scoreTitel = "Correct"
            case 5 :
                scoreTitel = "You are the WINNER"
                scoreCountResset()
            default :
                scoreTitel = "Wrong"
        }
        
        
        
        
        
        
        
        
        
//        if num == correctAnswer {
//            scoreCount += 1
//            if scoreCount >= 5 {
//                scoreTitel = "You are the WINNER"
//                scoreCountResset()
//            } else {
//                scoreTitel = "Correct"
//            }
//
//        } else {
//            scoreTitel = "Wrong"
//        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func scoreCountResset() {
        scoreCount = 0
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
