//
//  ContentView.swift
//  BusinessCrime
//
//  Created by Tim Jarratt on 25/03/2020.
//  Copyright © 2020 General Linear Group. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var partyTime = false
    @State private var showButton = false

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Rectangle()
                .fill(Color.gray)
                .frame(width: geometry.size.width, height: geometry.size.height * 0.1, alignment: .center)
                Text("IS IT FRIDAY ALREADY ?")
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.2, alignment: .center)
                Spacer()

                if self.showButton {
                    Button(action: {self.partyTime.toggle()}) {
                        Text("SUBMIT")
                    }
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.1, alignment: .center)
                        .transition(AnyTransition.opacity
                        .animation(.easeIn(duration: 5.0)))
                }
            }
        }
        .background(Color.gray)
        .onAppear(perform: animateButton)
    }

    private func animateButton() {
        showButton = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
