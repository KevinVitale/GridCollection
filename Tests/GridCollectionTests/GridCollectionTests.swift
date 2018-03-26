import XCTest
@testable import GridCollection

class GridCollectionTests: XCTestCase {
    private struct HeightTile: GridElement, Codable {
        var rawValue: UInt8
        var normalized: Double {
            return Double(rawValue) / Double(UInt8.max)
        }
    }

    private enum MazeTile: Int, GridElement, Codable {
        static var max: Int { return 2 }

        case open = 0
        case wall
    }

    func testGrid() {
        let maze: Grid<MazeTile> = Grid<MazeTile>(width: 2, height: 2, values: [0, 1, 0, 1])!
		XCTAssertEqual(maze.width, 2)
		XCTAssertEqual(maze.height, 2)
		XCTAssertEqual(maze[0, 1], .wall)
    }

    static var allTests = [
        ("testGrid", testGrid),
    ]
}
