import SwiftUI
import AVKit

struct ContentView: View {
    @State var audioPlayer: AVAudioPlayer!
    @State var count = 1
    @State var songCount = 4
    @State var isPlaying = false
    
    var body: some View {
        ZStack
        {
            Color.gray
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack
                {
                    Text("MusicPlayer")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                }
                HStack
                {
                    Spacer()
                    
                    //CODE FOR PREV SONG BUTTON STARTS HERE
                    Button(action: {
                        if(self.count > 1)
                        {
                            self.count -= 1
                        }
                        else //if self.count has hit last song, return to song 1
                        {
                            self.count = songCount
                        }
                        
                        let sound = Bundle.main.path(forResource: "Song\(self.count)", ofType: "mp3")
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                        self.audioPlayer.play()
                    })
                    {
                        //Skip button image goes here
                        Image(systemName: "backward.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.green)
                    }
                    
                    //----------------------------------
                    Spacer()
                    //CODE FOR PLAY BUTTON STARTS HERE
                    Button(action:{
                        self.audioPlayer.play()
                        isPlaying = true
                    })
                    {
                        Image(systemName: "play.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.green)
                    }
                    
                    //---------------------------------
                    Spacer()
                    
                    //CODE FOR PAUSE BUTTON STARTS HERE
                    Button(action: {
                        self.audioPlayer.pause()
                        isPlaying = false
                    })
                    {
                        Image(systemName: "pause.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.green)
                    }
                    
                    //---------------------------------
                    Spacer()
                    
                    //CODE FOR SKIP BUTTON STARTS HERE
                    Button(action: {
                        if(self.count < songCount)    //replace '4' here with num of songs-1
                        {
                            self.count += 1
                        }
                        else //if self.count has hit last song, return to song 1
                        {
                            self.count = 1
                        }
                        
                        let sound = Bundle.main.path(forResource: "Song\(self.count)", ofType: "mp3")
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                        self.audioPlayer.play()
                    })
                    {
                        //Skip button image goes here
                        Image(systemName: "forward.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.green)
                    }
                    
                    Spacer()
                }
                
                //Adding volume slider
                //HStack
                //{
                //Slider(value: self.audioPlayer.volume)
                //}
            }
        }
        
        //display audioplayer when view appears
        .onAppear
        {
            let sound = Bundle.main.path(forResource: "Song1", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        
    }
}
