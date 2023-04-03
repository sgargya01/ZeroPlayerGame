//
//  Helpers.swift
//  Text Adventure
//
//  Created by admin on 1/8/19.
//  Copyright © 2019 admin. All rights reserved.
//importing foundation
import Foundation

//creating function getRando to generate a random number
func getRando(_ upperLimit : Int) -> Int {
    //returning the random number
    return Int.random(in: 0...upperLimit)
}

//a function to clear the screen by printing walk over many lines
func clearScreen () {
    //creating a for loop that prints walk a random amount of times per line
    for _ in 1...10 {
        //create the random number
        let stepCount : Int = getRando(2)
        //define an empty string
        var steps : String = ""
        //create a for loop that adds the work walk to the empty string
        for _ in 0...stepCount {
            steps = steps + " walk"
        }
        //prints the entire thing
        print(steps)
    }
}
