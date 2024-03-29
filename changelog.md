# Changelog
All notable changes to this project will be documented in this file.

## [0.3.0] - 2019-09-04
### Added 
- Node: Manual Press
- Items: (Apple Juice, Fruit Mush, Press Crank, Wax, Honey)
- Crafting API now supports press
- Added group pressable to default:apple

### Changed
- get_craft_result(typ, list, param) needs param
    param for shaped = {width = list_width, height = list_height}
    param for shapeless = shapeless does not need param
    param for press = #turns
(Note: Dissection Table should be replaced due to this change)
- Honey Combs are not edible anymore

### Fixed
- Nodes did not rotate to the direction of the player

## [0.2.1] - 2019-08-29
### Added
- Crafting API(Dissection Table) now supports shapeless crafting and groups

### Changed
- Recipe for Bee DNA is now shapeless

## [0.2.0] - 2019-08-27
### Added
- Bees: 24 new species
- Bees can crossbreed

### Changed
- Bees can be stacked

## [0.1.1] - 2019-08-25
### Changed
- Mod is now a Modpack
- Bees are now rendered with overlays and layer colors to cut down on files

## [0.1.0] - 2019-08-24
### Added
- Node: Dissection Table
- Node: Bee Hive
- Bee species: "Ancient"
- Bee species: "Relic"
- Bee species: "Glacial"
- Bee species: "Primal"
- Item: Amber
- Item: Amber with Bee
- Item: Insect Parts
- Item: Empty Syringe
- Item: Filled Syringe
- Item: Filled Honey Comb
- Item: Crown
- Ore: Amber Ore
