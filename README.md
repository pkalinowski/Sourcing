[![Build Status](https://travis-ci.org/lightsprint09/Sourcing.svg?branch=master)](https://travis-ci.org/lightsprint09/Sourcing)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

# Sourcing

* [Quick Demo](#Quick-Demo)
* [DataProvider]
   * [ArrayDataProvider]
   * [FetchedresultsDataProvider]
   * [AnyDataProvider]
   * [Custom DataProvider]
* [DataSource]
   * [TableViewDataSource]
   * [CollectionViewDataSource]
* [Cells]
   * [ConfigurableCell]
   * [BasicCellConfiguration]
   * [CellConfiguration]
   * [CellIdentifierProviding]

Typesafe and flexible abstraction for TableView &amp; CollectionView DataSources written in Swift.

## Usage
### Quick Demo
Setting up your Cell by implementing `ConfigurableCell` & `CellIdentifierProviding`.
```swift
import Sourcing

class TrainCell: UITableViewCell, ConfigurableCell {
   @IBOutlet var nameLabel: UILabel!
   
   func configure(with train: Train) {
      nameLabel.text = train.name
   }
}

//If your reuse identifier is the same a the class name
extenion TrainCell: CellIdentifierProviding {}

let trainCell = CellConfiguration<TrainCell>()
let trains: Array<Train> = //
let dataProvider: ArrayDataProvider<Train> = ArrayDataProvider(rows: trains)
let dataSource = TableViewDataSource<Train>(tableView: tableView, dataProvider: dataProvider, cell: trainCell)
```


## Requirements

- iOS 9.3+
- Xcode 8.0+
- Swift 3.0

## Installation

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

Specify the following in your `Cartfile`:

```ogdl
github "lightsprint09/sourcing" ~> 2.0
```
## Contributing
Feel free to submit a pull request with new features, improvements on tests or documentation and bug fixes. Keep in mind that we welcome code that is well tested and documented.

## Contact
Lukas Schmidt ([Mail](mailto:lukas.la.schmidt@deutschebahn.com), [@lightsprint09](https://twitter.com/lightsprint09))

## License
Sourcing is released under the MIT license. See LICENSE for details.

