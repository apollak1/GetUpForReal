//  Created by Lindsay, Joel, and Andrew

import SwiftUI

struct ContentView: View
{
    @State private var sittingMin = 0.0
    @State private var moveMin = 0.0
    @State var timer: Timer?
    @State var seconds = 0
    @State var minutes = 0
    @State var timeString = "No time to display"
    @State var isPaused = false
    
    var body: some View
    {
        NavigationView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .frame(width:400.0, height: 100.0)
                        .foregroundColor(.yellow)
                    Text("The GetUP!")
                        .font(.largeTitle)
                        .bold()
                }
                Text("Set Timers To Your Liking!")
                Group {
                    HStack {
                       Text("Sitting Min:")
                        .padding()
                       VStack {
                        Slider(value: $sittingMin, in: 30.0...60.0)
                            .padding([.top, .leading, .trailing])
                        
                        HStack {
                            Text("30")
                            Spacer()
                            Text("60")
                        }
                        .padding(.horizontal)
                        
                       }
                       .padding()
                    }
                    
                    HStack {
                       Text("Move Min:")
                        .padding()
                       VStack {
                        Slider(value: $moveMin, in: 5.0...15.0)
                            .padding([.top, .leading, .trailing])
                        HStack {
                            Text("5")
                            Spacer()
                            Text("15")
                        }
                        .padding(.horizontal)
                        
                       }
                       .padding()
                    }
                }
                Group {
                    VStack {
                        HStack{
                            Text("Add Five Minutes:")
                                .padding()
                            Spacer()
                            Button(action: {minutes = minutes + 5},
                                   label: {Text("ADD FIVE")
                            })
                            .padding()
                            Spacer()
                        }
                        HStack{
                            Button(action: {
                                            minutes = Int(sittingMin)
                                            timer = Timer.scheduledTimer(withTimeInterval: 1,
                                            repeats: true,
                                            block: timeCalculator)
                                        }, label: {
                                            Text("START")
                                        }).padding()
                            
                            Spacer(minLength: 50)
                            
                            Button(action: {
                                if (self.isPaused) {
                                    timer = Timer.scheduledTimer(withTimeInterval: 1,
                                    repeats: true,
                                    block: timeCalculator)
                                } else {
                                    timer?.invalidate()
                                }
                                self.isPaused = !self.isPaused
                                    },
                                label: {
                                    Text(self.isPaused ? "RESTART" : "PAUSE" )
                            })
                            .padding()
                            
                            Spacer()
                            
                            Button(action: {
                                            timer?.invalidate()
                                            minutes = 0
                                            seconds = 0
                                    },
                                label: {
                                    Text("END")
                            })
                            .padding()
                            Spacer()
                        }
                    }
                }
               
                Text(String(format: "%02d:%02d", minutes, seconds))
                    .bold()
                    .font(.system(size: 50))
                    .padding()
                    
                HStack
                                    {
                                        Text("Song: ")
                                        Text("display current song here")
                                    }
                Spacer()
                
            }
            .navigationBarItems(leading:
            HStack {
                NavigationLink(
                    destination: HelpScreen(),
                    label: {
                        Text("Help")
                    })
                Spacer(minLength: 300)
                NavigationLink(
                    destination: MoreScreen(),
                    label: {
                        Text("More")
                    })
            })
        }
        
    }
    func timeCalculator(timer: Timer) {
        if(seconds == 0)
        {
            minutes = minutes - 1
            seconds = 59
        }
        else
        {
            seconds = seconds - 1
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}

