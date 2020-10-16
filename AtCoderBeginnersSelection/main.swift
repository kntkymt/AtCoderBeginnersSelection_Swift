//
//  main.swift
//  AtCoderBeginnersSelection
//
//  Created by kntk on 2020/07/26.
//  Copyright © 2020 kntk. All rights reserved.
//

import Foundation

func readInt() -> Int {
    return Int(readLine()!)!
}

func readInts(separator: String.Element = " ") -> [Int] {
    return readLine()!.split(separator: separator).map { Int($0)! }
}

func readTwoInts(separator: String.Element = " ") -> (a: Int, b: Int) {
    let ints = readLine()!.split(separator: separator).map { Int($0)! }
    return (a: ints[0], b: ints[1])
}

func readThreeInts(separator: String.Element = " ") -> (a: Int, b: Int, c: Int) {
    let ints = readLine()!.split(separator: separator).map { Int($0)! }
    return (a: ints[0], b: ints[1], c: ints[2])
}

func main1() {
    let (a, b) = readTwoInts()
    let result = a * b
    print(result.isMultiple(of: 2) ? "Even" : "Odd")
}

func main2() {
    let string = readLine()!

    let count = string.reduce(0) { (sum, part) in sum + Int(String(part))! }
    print(count)
}

func main3() {
    let _ = readInt()
    var numbers = readInts()

    var count = 0
    while numbers.allSatisfy({ $0.isMultiple(of: 2) }) {
        count += 1
        numbers = numbers.map { $0 / 2 }
    }

    print(count)
}

func main4() {
    let A = readInt()
    let B = readInt()
    let C = readInt()
    let X = readInt()

    var count = 0
    for i in 0...A {
        for j in 0...B {
            let remain = X - (500 * i) - (100 * j)
            if remain > 0 && remain / 50 < C {
                count += 1
            }
        }
    }

    print(count)
}

func main5() {
    let (N, A, B) = readThreeInts()

    var sum = 0
    for i in 1...N {
        let result = String(i).reduce(0) { (sum, part) in sum + Int(String(part))! }
        if A <= result, result <= B {
            sum += i
        }
    }

    print(sum)
}

func main6() {
    let N = readInt()
    let numbers = readInts()

    var alice = 0
    var bob = 0

    numbers
        .sorted(by: >)
        .enumerated()
        .forEach { (index, element) in
            if index.isMultiple(of: 2) {
                alice += element
            } else {
                bob += element
            }
        }

    print(alice - bob)
}

func main7() {
    let N = readInt()
    let numbers = (0..<N).map { _ in readInt() }

    print(Set(numbers).count)
}

func main8() {
    let (N, Y) = readTwoInts()

    for i in 0...N {
        for j in 0...N {
            let k = N - i - j
            if k >= 0, Y == (i * 10000) + (j * 5000) + (k * 1000) {
                print(i, j, k)
                return
            }
        }
    }

    print(-1, -1, -1)
}

func main9() {
    let words = ["dream", "dreamer", "erase", "eraser"]
    var S = readLine()!

    while let word = words.first(where: { S.hasSuffix($0) }) {
        S.removeLast(word.count)
    }

    print(S.isEmpty ? "YES" : "NO")
}

typealias Plan = (t: Int, x: Int, y: Int)
func main10() {
    let N = readInt()
    let plans: [Plan] = (0..<N).map { _ in readThreeInts() }

    var previous = Plan(t: 0, x: 0, y: 0)

    for plan in plans {
        let time = plan.t - previous.t
        let distance = abs(previous.x - plan.x) + abs(previous.y - plan.y)

        let remain = time - distance

        if remain < 0 || !remain.isMultiple(of: 2) {
            print("No")
            return
        }

        previous = plan
    }

    print("Yes")
}
