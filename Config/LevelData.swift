//
//  LevelData.swift
//  GuestureBrick
//
//  Created by jim on 16/12/22.
//  Copyright © 2016年 Jim. All rights reserved.
//

import SpriteKit

let LevelData:[Level] = [
    Level1,Level2,Level3,Level4,Level5,Level6,Level7,Level8,Level9,Level10,Level11
]
let LevelMax = 11
let endlessLevel = 11
let Level1 = Level.init(id:1,arr:[
    [0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],[0,1,1,1,1,1,1,1,1,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],
    ])
let Level2 = Level.init(id:2,arr:[
    [0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],
    [0,2,2,2,2,2,2,2,2,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],
    [0,2,2,2,2,2,2,2,2,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],
    ])
let Level3 = Level.init(id:3,arr:[
    [0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,1,1,1,1,1,1,1,1,0],[0,0,0,0,0,0,0,0,0,0],
    [0,1,1,1,1,1,1,1,1,0],[0,0,0,0,0,0,0,0,0,0],[0,1,1,1,1,1,1,1,1,0],[0,0,0,0,0,0,0,0,0,0],
    [0,1,1,1,1,1,1,1,1,0],[0,0,0,0,0,0,0,0,0,0],[0,1,1,1,1,1,1,1,1,0],[0,0,0,0,0,0,0,0,0,0],
    [0,1,1,1,1,1,1,1,1,0],[0,3,3,3,3,3,3,3,3,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],
    ])
let Level4 = Level.init(id:4,arr:[
    [0,0,0,4,0,0,4,0,0,0],
    [0,0,0,0,4,4,0,0,0,0],
    [0,0,0,0,4,4,0,0,0,0],
    [0,0,0,4,0,0,4,0,0,0],
    [0,0,3,0,0,0,0,3,0,0],
    [0,2,0,0,0,0,0,0,2,0],
    [1,0,0,0,0,0,0,0,0,1],
    [0,2,0,0,0,0,0,0,2,0],
    [0,0,3,0,0,0,0,3,0,0],
    [0,0,0,4,0,0,4,0,0,0],
    [0,0,0,0,4,4,0,0,0,0],
    [0,0,0,0,4,4,0,0,0,0],
    [0,0,0,4,0,0,4,0,0,0],
    [0,0,3,0,0,0,0,3,0,0],
    [0,2,0,0,0,0,0,0,2,0],
    [1,0,0,0,0,0,0,0,0,1],
    ])
let Level5 = Level.init(id:5,arr:[
    [0,0,0,0,0,0,0,0,0,0],
    [0,2,2,2,2,2,2,2,2,0],
    [0,3,0,0,0,0,0,0,3,0],
    [0,3,0,5,5,5,5,0,3,0],
    [0,3,0,5,0,0,4,0,3,0],
    [0,3,0,5,0,0,4,0,3,0],
    [0,3,0,5,0,0,4,0,3,0],
    [0,3,0,5,0,0,4,0,3,0],
    [0,3,0,5,0,0,4,0,3,0],
    [0,3,0,5,0,0,4,0,3,0],
    [0,3,0,5,0,0,4,0,3,0],
    [0,3,0,5,0,0,4,0,3,0],
    [0,3,0,5,0,0,4,0,3,0],
    [0,3,0,5,0,0,0,0,3,0],
    [0,3,0,4,4,4,4,4,4,0],
    [0,3,0,0,0,0,0,0,0,0],
    ])
let Level6 = Level.init(id:6,arr:[
    [0,0,0,0,0,0,0,0,0,0],
    [1,6,6,6,6,6,6,6,6,6],
    [1,6,6,6,6,6,6,6,6,6],
    [1,6,0,0,0,0,0,0,0,0],
    [1,6,0,0,0,0,0,0,0,0],
    [1,6,0,0,0,0,0,0,0,0],
    [1,6,0,0,0,0,0,0,0,0],
    [1,6,6,6,6,6,6,6,6,1],
    [1,6,6,6,6,6,6,6,6,1],
    [1,6,0,0,0,0,0,0,6,1],
    [1,6,0,0,0,0,0,0,6,1],
    [1,6,0,0,0,0,0,0,6,1],
    [1,6,0,0,0,0,0,0,6,1],
    [1,6,6,6,6,6,6,6,6,1],
    [1,6,6,6,6,6,6,6,6,1],
    [0,0,0,0,0,0,0,0,0,0],
    ])
let Level7 = Level.init(id:7,arr:[
    [0,0,0,0,0,0,0,0,0,0],[0,1,0,1,0,1,0,1,1,0],[0,2,0,2,0,2,0,2,2,0],[0,3,0,3,0,3,0,3,3,0],
    [0,4,0,4,0,4,0,4,4,0],[0,5,0,5,0,5,0,5,5,0],[0,6,0,6,0,6,0,6,6,0],[0,7,0,7,0,7,0,7,7,0],
    [0,6,0,6,0,6,0,6,6,0],[0,5,0,5,0,5,0,5,5,0],[0,4,0,4,0,4,0,4,4,0],[0,3,0,3,0,3,0,3,3,0],
    [0,2,0,2,0,2,0,2,2,0],[1,1,1,1,1,1,1,1,1,1],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],
    ])
let Level8 = Level.init(id:8,arr:[
    [8,0,8,0,0,0,0,8,0,8],
    [0,8,0,0,0,0,0,0,8,0],
    [8,0,8,0,0,1,0,8,0,8],
    [0,0,0,0,1,0,1,0,0,0],
    [0,0,0,1,0,1,0,0,0,0],
    [0,0,0,0,1,0,1,0,0,0],
    [0,1,0,1,0,8,0,8,0,8],
    [0,0,1,0,8,0,8,0,8,0],
    [0,1,0,1,0,8,0,8,0,8],
    [8,0,8,0,0,0,1,0,1,0],
    [0,8,0,0,0,0,0,1,0,0],
    [8,0,8,0,0,0,1,0,1,0],
    [0,0,0,8,0,8,0,0,0,0],
    [0,0,0,0,8,0,0,0,0,0],
    [0,0,0,8,0,8,0,0,0,0],
    [0,0,0,0,8,0,0,0,0,0],
    ])
let Level9 = Level.init(id:9,arr:[
    [   0,  1,  0,  3,  0,  0,  1,  0,  0,  0],
    [   0,  2,  0,  4,  0,  0,  1,  0,  1,  0],
    [   0,  3,  1,  5,  1,  0,  1,  0,  2,  0],
    [   0,  4,  1,  6,  1,  0,  1,  0,  3,  0],
    [   0,  5,  0,  7,  2,  0,  1,  0,  4,  0],
    [   0,  6,  0,  0,  3,  0,  1,  5,  5,  5],
    [   0,  7,  0,  0,  4,  0,  1,  6,  6,  6],
    [   0,  8,  0,  1,  5,  1,  1,  0,  7,  0],
    [   0,  9,  0,  1,  6,  1,  1,  0,  0,  0],
    [   0,  9,  0,  0,  7,  0,  1,  0,  0,  0],
    [   0,  9,  0,  0,  0,  0,  2,  0,  0,  0],
    [   0,  9,  0,  0,  0,  0,  3,  0,  0,  0],
    [   0,  9,  0,  4,  4,  4,  4,  4,  4,  4],
    [   1,  9,  1,  0,  5,  5,  5,  5,  5,  0],
    [   1,  9,  1,  0,  0,  6,  6,  6,  0,  0],
    [   0,  9,  0,  0,  0,  0,  7,  0,  0,  0],
    
    ])

let Level10 = Level.init(
    id: 10,
    arr: [
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        [0,9,0,0,9,0,0,0,0,0],
        [9,9,0,9,0,9,0,0,9,0],
        [0,9,0,9,0,9,0,9,9,9],
        [0,9,0,9,0,9,0,0,9,0],
        [9,9,9,0,9,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        [10,0,0,0,10,10,0,0,0,10],
        [0,10,0,10,0,0,10,0,10,0],
        [0,0,10,0,0,0,0,10,0,0],
        [0,10,0,10,0,0,10,0,10,0],
        [10,0,0,0,10,10,0,0,0,10],
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        //[1,2,3,4,5,6,7,8,9,1],
        //[11,12,13,14,15,16,17,18,19,20],
    ]
)


var Level11 = Level.init(
    id: 11,
    arr: [
        [1,0,0,1,1,1,0,1,0,1],
        [1,0,0,0,1,0,0,1,1,1],
        [1,0,0,0,1,0,0,1,0,1],
        [1,1,0,1,1,1,0,1,0,1],
        [0,0,0,0,0,0,0,0,0,0],
        [1,1,1,0,1,1,1,0,1,0],
        [0,1,0,0,0,1,0,0,1,0],
        [0,1,0,0,0,1,0,0,1,0],
        [1,1,1,0,0,1,0,0,1,1],
        [0,0,0,0,0,0,0,0,0,0],
        [1,1,0,0,1,1,0,0,1,1],
        [1,0,0,1,0,0,0,1,0,0],
        [1,1,0,0,1,0,0,0,1,0],
        [1,0,0,0,0,1,0,0,0,1],
        [1,1,0,1,1,0,0,1,1,0],
        [0,0,0,0,0,0,0,0,0,0],
        ]
)

/* debug
var Level11 = Level.init(
    id: 11,
    arr: [
        [0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],[0,0,0,0,1,1,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],
    ]
)
*/
/*
 [0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0],
 */