//
//  fixtureTableViewCell.swift
//  FinalProject
//
//  Created by Osagie Obaze on 1/21/21.
//

import UIKit

class fixtureTableViewCell: UITableViewCell {

    
    @IBOutlet weak var homeTeam: UILabel!
    @IBOutlet weak var homeScore: UILabel!
    
    @IBOutlet weak var awayTeam: UILabel!
    @IBOutlet weak var awayScore: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with match: Match){
        self.homeTeam.text = match.homeTeam
        self.homeScore.text = String(match.homeScore)
        self.awayTeam.text = match.awayTeam
        self.awayScore.text = String(match.awayScore)
    }
    
}
