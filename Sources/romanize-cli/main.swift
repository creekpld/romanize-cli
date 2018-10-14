/**
Usage:
  romanize [flags]

Flags:
  -d, --div string  Syllable divider
  -g, --gen int     Generate x random hangul syllables
  -i, --in string   Hangul input file
  -o, --out string  Romaniesd output file
  -v, --version     Prints the version
**/
import Foundation
import Romanize
import PathKit
import Guaka

let rom = Romanize()

let version = Flag(shortName: "v", longName: "version", value: false, description: "Prints the version")
let inputFile = Flag(shortName: "i", longName: "in", type: String.self, description: "Hangul input file", required: false)
let outputFile = Flag(shortName: "o", longName: "out", type: String.self, description: "Romaniesd output file", required: false)
let divider = Flag(shortName: "d", longName: "div", type: String.self, description: "Syllable divider", required: false)
let generate = Flag(shortName: "g", longName: "gen", type: Int.self, description: "Generate x random hangul syllables", required: false)


let command = Command(usage: "romanize", flags: [version, inputFile, outputFile, divider, generate]) { flags, args in

var useDivider = false 
var romaniesdInput: String? = nil

  // Version
  if let hasVersion = flags.getBool(name: "version"), hasVersion == true 
  {
    print("Version is 1.0.0")
    return
  }

  // Divider
  if let theDivider = flags.getString(name: "div")
  {
    rom.set(divider: theDivider)
    useDivider = true
  }

  // Generator
  if let theGenerateCount = flags.getInt(name: "gen")
  {
    print(rom.genHan(theGenerateCount))
    return
  }
 
  // Input
  if let theInputFile = flags.getString(name: "in")
  {
    let inputPath = Path(theInputFile)
    
    if inputPath.exists {
      do{
          let data = try inputPath.read(.utf8)
          romaniesdInput = rom.romanize(data, useDivider)
        } catch {
          print("Failed reading file \(theInputFile), error: " + error.localizedDescription)
          return
        }
    }else{
      print("File \(theInputFile) not found.")
      return
    }
    // :continue:
  }

  // Output
  if let theOutputFile = flags.getString(name: "out")
  {
    let outputPath = Path(theOutputFile)
    do{
      if(romaniesdInput != nil){
        try outputPath.write(romaniesdInput!)
      }else{
        try outputPath.write(rom.romanize("\(args.joined(separator: " "))", useDivider))
      }
    }catch{
      print("Failed to write file \(theOutputFile), error: " + error.localizedDescription)
    }
    return
  }

  // Print
  if(romaniesdInput != nil)
  {
    print(romaniesdInput!)
  }else{
    print(rom.romanize("\(args.joined(separator: " "))", useDivider))
  }
}

command.execute()
