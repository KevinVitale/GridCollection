import XCTest
@testable import GridCollection

class GridCollectionRandomizerTests: XCTestCase {
    private struct HeightTile: GridElement, Codable {
        static let empty: HeightTile = HeightTile(rawValue: 0)

        var rawValue: UInt8
        var normalized: Double {
            return Double(rawValue) / Double(HeightTile.max)
        }
    }

    private static let width  = 10
    private static let height = 2

    func testRandomizer() {
        let width  = GridCollectionRandomizerTests.width
        let height = GridCollectionRandomizerTests.height

        let heightMap = Grid<HeightTile>.random(width: width, height: height)

        XCTAssertEqual(heightMap.width, width)
        XCTAssertEqual(heightMap.height, height)
        XCTAssertEqual(heightMap.count, width * height)

        let data = try! heightMap.jsonEncoded()
        let json = String(data: data, encoding: .utf8)!
        print(json)
    }

    static var allTests = [
        ("testRandomizer", testRandomizer),
    ]
}

class GridCollectionTests: XCTestCase {
    private enum MazeTile: UInt, GridElement, Codable {
        static let empty: MazeTile = .open
        static var max: Int { return 2 }

        case open = 0
        case wall
    }

    func testGrid() {
        let maze = try! Grid<MazeTile>(width: 2, height: 2, values: [0, 1, 0, 1])
		XCTAssertEqual(maze.width, 2)
		XCTAssertEqual(maze.height, 2)
		XCTAssertEqual(maze[0, 1], .wall)

        let data = try! maze.jsonEncoded()
        let json = String(data: data, encoding: .utf8)!
        print(json)

        print(json)
    }

    static var allTests = [
        ("testGrid", testGrid),
    ]
}
