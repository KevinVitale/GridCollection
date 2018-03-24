// GridElement
//------------------------------------------------------------------------------
public protocol GridElement: RawRepresentable where Self.RawValue: FixedWidthInteger {
    static var empty: Self { get }
    static var max: RawValue { get }
}

// GridElement (.max / .min /.empty)
//------------------------------------------------------------------------------
extension GridElement {
    static var max: RawValue {
        return RawValue.max
    }

    static var min: RawValue {
        return RawValue.min
    }

    static var empty: Self {
        return Self(rawValue: .min)!
    }
}

// GridElement (Random)
//------------------------------------------------------------------------------
extension GridElement {
    public static func random<V: ValueRandomizer>(_ randomizer: V) -> Self! where V.Value == Self.RawValue {
        let random = randomizer.random(upperBound: Self.max)
        return Self(rawValue: random)!
    }
}

// ValueRandomizer
//------------------------------------------------------------------------------
public protocol ValueRandomizer {
    associatedtype Value: BinaryInteger
    func random(upperBound: Value) -> Value
}

// Arc4Randomizer<T>
//------------------------------------------------------------------------------
import Darwin
public struct Arc4Randomizer<T: BinaryInteger>: ValueRandomizer {
    public func random(upperBound: T) -> T {
        return numericCast(arc4random_uniform(numericCast(upperBound)))
    }
}

