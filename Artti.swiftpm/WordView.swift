// https://iosfontlist.com/#availability=10.0&preinstalled

import SwiftUI
import AVKit

struct WordView: View {
    
    @State var sheetNumber = 0
    @State var word = ""
    @State var video = Bundle.main.url(forResource: "car", withExtension: "mp4")!
    @State private var drawRing1 = 1/99
    @State private var drawRing2 = 1/99
    @State private var drawRing3 = 1/99
    @State var currentVideoIndex = 0
    
    var player = AVPlayer()
    
    let videos: [URL] = [
        Bundle.main.url(forResource: "rain", withExtension: "mp4")!,
        Bundle.main.url(forResource: "rabbit", withExtension: "mp4")!,
        Bundle.main.url(forResource: "ring", withExtension: "mp4")!,
        Bundle.main.url(forResource: "car", withExtension: "mp4")!,
        Bundle.main.url(forResource: "dice", withExtension: "mp4")!,
        Bundle.main.url(forResource: "duck", withExtension: "mp4")!,
        Bundle.main.url(forResource: "glasses", withExtension: "mp4")!,
        Bundle.main.url(forResource: "whale", withExtension: "mp4")!,

    ]
    
    let wordList: [String] = [
        // #0
        "rain",
        // #1
        "rabbit",
        // #2
        "ring",
        // #3
        "car",
        // #4
        "dice",
        // #5
        "duck",
        // #6
        "glasses",
        // #7
        "whale"
    ]
    
    private func nextWord() {
        sheetNumber += 1
        word = wordList[sheetNumber]
        video = videos[sheetNumber]
        let item = AVPlayerItem(url: videos[sheetNumber])
        player.replaceCurrentItem(with: item)
    }
    
    private func prevWord() {
        if sheetNumber >= 1 {
            sheetNumber -= 1
            word = wordList[sheetNumber]
            video = videos[sheetNumber]
            let item = AVPlayerItem(url: videos[sheetNumber])
            player.replaceCurrentItem(with: item)
        }
    }
    
    private func resetButton() {

        drawRing1 = 1/99
        drawRing2 = 1/99
        drawRing3 = 1/99
    }
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            VStack(spacing: 8) {
                Text("Repeat after the video")
                    .font(.custom("Futura Bold", size: 25))
                Text("You may use the camera as a mirror!")
                    .font(.custom("Futura Medium", size: 20))
                    .multilineTextAlignment(.center)
                    .padding(.top, -1)
            }
            .padding(.horizontal, 18)
            
            VideoPlayer(player: player)
                .frame(width: 250, height: 250)
                .task {
                    let item = AVPlayerItem(url: videos[sheetNumber])
                    player.replaceCurrentItem(with: item)
                    
                }
                .onAppear {
                    player.play()
                }
                .onTapGesture {
                    player.seek(to: .zero)
                    player.play()
                }
            // 이게 안되네
                .onDisappear {
                    player.seek(to: .zero)
                    player.pause()
                }
                .padding(.top, 15)
            
            Text(wordList[sheetNumber])
                .font(.custom("Futura Bold", size: 40))
                .tracking(4)
            
            VStack(spacing: 15) {
                HStack(spacing: 35) {
                    
                    // Button 1
                    ZStack {
                        Text("1")
                            .font(.custom("Futura Medium", size: 30))
                            .foregroundColor(.white)
                            .frame(width: 55, height: 55)
                            .background(Circle()
                                .fill(Color.teal)
                                .opacity(0.4)
                            )
                            .padding(5)

                        Circle()
                            .trim(from: 0, to: CGFloat(drawRing1))
                            .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                            .frame(width: 62, height: 62, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .rotationEffect(.degrees(-90))
                            .foregroundColor(Color("Brick"))
                            .shadow(color: Color("Brick"), radius: 3)
                            .animation(Animation.easeInOut(duration: 1))
                        
                    }
                    .onTapGesture {
                        drawRing1 = 1
                    }
                    
//                    Button {
//                        isAnimateB2.toggle()
//                    } label: {
//                        ZStack {
//                            Text("2")
//                                .font(.custom("Futura Medium", size: 30))
//                                .foregroundColor(.white)
//                                .frame(width: 55, height: 55)
//                                .background(Circle()
//                                    .fill(Color.teal)
//                                    .opacity(0.7)
//                                )
//                                .padding(5)
//                            if isAnimateB2 {
//                                Spinner()
//                            }
//                        }
//                    }
                    
                    // Button 2
                    ZStack {
                        Text("2")
                            .font(.custom("Futura Medium", size: 30))
                            .foregroundColor(.white)
                            .frame(width: 55, height: 55)
                            .background(Circle()
                                .fill(Color.teal)
                                .opacity(0.7)
                            )
                            .padding(5)
                        
                        Circle()
                            .trim(from: 0, to: CGFloat(drawRing2))
                            .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                            .frame(width: 62, height: 62, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .rotationEffect(.degrees(-90))
                            .foregroundColor(Color("Brick"))
                            .shadow(color: Color("Brick"), radius: 3)
                            .animation(Animation.easeInOut(duration: 1))
                        
                    }
                    .onTapGesture {
                        drawRing2 = 1
                    }
                    
                    // Button 3
                    ZStack {
                        Text("3")
                            .font(.custom("Futura Medium", size: 30))
                            .foregroundColor(.white)
                            .frame(width: 55, height: 55)
                            .background(Circle()
                                .fill(Color.teal)
                                .opacity(1.0)
                            )
                            .padding(5)
                        Circle()
                            .trim(from: 0, to: CGFloat(drawRing3))
                            .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                            .frame(width: 62, height: 62, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .rotationEffect(.degrees(-90))
                            .foregroundColor(Color("Brick"))
                            .shadow(color: Color("Brick"), radius: 3)
                            .animation(Animation.easeInOut(duration: 1))
                        
                    }
                    .onTapGesture {
                        drawRing3 = 1
                    }
                }
                
                Text("Click the button each time you speak")
                    .font(.custom("Futura Medium", size: 19))
            }
            .padding(.bottom, 30)
            
            //            # 0
            if sheetNumber == 0 {
                HStack(spacing: 46.5) {
                    NavigationLink(destination: CameraView()) {
                        ZStack {
                            Image(systemName: "camera.circle.fill")
                                .resizable()
                                .foregroundColor(Color("Violet"))
                                .frame(width: 75, height: 75)
                        }
                    }
                    
                    .padding(.leading, 129)
                    NavigationLink(destination: WordView()) {
                        Image(systemName: "chevron.right")
                            .font(.custom("Futura Medium", size: 25))
                            .frame(width: 50, height: 30)
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.teal)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .onTapGesture {
                                nextWord()
                                resetButton()
                            }
                        
                            
                    }
                    
                }
                
            }
            
            //            # 1 - 6
            if sheetNumber >= 1 && sheetNumber < 7 {
                
                HStack(spacing: 46.5) {
                    NavigationLink(destination: WordView()) {
                        Image(systemName: "chevron.left")
                            .font(.custom("Futura Medium", size: 25))
                            .frame(width: 50, height: 30)
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.teal)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .onTapGesture {
                                prevWord()
                                resetButton()
                            }
                    }
                    
                    NavigationLink(destination: CameraView()) {
                        ZStack {
                            Image(systemName: "camera.circle.fill")
                                .resizable()
                                .foregroundColor(Color("Violet"))
                                .frame(width: 75, height: 75)
                        }
                    }
                    
                    NavigationLink(destination: WordView()) {
                        Image(systemName: "chevron.right")
                            .font(.custom("Futura Medium", size: 25))
                            .frame(width: 50, height: 30)
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.teal)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .onTapGesture {
                                nextWord()
                                resetButton()
                            }
                    }
                }
            }
            
            //            # 7
            if sheetNumber >= 7 {
                
                HStack(spacing: 46.5) {
                    NavigationLink(destination: WordView()) {
                        Image(systemName: "chevron.left")
                            .font(.custom("Futura Medium", size: 25))
                            .frame(width: 50, height: 30)
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.teal)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .onTapGesture {
                                prevWord()
                                resetButton()
                            }
                    }
                    
                    NavigationLink(destination: CameraView()) {
                        ZStack {
                            Image(systemName: "camera.circle.fill")
                                .resizable()
                                .foregroundColor(Color("Violet"))
                                .frame(width: 75, height: 75)
                        }
                    }
                    
                    NavigationLink(destination: EndingView()) {
                        Image(systemName: "chevron.right")
                            .font(.custom("Futura Medium", size: 30))
                            .frame(width: 50, height: 30)
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.teal)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
            }
        }
        
    }
}

struct WordViewPreviews: PreviewProvider {
    
    
    
    static var previews: some View {
        WordView()
    }
}
