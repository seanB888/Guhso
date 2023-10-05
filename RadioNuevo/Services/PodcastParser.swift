//
//  PodcastParser.swift
//  RadioNuevo
//
//  Created by SEAN BLAKE on 10/4/23.
//

import Foundation

class PodcastParser: NSObject, XMLParserDelegate, ObservableObject {

    @Published var podcast: Podcast?
    private var currentElement = ""
    private var currentTitle: String = "" {
        didSet {
            currentTitle = currentTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    private var currentPubDate = ""
    private var currentDescription = ""
    private var currentEnclosure: Enclosure?
    private var episodes: [Episode] = []
    private var currentCharacters: String = ""
    
    func parse() {
        if let url = URL(string: "https://anchor.fm/s/341db29c/podcast/rss") {
            if let parser = XMLParser(contentsOf: url) {
                parser.delegate = self
                parser.parse()
            }
        }
    }
    
    // MARK: - XML Parser Delegate
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        currentElement = elementName
        if currentElement == "item" {
            currentTitle = ""
            currentPubDate = ""
            currentDescription = ""
            currentEnclosure = nil
        }
        if currentElement == "enclosure" {
            currentEnclosure = Enclosure(url: attributeDict["url"] ?? "", length: attributeDict["length"] ?? "", type: attributeDict["type"] ?? "")
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
            currentCharacters += string
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
            switch elementName {
            case "title":
                currentTitle = currentCharacters.trimmingCharacters(in: .whitespacesAndNewlines)
            case "pubDate":
                currentPubDate = currentCharacters.trimmingCharacters(in: .whitespacesAndNewlines)
            case "description":
                currentDescription = currentCharacters.trimmingCharacters(in: .whitespacesAndNewlines)
            case "item":
                let episode = Episode(title: currentTitle, pubDate: currentPubDate, description: currentDescription, enclosure: currentEnclosure!)
                episodes.append(episode)
            case "channel":
                podcast = Podcast(title: currentTitle, episodes: episodes)
            default:
                break
            }
            // Reset currentCharacters for the next element
            currentCharacters = ""
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("XML Parsing Error: \(parseError.localizedDescription)")
    }
}
