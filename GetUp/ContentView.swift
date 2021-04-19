//  Created by Lindsay, Joel, and Andrew

import SwiftUI

struct ContentView: View
{
    @State private var sittingMin = 0.0
    @State private var moveMin = 0.0

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
                            Text("Pause Five:")
                                .padding()
                            Spacer()
                            Button(action: {}, label: {
                                Text("PAUSE")
                            })
                            .padding()
                            Spacer()
                        }
                        HStack{
                            Button(action: {}, label: {
                                Text("Restart")
                            }).padding()
                            Spacer(minLength: 134)
                            Button(action: {}, label: {
                                Text("STOP")
                            })
                            .padding()
                            Spacer()
                        }
                    }
                }
                
                Text("00:00")
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
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}

