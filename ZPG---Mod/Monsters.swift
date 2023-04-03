//
//  Monsters.swift
//  Text Adventure
//
//  Created by admin on 1/8/19.
//  Copyright © 2019 admin. All rights reserved.
//
//importing foundation
import Foundation

//setup monster struct
struct Monster {
    //create variable to store the monsters name
    var name = String()
    //create variable to store the monsters hp
    var hitPoints = Int()
    //create variable to store the monsters hit rate
    var hitRate = Double()
    //create variable to store the monsters damage
    var damage = Int()
    
    //create function for the monsters attack, returns a boolean. True if successful attack. False otherwise
    func attacks() -> Bool { //returns true if hits
        //create random variable between 1 and 100
        let hitRoll : Int = getRando(99) + 1
        
        //if the random variable is less then the hit rate than the attack is successful
        if Double(hitRoll) < (self.hitRate * 100) {
            print("Attack Successful! Rolled \(hitRoll), needed less than \(self.hitRate * 100)")
            //returns true if attack was successful
            return true
        //if the random variable is more then the hit rate than the attack is unsuccessful
        } else {
            print("Attack Unsuccessful. Rolled \(hitRoll), needed less than \(self.hitRate * 100)")
            //returns false if attack was unsuccessful
            return false
        }
    }
    //creating a mutating function wasHit to subtract the damage on the entity from the hitpoints of the entity
    mutating func WasHit(damage: Int) { //return true if dead
        self.hitPoints -= damage
        //statements so that if the hitpoints are less than 0 then the game ends
        if self.hitPoints <= 0 {
            self.hitPoints = 0
            gameEnded = true
        }
        
    }
    
}
