//
//  MovieTableViewCell.swift
//  YassirTask
//
//  Created by Amr Saied on 04/05/2023.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    //MARK: IU PROPERTIES

    @IBOutlet weak var moviePosterImageView:UIImageView!
    @IBOutlet weak var movieNameLabel:UILabel!
    @IBOutlet weak var movieOverviewLabel:UILabel!
    @IBOutlet weak var movieReleaseDateLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with movie:MovieData) {
        self.moviePosterImageView.loadImage(fromURL: movie.posterFullURL ?? "")
        self.movieNameLabel.text = movie.title
        self.movieOverviewLabel.text = movie.overview
        self.movieReleaseDateLabel.text = movie.releaseDate ?? ""
    }
    
}
