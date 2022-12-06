
/**
 enum Tower {
     case tower1(items: [Int]), tower2, tower3
 }

 func move(discs: Int, from source: Tower, to destination: Tower, using temporary: Tower) {
     guard discs > 0 else { return }
     move(discs: discs - 1, from: source, to: temporary, using: destination)
     print("Move [\(discs)] from -\(source)- to -\(destination)-")
     move(discs: discs - 1, from: temporary, to: destination, using: source)
 }

 move(discs: 4, from: .tower1, to: .tower3, using: .tower2)

 👆🏻 This implementation will print the steps to solve the tower of hanoi.
 But I wanted to play with actual disc objects to resolve this.
 And I want the steps to be more visual.

 👇🏻 Following implementation does this.
 */

class Tower {
    var name: String
    var discs: [Disc]
    init(name: String, discs: [Disc]) {
        self.name = name
        self.discs = discs
    }
}

extension Tower {
    class Disc {
        let weight: Int
        init(weight: Int) { self.weight = weight }
    }
}

struct TowerOfHanoi {
    var tower1 = Tower(name: "Tower1", discs: [])
    var tower2 = Tower(name: "Tower2", discs: [])
    var tower3 = Tower(name: "Tower3", discs: [])

    init(totalDiscs: Int) {
        for weight in (1...totalDiscs).reversed() {
            tower1.discs.append(Tower.Disc(weight: weight))
        }
    }

    func moveDiscs(discs: [Tower.Disc],
                   from source: inout Tower,
                   to destination: inout Tower,
                   using temporary: inout Tower) {
        guard discs.count > 0 else { return }
        var discsToRemove = discs
        let lastDisc = discsToRemove.removeFirst()
        moveDiscs(discs: discsToRemove, from: &source, to: &temporary, using: &destination)
        source.discs.remove(at: source.discs.firstIndex(of: lastDisc)!)
        destination.discs.append(lastDisc)
        print("\n\(self)")
        moveDiscs(discs: discsToRemove, from: &temporary, to: &destination, using: &source)
    }

    mutating func solve() {
        print(self)
        moveDiscs(discs: tower1.discs, from: &tower1, to: &tower3, using: &tower2)
    }
}

extension Tower: CustomStringConvertible {
    var description: String {
        var desc = ""
        for disc in discs { desc.append("[\(disc.weight)]") }
        return "\(name)|\(desc)==|"
    }
}

extension Tower.Disc: CustomStringConvertible, Equatable {
    var description: String { "[\(weight)]" }
    static func == (lhs: Tower.Disc, rhs: Tower.Disc) -> Bool { lhs.weight == rhs.weight }
}

extension TowerOfHanoi: CustomStringConvertible {
    var description: String { "\(tower1)\n\(tower2)\n\(tower3)" }
}

var hanoi = TowerOfHanoi(totalDiscs: 4)
hanoi.solve()
