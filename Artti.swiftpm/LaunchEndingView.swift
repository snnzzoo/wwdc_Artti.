import SwiftUI


struct LaunchView: View {
    

    @State private var fadeInOut = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Artti.")
                    .font(.custom("Futura Bold", size: 50))
                    .padding(.bottom, 1)
                
                Text("your articulation helper")
                    .font(.custom("Futura Medium", size: 25))
                    .padding(.bottom, 110)
                
                Image("sun_icon")
                    .resizable()
                    .frame(width: 170, height: 170)
                    
                
                NavigationLink(destination: WordView()) {
                    Text("start")
                        .font(.custom("Futura Bold", size: 26))
                        .frame(width: 300, height: 30)
                        .foregroundColor(Color.white)
                        .padding()
                        .offset(y: -3)
                        .background(Color("Violet"))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.top, 100)
                        .onAppear() {
                            withAnimation(Animation.easeInOut(duration: 1.5)
                                .repeatForever(autoreverses: true)) {
                                    fadeInOut.toggle()
                                }
                        }.opacity(fadeInOut ? 0.4 : 1)
                }
                
                Spacer()
                
            }
        }
        .navigationViewStyle(.stack)
    }
}


struct EndingView: View {
    var body: some View {
        VStack {
            Image("sun_icon")
                .resizable()
                .frame(width: 140, height: 140)
                .padding(.trailing, 5)
            Text("Well done!")
                .font(.custom("Futura Bold", size: 40))
                .foregroundColor(Color("Violet"))
                .padding(.bottom, 4)
            Text("Keep up the great work")
                .font(.custom("Futura Medium", size: 20))
                .padding(.bottom, 0.5)
            Group{
                Text("with ")
                    .font(.custom("Futura Medium", size: 20)) +
                Text("Artti.")
                    .font(.custom("Futura Bold", size: 20))
            }
        }
        .padding(.top, -50)
        
    }
}


struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}

struct EndingView_Previews: PreviewProvider {
    static var previews: some View {
        EndingView()
    }
}
