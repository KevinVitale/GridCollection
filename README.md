# GridCollection

Store `Int`-based enums inside of a 2D `Collection` structure. The library defines three types:

1. `GridTile`
2. `GridCollection`
3. `Grid<T: GridTile>`

### `GridTile`

A `Grid<T>` holds `T`, where `T` must adopt `GridTile`. As an example, imagine defining tiles for a maze:

```swift
enum MazeTile: Int, GridTile {
    static let empty: MazeTile = .open
    static func random() -> MazeTile {
        return MazeTile(rawValue: Int(arc4random_uniform(2)))!
    }

    case open = 0
    case wall
}
```

### `GridCollection`

Creating a `GridCollection` requires defining a `width`, `height`, and an array of `Int` values.

```swift
let maze = try! Grid<MazeTile>(width: 3, height 3, values: [0, 0, 0, 0, 1, 0, 0, 0, 0])
/* JSON Output of 'maze':
{
  "width" : 3,
  "values" : [
    0,
    0,
    0,
    0,
    1,
    0,
    0,
    0,
    0
  ],
  "height" : 3
}
*/
```

Additionally, you may want to generate a random grid. `GridCollection` provides `random(width:height:)`:
```swift
let maze = Grid<MazeTile>.random(width: 3, height: 3)
```

### `Grid<T>`

`Grid<T>` is a turn-key `GridCollection` structure. Enjoy!

