//  Created by Lindsay, Joel, and Andrew

import SwiftUI

import AppDevWithSwiftLibrary



struct ContentView: View

{
    
    @State private var sittingMin = 1.0
    
    @State private var moveMin = 5.0
    
    @State var timer: Timer?
    
    @State var timer2: Timer?
    
    @State var secondsSit = 0
    
    @State var minutesSit = 0
    
    @State var secondsSong = 0
    
    @State var minutesSong = 0
    
    @State var timeString = "No time to display"
    
    @State var isPaused = false
    
    
    
    var body: some View
    
    {
        
        NavigationView {
            
            ZStack {
                
                Image("Magic Arrow-1")
                    
                    .resizable()
                    
                    .scaledToFit()
                    
                    .opacity(0.2)
                    
                    .frame(maxWidth: .infinity)
                
                VStack {
                    
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            
                            .frame(height: 100.0)
                            
                            .foregroundColor(.yellow)
                            
                            .padding()
                        
                        Text("The GetUP!")
                            
                            .font(.largeTitle)
                            
                            .bold()
                        
                    }
                    
                    Spacer()
                    
                    Text("Set Timers To Your Liking!")
                    
                    Group {
                        
                        HStack {
                            
                            Text("Sitting Min:")
                                
                                .padding()
                            
                            VStack {
                                
                                Slider(value: $sittingMin, in: 1.0...60.0)
                                    
                                    .padding([.top, .leading, .trailing])
                                
                                
                                
                                HStack {
                                    
                                    Text("1")
                                    
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
                                    
                                    .padding([.top, .leading,
                                              
                                              .trailing])
                                
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
                                
                                Spacer(minLength: 106)
                                
                                
                                
                                Button(action: {minutesSit = minutesSit + 5},
                                       
                                       label: {Text("+FIVE")
                                        
                                       })
                                    
                                    .padding()
                                    
                                    .border(Color.red, width: 5).cornerRadius(10)
                                    
                                    .background(Color.yellow   )
                                
                                Spacer()
                                
                            }
                            
                            HStack{
                                
                                Spacer(minLength: 30)
                                
                                Button(action: {
                                    
                                    minutesSit = Int(sittingMin)
                                    
                                    timer = Timer.scheduledTimer(withTimeInterval: 1,
                                                                 
                                                                 repeats: true,
                                                                 
                                                                 block: sitTimeCalculator)
                                    
                                }, label: {
                                    
                                    Text("START")
                                    
                                }).padding()
                                
                                .border(Color.red, width: 5).cornerRadius(10).background(Color.yellow   )
                                
                                
                                
                                Spacer(minLength: 30)
                                
                                
                                
                                Button(action: {
                                    
                                    if (self.isPaused) {
                                        
                                        timer = Timer.scheduledTimer(withTimeInterval: 1,
                                                                     
                                                                     repeats: true,
                                                                     
                                                                     block: sitTimeCalculator)
                                        
                                    } else {
                                        
                                        timer?.invalidate()
                                        
                                        
                                        
                                    }
                                    
                                    self.isPaused = !self.isPaused
                                    
                                },
                                
                                label: {
                                    
                                    Text(self.isPaused ? "RESTART" : "PAUSE" )
                                    
                                })
                                
                                .padding()
                                
                                .border(Color.red, width: 5).cornerRadius(10).background(Color.yellow   )
                                
                                
                                
                                Spacer()
                                
                                
                                
                                Button(action: {
                                    
                                    timer?.invalidate()
                                    
                                    minutesSit = 0
                                    
                                    secondsSit = 0
                                    minutesSong = 0
                                    secondsSong = 0
                                    
                                    AudioPlayer.shared.stop()
                                    
                                },
                                
                                label: {
                                    
                                    Text("END")
                                    
                                })
                                
                                .padding()
                                
                                .border(Color.red, width: 5).cornerRadius(10).background(Color.yellow   )
                                
                                Spacer()
                                
                            }
                            
                        }
                        
                    }
                    
                    
                    
                    if(!(minutesSit == 0 && secondsSit == 0))
                    
                    {
                        
                        Text(String(format: "%02d:%02d", minutesSit, secondsSit))
                            
                            .bold()
                            
                            .font(.system(size: 50))
                            
                            .padding()
                        
                    }
                    
                    else
                    
                    {
                        
                        Text(String(format: "%02d:%02d", minutesSong, secondsSong))
                            
                            .bold()
                            .font(.system(size: 50))
                            .padding()
                        
                    }
                    
                    HStack
                    
                    {
                        
                        Text("Song: ")
                        
                        Text("Lunar Walk.mp3")
                        
                    }
                    
                    Spacer()
                    
                    
                    
                    
                    
                }.navigationBarTitle("",displayMode: .inline)
                
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
        
    }
    
    func sitTimeCalculator(timerX: Timer) {
        
        if (secondsSit == 0 && minutesSit == 0) {
            
            timer?.invalidate()
            
            minutesSong = Int(moveMin)
            
            AudioPlayer.shared.play(name: "Lunar Walk", type: "mp3")
            
            timer2 = Timer.scheduledTimer(withTimeInterval: 1,
                                          
                                          repeats: true,
                                          
                                          block: songTimeCalculator)
            
            
            
        }
        
        else if(secondsSit == 0)
        
        {
            
            minutesSit = minutesSit - 1
            
            secondsSit = 59
            
        }
        
        else
        
        {
            
            secondsSit = secondsSit - 1
            
        }
        
    }
    
    
    
    func songTimeCalculator(timerX: Timer) {
        
        if (secondsSong == 0 && minutesSong == 0) {
            
            timer2?.invalidate()
            
            minutesSit = Int(sittingMin)
            
            AudioPlayer.shared.stop()
            
            timer = Timer.scheduledTimer(withTimeInterval: 1,
                                         
                                         repeats: true,
                                         
                                         block: sitTimeCalculator)
            
            
            
        }
        
        else if(secondsSong == 0)
        
        {
            
            minutesSong = minutesSong - 1
            
            secondsSong = 59
            
        }
        
        else
        
        {
            
            secondsSong = secondsSong - 1
            
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
