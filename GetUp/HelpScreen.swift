//  Created by Lindsay, Joel, and Andrew
//

import SwiftUI

struct HelpScreen: View {
    var body: some View {
        VStack {
            VStack {
                Text("GetUP!").bold()
                Text("Welcome to GetUP! the app that gets you up from sitting all day long. As you know, studies have shown that sitting for protracted amounts of time is very unhealthy. GetUP! helps you counteract that unhealthy life by breaking up the time to move your body to music.")
            }

            VStack {
                Text("How to Operate").bold()
                Text("GetUP! Is very easy to operate. Slide the Sitting Timer and the Moving Timer to your desired times and GetUP! automatically starts counting down to a healthier life.")
            }

            VStack {
                Text("Pause").bold()
                Text("Let’s say you are at work and working on an important task and GetUP! starts up the music. You can press the PAUSE button and the music will stop with 5 minutes added to the sitting timer that counts down again.")
            }

            VStack {
                Text("Restart").bold()
                Text("Press this button to restart your Sitting & Move timer.")
            }
                
            VStack {
                Text("Stop").bold()
                Text("Press this button stop all timers and music until you press RESTART.")
            }
            
            VStack {
                Text("Song").bold()
                Text("Press the SONG button to pick which of the free songs listed you want played when you GetUP! If you want to add your iTunes and playlists to GetUP! then click the MORE button.")
            }

            VStack {
                Text("Right/Left Orientation & iTunes").bold()
                Text("Click the MORE button to orient your display for left or right hand. Right handed orientation is the default. From here you can also connect GetUP! to your iTunes and playlists. This way you have even more GetUP! fun as you stay healthier.")
            }
        }
    }
}

struct HelpScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HelpScreen()
            HelpScreen()
        }
    }
}
