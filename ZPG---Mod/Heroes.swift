//
//  Heroes.swift
//  Text Adventure
//
//  Created by admin on 1/8/19.
//  Copyright © 2019 admin. All rights reserved.
//
import Foundation
// setup adventurer class, you may add additional properties or methods to the super, you may rename anything in here
class Adventurer {
    //creating variables
    //name variable to store the heroes name
    var name : String
    //hitPoints variable to store the heroes hp
    var hitPoints : Int
    //damage variable to store the heroes damage
    var damage : Int
    //hitRate variable to store the heroes hit rate
    var hitRate : Double
    
    //initalizing the heroes properties
    init(name: String, hitPoints: Int, hitRate: Double, damage: Int) {
        //initailizing the heroes name as itself
        self.name = name
        //initailizing the heroes hitPoints as itself
        self.hitPoints = hitPoints
        //initailizing the heroes damage as itself
        self.damage = damage
        //initailizing the heroes hitRate as itself
        self.hitRate = hitRate
    }
    
    //function status which prints all of the heroes stats
    func status() { //returns status
        print("Hero Name: \(self.name)")
        print("Hit Points Remaining: \(self.hitPoints)")
        print("Damage: \(self.damage)")
        print("Hit Chance: \(self.hitRate)")
    }
    //create function for the heroes attack, returns a boolean. True if successful attack. False otherwise
    func attack() -> Bool { //returns true if hits
        //create random variable between 1 and 100
        var hitRoll : Int = getRando(99) + 1
        //if the random variable is less then the hit rate than the attack is successful
        if Double(hitRoll) < (self.hitRate * 100) {
            print("Attack Successful! Rolled \(hitRoll), needed less than \(self.hitRate * 100).")
            //returns true if attack was successful
            return true
        //if the random variable is more then the hit rate than the attack is unsuccessful
        } else {
            print("Attack Unsuccessful. Rolled \(hitRoll), needed less than \(self.hitRate * 100)")
            //returns false if attack was unsuccessful
            return false
        }
    
    }
    
    //creating a  function wasHit to subtract the damage on the entity from the hitpoints of the entity
    func WasHit(damage: Int) { //return true if dead
        self.hitPoints-=damage
        //statements so that if the hitpoints are less than 0 then the game ends
        if self.hitPoints < 1 {
            self.hitPoints = 0
            gameEnded = true
        }
    }
    
    //function so that if the hero gets a potion it gains the amount of hp the potions provides added to its hp
    func potionAcquired(potionBooster: Int) {
        self.hitPoints+=potionBooster
    }
    
    //function which creates a random chance that the hero will deliver a critical attack
    func criticalAttack() -> Bool {
        //creates random number between 1 and 10
        var hitRoll : Int = getRando(10) + 1
        //if the number is 1 then the attack is successful and it returns true
        if Double(hitRoll) == 1 {
            return true
            //attack successful
        //if the number is not 1 then the attack is unsuccessful and it returns false
        } else {
            //attack unsuccessful
            return false
        }
    }
    
}// end adventurer
// define adventurer subclasses, create at least 1 override method for each subclass
class harry : Adventurer {
    
    init() {
        //initializes harry's properties
        super.init(name: "Harry", hitPoints: 100, hitRate: 0.5, damage: 60)
        self.damage = 60
        self.hitRate = 0.50
        self.name = "Harry"
        self.hitPoints = 100
    }
    override func criticalAttack() -> Bool {
        var hitRoll : Int = getRando(3) + 1
        if Double(hitRoll) == 1 {
            return true
        } else {
            return false
        }
    }
}
class hermione : Adventurer {
 
    init() {
        super.init(name: "Hermione", hitPoints: 100, hitRate: 0.75, damage: 40)
        self.damage = 40
        self.hitRate = 0.75
        self.name = "Hermione"
        self.hitPoints = 100
    }
    override func criticalAttack() -> Bool {
        var hitRoll : Int = getRando(4) + 1
        if Double(hitRoll) == 1 {
            return true
        } else {
            return false
        }
    }
}
class ron : Adventurer {
    
    init() {
        super.init(name: "Ron", hitPoints: 100, hitRate: 0.3, damage: 100)
        self.damage = 100
        self.hitRate = 0.30
        self.name = "Ron"
        self.hitPoints = 100
    }
    override func criticalAttack() -> Bool {
        var hitRoll : Int = getRando(2) + 1
        if Double(hitRoll) == 1 {
            return true
        } else {
            return false
        }
    }
}
