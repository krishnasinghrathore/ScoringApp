//
//  scoring.swift
//  Axe Master App - Stand alone
//
//  Created by Nick on 1/3/20.
//  Copyright © 2020 Nick. All rights reserved.
//

// -----------------------------
// Breif Documentation
// (Desinged for iPad 7th Gen)
// -----------------------------
//
// Click on a score (one of the 3 rings, drop, or kill shot).
// Click on a dark grey box to commit the score.
// You can give P1 or P2 a score first - it doesn't matter.
// Repeat for the other player to complete the round.
// The next round becomes active as seen by the next column
// of boxes becoming dark grey and allowing input.
// Continue this until all boxes are filled with scores.
//
// If you click a point value you didn't mean to before
// commiting the score to a box, just re-click the correct
// amount of points and then click the box to commit.
// If you enter a wrong value, just click on the correct
// point value and click on the wrong round score - it will
// overwrite and repalce the wrong score. You can do this at
// any time. Ex: In round 5 fix a round 1 score.
//
// Player scores are shown at the top with the difference
// between P1 and P2 displayed as a positive difference next
// to the winning/leading player.
//
// To reset for any reason, click 'Reset' at the top.
// This clears all values and starts the game over.


// If you are reading this code... I am so sorry...
// At least you get to reduce the # of lines by 90%

import SwiftUI

struct ContentView: View {
    
    @State private var p1Score = 0
    @State private var p2Score = 0
    
    @State private var scoreDiff = 0
    
    @State private var p1r1Score = 0
    @State private var p1r2Score = 0
    @State private var p1r3Score = 0
    @State private var p1r4Score = 0
    @State private var p1r5Score = 0
    
    @State private var p1r1Flag = false
    @State private var p1r2Flag = false
    @State private var p1r3Flag = false
    @State private var p1r4Flag = false
    @State private var p1r5Flag = false
    
    @State private var p2r1Score = 0
    @State private var p2r2Score = 0
    @State private var p2r3Score = 0
    @State private var p2r4Score = 0
    @State private var p2r5Score = 0
    
    @State private var p2r1Flag = false
    @State private var p2r2Flag = false
    @State private var p2r3Flag = false
    @State private var p2r4Flag = false
    @State private var p2r5Flag = false
    
    @State private var ksFlag = false
    @State private var bullseyeFlag = false
    @State private var middleFlag = false
    @State private var outerFlag = false
    @State private var dropFlag = false
    
    let KILLSHOT = 7
    let BULLSEYE = 5
    let MIDDLE = 3
    let OUTER = 1
    let DROP = 0
    
    var body: some View {
        VStack {
            Button(action: {
                
                self.p1Score = 0
                self.p2Score = 0
                
                self.scoreDiff = 0
                
                self.p1r1Score = 0
                self.p1r2Score = 0
                self.p1r3Score = 0
                self.p1r4Score = 0
                self.p1r5Score = 0
                
                self.p1r1Flag = false
                self.p1r2Flag = false
                self.p1r3Flag = false
                self.p1r4Flag = false
                self.p1r5Flag = false
                
                self.p2r1Score = 0
                self.p2r2Score = 0
                self.p2r3Score = 0
                self.p2r4Score = 0
                self.p2r5Score = 0
                
                self.p2r1Flag = false
                self.p2r2Flag = false
                self.p2r3Flag = false
                self.p2r4Flag = false
                self.p2r5Flag = false
                
                self.ksFlag = false
                self.bullseyeFlag = false
                self.middleFlag = false
                self.outerFlag = false
                self.dropFlag = false
            }) {
                Text("Reset")
            }
            VStack {
                VStack {
                    VStack {
                        // P1 and P2 Scores w/ diff
                        HStack {
                            Text("P1: \(p1Score)").bold().font(.largeTitle)
                            if ((p1Score - p2Score) > 0) {
                                Text("(+\(scoreDiff))").bold().font(.title).foregroundColor(.gray)
                            }
                            Spacer().frame(width: 400)
                            Text("P2: \(p2Score)").bold().font(.largeTitle)
                            if ((p1Score - p2Score) < 0) {
                                Text("(+\(abs(scoreDiff)))").bold().font(.title).foregroundColor(.gray)
                            }
                        }
                        Spacer().frame(height: 100)
                        HStack {
                            // 3 Bullseye Rings
                            ZStack {
                                Circle().fill(Color.red).frame(width: 600, height: 500).onTapGesture {
                                    self.outerFlag = true
                                }
                                Circle().fill(Color.white).frame(width: 325, height: 325).onTapGesture {
                                    self.middleFlag = true
                                }
                                Circle().fill(Color.black).frame(width: 150, height: 150).onTapGesture {
                                    self.bullseyeFlag = true
                                }
                            }
                            VStack {
                                // Kill Shot/ Clutch (+7)
                                // Remove this and uncomment below if you want to have the killshot only available on the 5th round
                                Circle().fill(Color.green).frame(width: 100, height: 100).onTapGesture {
                                    self.ksFlag = true
                                }
                                /*if p1r1Flag && p1r2Flag && p1r3Flag && p1r4Flag && p2r1Flag && p2r2Flag && p2r3Flag && p2r4Flag {
                                    Circle().fill(Color.green).frame(width: 100, height: 100).onTapGesture {
                                        self.ksFlag = true
                                    }
                                }
                                else {
                                    Circle().fill(Color.green).frame(width: 100, height: 100).opacity(0.5).blur(radius: 2.5)
                                }*/
                                Spacer().frame(height:350)
                                // Drop (+0)
                                Button(action: {self.dropFlag = true}) {
                                    Text("Drop").font(.title)
                                }
                            }
                        }
                        Spacer().frame(height: 100)
                        // Unblurs/allows scores to be put into the next round once both players have a score for that round
                        // Ex: P1 R1 score and P2 R1 score are filled in. This unblurs R2 score boxes...
                        HStack {
                            Text("P1:").bold().font(.title)
                            ZStack {
                                Rectangle().fill(Color.gray).frame(width: 80, height: 80).onTapGesture {
                                    if self.ksFlag {
                                        self.p1Score -= self.p1r1Score
                                        self.p1r1Score = self.KILLSHOT
                                        self.p1Score += self.p1r1Score
                                        self.p1r1Flag = true
                                    }
                                    if self.bullseyeFlag {
                                        self.p1Score -= self.p1r1Score
                                        self.p1r1Score = self.BULLSEYE
                                        self.p1Score += self.p1r1Score
                                        self.p1r1Flag = true
                                    }
                                    if self.middleFlag {
                                        self.p1Score -= self.p1r1Score
                                        self.p1r1Score = self.MIDDLE
                                        self.p1Score += self.p1r1Score
                                        self.p1r1Flag = true
                                    }
                                    if self.outerFlag {
                                        self.p1Score -= self.p1r1Score
                                        self.p1r1Score = self.OUTER
                                        self.p1Score += self.p1r1Score
                                        self.p1r1Flag = true
                                    }
                                    if self.dropFlag {
                                        self.p1Score -= self.p1r1Score
                                        self.p1r1Score = self.DROP
                                        self.p1Score += self.p1r1Score
                                        self.p1r1Flag = true
                                    }
                                    self.ksFlag = false
                                    self.bullseyeFlag = false
                                    self.middleFlag = false
                                    self.outerFlag = false
                                    self.dropFlag = false
                                    self.scoreDiff = self.p1Score - self.p2Score
                                }
                                if p1r1Flag {
                                    Text("\(p1r1Score)").bold().font(.title).foregroundColor(.white)
                                }
                            }
                            Spacer().frame(width: 50)
                            if p1r1Flag && p2r1Flag {
                                ZStack {
                                    Rectangle().fill(Color.gray).frame(width: 80, height: 80).onTapGesture {
                                        if self.ksFlag {
                                            self.p1Score -= self.p1r2Score
                                            self.p1r2Score = self.KILLSHOT
                                            self.p1Score += self.p1r2Score
                                            self.p1r2Flag = true
                                        }
                                        if self.bullseyeFlag {
                                            self.p1Score -= self.p1r2Score
                                            self.p1r2Score = self.BULLSEYE
                                            self.p1Score += self.p1r2Score
                                            self.p1r2Flag = true
                                        }
                                        if self.middleFlag {
                                            self.p1Score -= self.p1r2Score
                                            self.p1r2Score = self.MIDDLE
                                            self.p1Score += self.p1r2Score
                                            self.p1r2Flag = true
                                        }
                                        if self.outerFlag {
                                            self.p1Score -= self.p1r2Score
                                            self.p1r2Score = self.OUTER
                                            self.p1Score += self.p1r2Score
                                            self.p1r2Flag = true
                                        }
                                        if self.dropFlag {
                                            self.p1Score -= self.p1r2Score
                                            self.p1r2Score = self.DROP
                                            self.p1Score += self.p1r2Score
                                            self.p1r2Flag = true
                                        }
                                        self.ksFlag = false
                                        self.bullseyeFlag = false
                                        self.middleFlag = false
                                        self.outerFlag = false
                                        self.dropFlag = false
                                        self.scoreDiff = self.p1Score - self.p2Score
                                    }
                                    if p1r2Flag {
                                        Text("\(p1r2Score)").bold().font(.title).foregroundColor(.white)
                                    }
                                }
                            }
                            else {
                                ZStack {
                                    Rectangle().fill(Color.gray).frame(width: 80, height: 80).opacity(0.7).blur(radius: 1.5)
                                }
                            }
                            Spacer().frame(width: 50)
                            if p1r1Flag && p1r2Flag && p2r1Flag && p2r2Flag {
                                ZStack {
                                    Rectangle().fill(Color.gray).frame(width: 80, height: 80).onTapGesture {
                                        if self.ksFlag {
                                            self.p1Score -= self.p1r3Score
                                            self.p1r3Score = self.KILLSHOT
                                            self.p1Score += self.p1r3Score
                                            self.p1r3Flag = true
                                        }
                                        if self.bullseyeFlag {
                                            self.p1Score -= self.p1r3Score
                                            self.p1r3Score = self.BULLSEYE
                                            self.p1Score += self.p1r3Score
                                            self.p1r3Flag = true
                                        }
                                        if self.middleFlag {
                                            self.p1Score -= self.p1r3Score
                                            self.p1r3Score = self.MIDDLE
                                            self.p1Score += self.p1r3Score
                                            self.p1r3Flag = true
                                        }
                                        if self.outerFlag {
                                            self.p1Score -= self.p1r3Score
                                            self.p1r3Score = self.OUTER
                                            self.p1Score += self.p1r3Score
                                            self.p1r3Flag = true
                                        }
                                        if self.dropFlag {
                                            self.p1Score -= self.p1r3Score
                                            self.p1r3Score = self.DROP
                                            self.p1Score += self.p1r3Score
                                            self.p1r3Flag = true
                                        }
                                        self.ksFlag = false
                                        self.bullseyeFlag = false
                                        self.middleFlag = false
                                        self.outerFlag = false
                                        self.dropFlag = false
                                        self.scoreDiff = self.p1Score - self.p2Score
                                    }
                                    if p1r3Flag {
                                        Text("\(p1r3Score)").bold().font(.title).foregroundColor(.white)
                                    }
                                }
                            }
                            else {
                                ZStack {
                                    Rectangle().fill(Color.gray).frame(width: 80, height: 80).opacity(0.7).blur(radius: 1.5)
                                }
                            }
                            Spacer().frame(width: 50)
                            if p1r1Flag && p1r2Flag && p1r3Flag && p2r1Flag && p2r2Flag && p2r3Flag {
                                ZStack {
                                    Rectangle().fill(Color.gray).frame(width: 80, height: 80).onTapGesture {
                                        if self.ksFlag {
                                            self.p1Score -= self.p1r4Score
                                            self.p1r4Score = self.KILLSHOT
                                            self.p1Score += self.p1r4Score
                                            self.p1r4Flag = true
                                        }
                                        if self.bullseyeFlag {
                                            self.p1Score -= self.p1r4Score
                                            self.p1r4Score = self.BULLSEYE
                                            self.p1Score += self.p1r4Score
                                            self.p1r4Flag = true
                                        }
                                        if self.middleFlag {
                                            self.p1Score -= self.p1r4Score
                                            self.p1r4Score = self.MIDDLE
                                            self.p1Score += self.p1r4Score
                                            self.p1r4Flag = true
                                        }
                                        if self.outerFlag {
                                            self.p1Score -= self.p1r4Score
                                            self.p1r4Score = self.OUTER
                                            self.p1Score += self.p1r4Score
                                            self.p1r4Flag = true
                                        }
                                        if self.dropFlag {
                                            self.p1Score -= self.p1r4Score
                                            self.p1r4Score = self.DROP
                                            self.p1Score += self.p1r4Score
                                            self.p1r4Flag = true
                                        }
                                        self.ksFlag = false
                                        self.bullseyeFlag = false
                                        self.middleFlag = false
                                        self.outerFlag = false
                                        self.dropFlag = false
                                        self.scoreDiff = self.p1Score - self.p2Score
                                    }
                                    if p1r4Flag {
                                        Text("\(p1r4Score)").bold().font(.title).foregroundColor(.white)
                                    }
                                }
                            }
                            else {
                                ZStack {
                                    Rectangle().fill(Color.gray).frame(width: 80, height: 80).opacity(0.7).blur(radius: 1.5)
                                }
                            }
                            Spacer().frame(width: 50)
                            if p1r1Flag && p1r2Flag && p1r3Flag && p1r4Flag && p2r1Flag && p2r2Flag && p2r3Flag && p2r4Flag {
                                ZStack {
                                    Rectangle().fill(Color.gray).frame(width: 80, height: 80).onTapGesture {
                                        if self.ksFlag {
                                            self.p1Score -= self.p1r5Score
                                            self.p1r5Score = self.KILLSHOT
                                            self.p1Score += self.p1r5Score
                                            self.p1r5Flag = true
                                        }
                                        if self.bullseyeFlag {
                                            self.p1Score -= self.p1r5Score
                                            self.p1r5Score = self.BULLSEYE
                                            self.p1Score += self.p1r5Score
                                            self.p1r5Flag = true
                                        }
                                        if self.middleFlag {
                                            self.p1Score -= self.p1r5Score
                                            self.p1r5Score = self.MIDDLE
                                            self.p1Score += self.p1r5Score
                                            self.p1r5Flag = true
                                        }
                                        if self.outerFlag {
                                            self.p1Score -= self.p1r5Score
                                            self.p1r5Score = self.OUTER
                                            self.p1Score += self.p1r5Score
                                            self.p1r5Flag = true
                                        }
                                        if self.dropFlag {
                                            self.p1Score -= self.p1r5Score
                                            self.p1r5Score = self.DROP
                                            self.p1Score += self.p1r5Score
                                            self.p1r5Flag = true
                                        }
                                        self.ksFlag = false
                                        self.bullseyeFlag = false
                                        self.middleFlag = false
                                        self.outerFlag = false
                                        self.dropFlag = false
                                        self.scoreDiff = self.p1Score - self.p2Score
                                    }
                                    if p1r5Flag {
                                        Text("\(p1r5Score)").bold().font(.title).foregroundColor(.white)
                                    }
                                }
                            }
                            else {
                                ZStack {
                                    Rectangle().fill(Color.gray).frame(width: 80, height: 80).opacity(0.7).blur(radius: 1.5)
                                }
                            }
                        }
                        Spacer().frame(height: 50)
                        HStack {
                            Text("P2:").bold().font(.title)
                            ZStack {
                                Rectangle().fill(Color.gray).frame(width: 80, height: 80).onTapGesture {
                                    if self.ksFlag {
                                        self.p2Score -= self.p2r1Score
                                        self.p2r1Score = self.KILLSHOT
                                        self.p2Score += self.p2r1Score
                                        self.p2r1Flag = true
                                    }
                                    if self.bullseyeFlag {
                                        self.p2Score -= self.p2r1Score
                                        self.p2r1Score = self.BULLSEYE
                                        self.p2Score += self.p2r1Score
                                        self.p2r1Flag = true
                                    }
                                    if self.middleFlag {
                                        self.p2Score -= self.p2r1Score
                                        self.p2r1Score = self.MIDDLE
                                        self.p2Score += self.p2r1Score
                                        self.p2r1Flag = true
                                    }
                                    if self.outerFlag {
                                        self.p2Score -= self.p2r1Score
                                        self.p2r1Score = self.OUTER
                                        self.p2Score += self.p2r1Score
                                        self.p2r1Flag = true
                                    }
                                    if self.dropFlag {
                                        self.p2Score -= self.p2r1Score
                                        self.p2r1Score = self.DROP
                                        self.p2Score += self.p2r1Score
                                        self.p2r1Flag = true
                                    }
                                    self.ksFlag = false
                                    self.bullseyeFlag = false
                                    self.middleFlag = false
                                    self.outerFlag = false
                                    self.dropFlag = false
                                    self.scoreDiff = self.p1Score - self.p2Score
                                }
                                if p2r1Flag {
                                    Text("\(p2r1Score)").bold().font(.title).foregroundColor(.white)
                                }
                            }
                            Spacer().frame(width: 50)
                            if p2r1Flag && p1r1Flag {
                                ZStack {
                                    Rectangle().fill(Color.gray).frame(width: 80, height: 80).onTapGesture {
                                        if self.ksFlag {
                                            self.p2Score -= self.p2r2Score
                                            self.p2r2Score = self.KILLSHOT
                                            self.p2Score += self.p2r2Score
                                            self.p2r2Flag = true
                                        }
                                        if self.bullseyeFlag {
                                            self.p2Score -= self.p2r2Score
                                            self.p2r2Score = self.BULLSEYE
                                            self.p2Score += self.p2r2Score
                                            self.p2r2Flag = true
                                        }
                                        if self.middleFlag {
                                            self.p2Score -= self.p2r2Score
                                            self.p2r2Score = self.MIDDLE
                                            self.p2Score += self.p2r2Score
                                            self.p2r2Flag = true
                                        }
                                        if self.outerFlag {
                                            self.p2Score -= self.p2r2Score
                                            self.p2r2Score = self.OUTER
                                            self.p2Score += self.p2r2Score
                                            self.p2r2Flag = true
                                        }
                                        if self.dropFlag {
                                            self.p2Score -= self.p2r2Score
                                            self.p2r2Score = self.DROP
                                            self.p2Score += self.p2r2Score
                                            self.p2r2Flag = true
                                        }
                                        self.ksFlag = false
                                        self.bullseyeFlag = false
                                        self.middleFlag = false
                                        self.outerFlag = false
                                        self.dropFlag = false
                                        self.scoreDiff = self.p1Score - self.p2Score
                                    }
                                    if p2r2Flag {
                                        Text("\(p2r2Score)").bold().font(.title).foregroundColor(.white)
                                    }
                                }
                            }
                            else {
                                ZStack {
                                    Rectangle().fill(Color.gray).frame(width: 80, height: 80).opacity(0.7).blur(radius: 1.5)
                                }
                            }
                            Spacer().frame(width: 50)
                            if p2r1Flag && p2r2Flag && p1r1Flag && p1r2Flag {
                                ZStack {
                                    Rectangle().fill(Color.gray).frame(width: 80, height: 80).onTapGesture {
                                        if self.ksFlag {
                                            self.p2Score -= self.p2r3Score
                                            self.p2r3Score = self.KILLSHOT
                                            self.p2Score += self.p2r3Score
                                            self.p2r3Flag = true
                                        }
                                        if self.bullseyeFlag {
                                            self.p2Score -= self.p2r3Score
                                            self.p2r3Score = self.BULLSEYE
                                            self.p2Score += self.p2r3Score
                                            self.p2r3Flag = true
                                        }
                                        if self.middleFlag {
                                            self.p2Score -= self.p2r3Score
                                            self.p2r3Score = self.MIDDLE
                                            self.p2Score += self.p2r3Score
                                            self.p2r3Flag = true
                                        }
                                        if self.outerFlag {
                                            self.p2Score -= self.p2r3Score
                                            self.p2r3Score = self.OUTER
                                            self.p2Score += self.p2r3Score
                                            self.p2r3Flag = true
                                        }
                                        if self.dropFlag {
                                            self.p2Score -= self.p2r3Score
                                            self.p2r3Score = self.DROP
                                            self.p2Score += self.p2r3Score
                                            self.p2r3Flag = true
                                        }
                                        self.ksFlag = false
                                        self.bullseyeFlag = false
                                        self.middleFlag = false
                                        self.outerFlag = false
                                        self.dropFlag = false
                                        self.scoreDiff = self.p1Score - self.p2Score
                                    }
                                    if p2r3Flag {
                                        Text("\(p2r3Score)").bold().font(.title).foregroundColor(.white)
                                    }
                                }
                            }
                            else {
                                ZStack {
                                    Rectangle().fill(Color.gray).frame(width: 80, height: 80).opacity(0.7).blur(radius: 1.5)
                                }
                            }
                            Spacer().frame(width: 50)
                            if p2r1Flag && p2r2Flag && p2r3Flag && p1r1Flag && p1r2Flag && p1r3Flag {
                                ZStack {
                                    Rectangle().fill(Color.gray).frame(width: 80, height: 80).onTapGesture {
                                        if self.ksFlag {
                                            self.p2Score -= self.p2r4Score
                                            self.p2r4Score = self.KILLSHOT
                                            self.p2Score += self.p2r4Score
                                            self.p2r4Flag = true
                                        }
                                        if self.bullseyeFlag {
                                            self.p2Score -= self.p2r4Score
                                            self.p2r4Score = self.BULLSEYE
                                            self.p2Score += self.p2r4Score
                                            self.p2r4Flag = true
                                        }
                                        if self.middleFlag {
                                            self.p2Score -= self.p2r4Score
                                            self.p2r4Score = self.MIDDLE
                                            self.p2Score += self.p2r4Score
                                            self.p2r4Flag = true
                                        }
                                        if self.outerFlag {
                                            self.p2Score -= self.p2r4Score
                                            self.p2r4Score = self.OUTER
                                            self.p2Score += self.p2r4Score
                                            self.p2r4Flag = true
                                        }
                                        if self.dropFlag {
                                            self.p2Score -= self.p2r4Score
                                            self.p2r4Score = self.DROP
                                            self.p2Score += self.p2r4Score
                                            self.p2r4Flag = true
                                        }
                                        self.ksFlag = false
                                        self.bullseyeFlag = false
                                        self.middleFlag = false
                                        self.outerFlag = false
                                        self.dropFlag = false
                                        self.scoreDiff = self.p1Score - self.p2Score
                                    }
                                    if p2r4Flag {
                                        Text("\(p2r4Score)").bold().font(.title).foregroundColor(.white)
                                    }
                                }
                            }
                            else {
                                ZStack {
                                    Rectangle().fill(Color.gray).frame(width: 80, height: 80).opacity(0.7).blur(radius: 1.5)
                                }
                            }
                            Spacer().frame(width: 50)
                            if p2r1Flag && p2r2Flag && p2r3Flag && p2r4Flag && p1r1Flag && p1r2Flag && p1r3Flag && p1r4Flag {
                                ZStack {
                                    Rectangle().fill(Color.gray).frame(width: 80, height: 80).onTapGesture {
                                        if self.ksFlag {
                                            self.p2Score -= self.p2r5Score
                                            self.p2r5Score = self.KILLSHOT
                                            self.p2Score += self.p2r5Score
                                            self.p2r5Flag = true
                                        }
                                        if self.bullseyeFlag {
                                            self.p2Score -= self.p2r5Score
                                            self.p2r5Score = self.BULLSEYE
                                            self.p2Score += self.p2r5Score
                                            self.p2r5Flag = true
                                        }
                                        if self.middleFlag {
                                            self.p2Score -= self.p2r5Score
                                            self.p2r5Score = self.MIDDLE
                                            self.p2Score += self.p2r5Score
                                            self.p2r5Flag = true
                                        }
                                        if self.outerFlag {
                                            self.p2Score -= self.p2r5Score
                                            self.p2r5Score = self.OUTER
                                            self.p2Score += self.p2r5Score
                                            self.p2r5Flag = true
                                        }
                                        if self.dropFlag {
                                            self.p2Score -= self.p2r5Score
                                            self.p2r5Score = self.DROP
                                            self.p2Score += self.p2r5Score
                                            self.p2r5Flag = true
                                        }
                                        self.ksFlag = false
                                        self.bullseyeFlag = false
                                        self.middleFlag = false
                                        self.outerFlag = false
                                        self.dropFlag = false
                                        self.scoreDiff = self.p1Score - self.p2Score
                                    }
                                    if p2r5Flag {
                                        Text("\(p2r5Score)").bold().font(.title).foregroundColor(.white)
                                    }
                                }
                            }
                            else {
                                ZStack {
                                    Rectangle().fill(Color.gray).frame(width: 80, height: 80).opacity(0.7).blur(radius: 1.5)
                                }
                            }
                        }
                    }
                    Spacer().frame(height: 30)
                    Spacer().frame(height: 30)
                    Text("Made for AXEVENTURA")
                        .font(.footnote)
                        .fontWeight(.ultraLight)
                }
            }
        }
    }
}

struct scoring_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
