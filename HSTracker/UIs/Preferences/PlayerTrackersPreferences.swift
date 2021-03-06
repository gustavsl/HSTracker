//
//  TrackersPreferences.swift
//  HSTracker
//
//  Created by Benjamin Michotte on 29/02/16.
//  Copyright © 2016 Benjamin Michotte. All rights reserved.
//

import Foundation
import MASPreferences

class PlayerTrackersPreferences: NSViewController {

    @IBOutlet weak var showPlayerTracker: NSButton!
    @IBOutlet weak var showPlayerCardCount: NSButton!
    @IBOutlet weak var showPlayerDrawChance: NSButton!
    @IBOutlet weak var showPlayerGet: NSButton!
    @IBOutlet weak var showCthunCounter: NSButton!
    @IBOutlet weak var showSpellCounter: NSButton!
    @IBOutlet weak var showDeathrattleCounter: NSButton!
    @IBOutlet weak var flashOnDraw: NSButton!
    @IBOutlet weak var showRecord: NSButton!
    @IBOutlet weak var inHandColor: NSColorWell!
    @IBOutlet weak var showBoardDamage: NSButton!
    @IBOutlet weak var showDeckName: NSButton!
    @IBOutlet weak var showGraveyard: NSButton!
    @IBOutlet weak var showGraveyardDetails: NSButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = Settings.instance
        showPlayerTracker.state = settings.showPlayerTracker ? NSOnState : NSOffState
        showPlayerCardCount.state = settings.showPlayerCardCount ? NSOnState : NSOffState
        showPlayerDrawChance.state = settings.showPlayerDrawChance ? NSOnState : NSOffState
        showPlayerGet.state = settings.showPlayerGet ? NSOnState : NSOffState
        showCthunCounter.state = settings.showPlayerCthun ? NSOnState : NSOffState
        showSpellCounter.state = settings.showPlayerSpell ? NSOnState : NSOffState
        showDeathrattleCounter.state = settings.showPlayerDeathrattle ? NSOnState : NSOffState
        flashOnDraw.state = settings.flashOnDraw ? NSOnState : NSOffState
        showRecord.state = settings.showWinLossRatio ? NSOnState : NSOffState
        inHandColor.color = settings.playerInHandColor
        showBoardDamage.state = settings.playerBoardDamage ? NSOnState : NSOffState
        showDeckName.state = settings.showDeckNameInTracker ? NSOnState : NSOffState
        showGraveyard.state = settings.showPlayerGraveyard ? NSOnState : NSOffState
        showGraveyardDetails.state = settings.showPlayerGraveyardDetails ? NSOnState : NSOffState
        if showGraveyard.state == NSOnState {
            showGraveyardDetails.isEnabled = true
        } else {
            showGraveyardDetails.isEnabled = false
        }
    }
    
    @IBAction func colorChange(_ sender: NSColorWell) {
        let settings = Settings.instance
        if sender == inHandColor {
            settings.playerInHandColor = inHandColor.color
        }
    }

    @IBAction func checkboxClicked(_ sender: NSButton) {
        let settings = Settings.instance

        if sender == showPlayerTracker {
            settings.showPlayerTracker = showPlayerTracker.state == NSOnState
        } else if sender == showPlayerGet {
            settings.showPlayerGet = showPlayerGet.state == NSOnState
        } else if sender == showPlayerCardCount {
            settings.showPlayerCardCount = showPlayerCardCount.state == NSOnState
        } else if sender == showPlayerDrawChance {
            settings.showPlayerDrawChance = showPlayerDrawChance.state == NSOnState
        } else if sender == showCthunCounter {
            settings.showPlayerCthun = showCthunCounter.state == NSOnState
        } else if sender == showSpellCounter {
            settings.showPlayerSpell = showSpellCounter.state == NSOnState
        } else if sender == showDeathrattleCounter {
            settings.showPlayerDeathrattle = showDeathrattleCounter.state == NSOnState
        } else if sender == flashOnDraw {
            settings.flashOnDraw = flashOnDraw.state == NSOnState
        } else if sender == showRecord {
            settings.showWinLossRatio = showRecord.state == NSOnState
        } else if sender == showBoardDamage {
            settings.playerBoardDamage = showBoardDamage.state == NSOnState
        } else if sender == showDeckName {
            settings.showDeckNameInTracker = showDeckName.state == NSOnState
        } else if sender == showGraveyard {
            settings.showPlayerGraveyard = showGraveyard.state == NSOnState
            if showGraveyard.state == NSOnState {
                showGraveyardDetails.isEnabled = true
            } else {
                showGraveyardDetails.isEnabled = false
            }
        } else if sender == showGraveyardDetails {
            settings.showPlayerGraveyardDetails = showGraveyardDetails.state == NSOnState
        }
        
    }
}

// MARK: - MASPreferencesViewController
extension PlayerTrackersPreferences: MASPreferencesViewController {
    override var identifier: String? {
        get {
            return "player_trackers"
        }
        set {
            super.identifier = newValue
        }
    }

    var toolbarItemImage: NSImage? {
        return NSImage(named: NSImageNameAdvanced)
    }

    var toolbarItemLabel: String? {
        return NSLocalizedString("Player tracker", comment: "")
    }
}
