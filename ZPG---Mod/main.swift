//
//  main.swift
//  Zero Player Game
//
//  Created by admin on 11/19/19.
//  Copyright © 2019 admin. All rights reserved.
//
//importing foundation
import Foundation


print("Welcome to the Dungeon!")
//variable declares
var gameEnded = false
var gameActive = true
var room = 1
let sleepTime = 0
var heroChosen = Adventurer(name: "", hitPoints: 0, hitRate: 0, damage: 0)
var monsterChosen = Monster(name: "", hitPoints: 0, hitRate: 0, damage: 0)
// setup hero array
var heroes : [Adventurer] = []
//select a hero to go
let randomHero = getRando(2) + 1
var heroName: String = "Null"
//selecting random hero
if randomHero == 1 {
    //creating instance of class
    heroChosen = harry()
    //initalizing name property
    heroChosen.name = "Harry Potter"
    heroName = heroChosen.name
}
else if randomHero == 2 {
    //creating instance of class
    heroChosen = ron()
    //initalizing name property
    heroChosen.name = "Ron Weasley"
    heroName = heroChosen.name
}
else if randomHero == 3 {
    //creating instance of class
    heroChosen = hermione()
    //initalizing name property
    heroChosen.name = "Hermione Granger"
    heroName = heroChosen.name
}
print("Your hero is \(heroName)")
print("The hero enters the dungeon!")
print("A wild monster has spawned!")
usleep(500000)
//main loop for game
while(gameActive){
    var randomMonster = getRando(5) + 1
    //selects random monster and initalizes properties
    if randomMonster == 1 {
        //create a basilisk instance of the Monster structure
        monsterChosen = Monster(name: "Basilisk", hitPoints: 80, hitRate: 0.3, damage: 40)
    } else if randomMonster == 2 {
        //create a dementor instance of the Monster structure
        monsterChosen = Monster(name: "Dementor", hitPoints: 50, hitRate: 0.5, damage: 45)
    } else if randomMonster == 3 {
        //create a inferi instance of the Monster structure
        monsterChosen = Monster(name: "Inferi", hitPoints: 75, hitRate: 0.5, damage: 30)
    } else if randomMonster == 4 {
        //create a death eater instance of the Monster structure
        monsterChosen = Monster(name: "Death Eater", hitPoints: 100, hitRate: 0.5, damage: 40)
    } else if randomMonster == 5 {
        //create a troll instance of the Monster structure
        monsterChosen = Monster(name: "Troll", hitPoints: 150, hitRate: 0.3, damage: 25)
    } else if randomMonster == 6 {
        //create a voldemort instance of the Monster structure
        monsterChosen = Monster(name: "Lord Voldemort", hitPoints: 100, hitRate: 1, damage: 24)
    }
    var monsterName = monsterChosen.name
    print("\(heroName) and \(monsterChosen.name) are in a duel!")
    usleep(500000)
    print("\(heroName) attacks first!")
    usleep(500000)
    gameEnded = false
    //while loop for attacks
    while(!gameEnded) {
        //if both monsters alive, check for critical attack
        if heroChosen.hitPoints > 0 && monsterChosen.hitPoints > 0 {
            if heroChosen.criticalAttack() {
                //check for main attack
                if heroChosen.attack() {
                    print("Critical Hit! Your damage was multiplied by 2.")
                    //damage multiplier
                    monsterChosen.WasHit(damage: (heroChosen.damage * 2))
                }
            }
            //if critical attack unsuccessful, check if main attack successful
            else {
                if heroChosen.attack() {
                    monsterChosen.WasHit(damage: heroChosen.damage)
                }
            }
        }
            usleep(500000)
            print("\(monsterName) has \(monsterChosen.hitPoints) hitpoints remaining.")
            usleep(500000)
        //monster's turn to attack
        if monsterChosen.hitPoints > 0 {
            print("\(monsterName)'s turn!")
            usleep(500000)
            //monster dealing damage
            if monsterChosen.attacks() {
                heroChosen.WasHit(damage: monsterChosen.damage)
            }
            else {
                print("Attack Missed.")
                //attack unsuccessful
            }
        }
        usleep(500000)
        print("\(heroName) has \(heroChosen.hitPoints) hit points remaining.")
        usleep(500000)
        //heroes turn
        if heroChosen.hitPoints > 0 {
            if heroChosen.hitPoints > 0 && monsterChosen.hitPoints > 0 {
                print("\(heroName)'s turn!")
            }
            usleep(500000)
        } else {
            //hero dead so game is over
            gameActive = false
        }
    }
    //level completed
    if heroChosen.hitPoints>0 {
        print("\(heroName) beat the level!")
        usleep(500000)
        heroChosen.status()
        usleep(500000)
        //increment room. Hero enters new room
        room+=1
        //potion drops
        var potionChance : Int = getRando(3) + 1
        //33% chance of getting health boosting potion after clearing a room
        if potionChance == 1 {
            print("Congratulations! The monster that you just defeated has dropped a potion to increase your total hitpoints.")
            var whichPotion : Int = getRando(3) + 1
            if whichPotion == 1 {
                //potion boosts health by 50
                print("The potion that was dropped is the potion of Increased Healing! Your current hitpoints have just increased by 50. Good luck on the next level and beware of the monster that awaits you...")
                heroChosen.potionAcquired(potionBooster: 50)
                print("Here are your new stats:")
                heroChosen.status()
            }
            else if whichPotion == 2 {
                //potion boosts health by 75
                print("The potion that was dropped is the potion of Increased Healing! Your current hitpoints have just increased by 75. Good luck on the next level and beware of the monster that awaits you...")
                heroChosen.potionAcquired(potionBooster: 75)
                print("Here are your new stats:")
                heroChosen.status()
            }
            else {
                //potion boosts health by 100
                print("The potion that was dropped is the potion of Increased Healing! Your current hitpoints have just increased by 100. Good luck on the next level and beware of the monster that awaits you...")
                heroChosen.potionAcquired(potionBooster: 100)
                print("Here are your new stats:")
                heroChosen.status()
            }
        }
        //clears screen
        clearScreen()
    }
}
//game completed!!
print("Sorry Game Over :(")
usleep(500000)
//print stats
print("Your Stats: You reached room \(room).")
