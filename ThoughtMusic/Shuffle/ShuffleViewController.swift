//
//  ShuffleViewController.swift
//  ThoughtMusic
//
//  Created by Israel on 24/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import UIKit
import GameplayKit

protocol ShuffleViewControllerProtocol {
    func getSongs()
    func showSongs(songs: [Song]?)
    func showError()
    func toggleLoading(_ bool:Bool)
}

class ShuffleViewController: UIViewController, ShuffleViewControllerProtocol {
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var presenter:ShufflePresenter = ShufflePresenter()
    private var interactor:ShuffleInteractor = ShuffleInteractor()
    private let urlIds:[Int] = [909253, 1171421960, 358714030, 1419227, 264111789]
    private var songsArray:[Song] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getSongs()
    }
    
    private func setup() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
    
    func getSongs() {
        presenter.shufflePresenterDelegate = self
        interactor.shuffleInteractorDelegate = presenter
        interactor.getSongs(urlIds: urlIds)
    }

    func toggleLoading(_ bool:Bool){
        if bool {
            loadingView.isHidden = false
            activityIndicator.startAnimating()
            return
        }
        loadingView.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    private func downloadImage(from url: String) -> UIImage {
        
        guard let url = URL(string: url) else { return UIImage() }
        guard let data = try? Data(contentsOf: url) else { return UIImage() }
        guard let image = UIImage(data: data) else { return UIImage() }
        return image
    }

    private func shuffleSongs() {
        songsArray = songsArray.shuffled()
        songsArray = Utils.noRepeatedSort(songsArray)
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.toggleLoading(false)
        }
    }
    
    func showSongs(songs: [Song]?) {
        guard let songs = songs else { return }
        songsArray = songs
        shuffleSongs()
    }
    
    func showError() {
        showAlert(title: "Ops!", message: "Ocorreu um erro!")
    }
    
    private func showAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func shuffleAction(_ sender: UIBarButtonItem) {
        toggleLoading(true)
        shuffleSongs()
    }
    
}


//MARK: - UITableViewDataSource
extension ShuffleViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        
        let song = songsArray[indexPath.row]
        cell.textLabel?.text = song.trackName
        cell.detailTextLabel?.text = "\(song.artistName ?? "Artista")(\(song.primaryGenreName ?? "Gênero"))"
        cell.imageView?.image = downloadImage(from: song.artworkUrl ?? "logo")
        
        return cell
    }
    
}


//MARK: - UITableViewDelegate
extension ShuffleViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
