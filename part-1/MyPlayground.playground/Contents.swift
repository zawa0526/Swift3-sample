//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
str = "こんにちは"
let who = "山田"
str = who + "さん、" + str

func calc(tanka: Int, kosu: Int) -> Int {
    let kakaku = tanka * kosu
    return kakaku
}

let ans = calc(tanka: 250, kosu: 3)

var goukei = 0

for num in 1...10 {
    goukei = goukei + num
    print(goukei)
}

for kakudo in 0..<360 {
    let radian = Double(kakudo) * M_PI/180
    let y1 = sin(radian)
    let y2 = sin(radian*3)
    let y3 = abs(y2)
}
