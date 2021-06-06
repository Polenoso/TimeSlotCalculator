# TimeSlotsCalculator

TimeSlotsCalculator is a package for dealing with new time slots for electricity in Spain.

## Installation

Use the package manager [SPM](https://swift.org/package-manager/) to add TimeSlotCalculator.

```Swift
dependencies: [
        .package(url: "https://github.com/Polenoso/TimeSlotCalculator.git", from: "1.0.0"),
    ],
targets:
 .target("yourtarget",
        dependencies: [TimeSlotsCalculator])
```

## Usage

```Swift
import TimeSlotCalculator

let calculator = TimeSlotsCalculator(holidays: [])

let slot = try? calculator.getTimeSlot(for: Date())
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
