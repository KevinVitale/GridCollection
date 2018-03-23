import XCTest
@testable import GridCollection

enum MazeTile: Int, GridTile, Codable {
    static let empty: MazeTile = .open
    static func random() -> MazeTile { 
        let rawValue = Int(arc4random_uniform(2))
        return MazeTile(rawValue: rawValue)!
    }

    case open = 0
    case wall = 1
}

class GridCollectionTests: XCTestCase {
    func testGrid() {
        let maze = try! Grid<MazeTile>(width: 2, height: 2, values: [0, 1, 0, 1])
		XCTAssertEqual(maze.width, 2)
		XCTAssertEqual(maze.height, 2)
		XCTAssertEqual(maze[0, 1], .wall)
    }

    static var allTests = [
        ("testGrid", testGrid),
    ]
}
