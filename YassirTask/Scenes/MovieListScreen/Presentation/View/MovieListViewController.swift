//
//  MovieListViewController.swift
//  YassirTask
//
//  Created by Amr Saied on 04/05/2023.
//

import RxCocoa
import RxSwift


class MovieListViewController: BaseViewController {
    
    //MARK: UI PROPERTIES
    @IBOutlet weak var movieListTabelView:UITableView!
    
    //MARK: PROPERTIES
    private var viewModel = MovieListViewModel()
    
    //MARK: LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        configureLoadingAndAlertViews()
        bindTableViewCellsToData()
        subscribeOnReachingTableViewBottomScroll()
        subscribeOnTableViewCellSelection()
        viewModel.fetchMovies()
        self.title  = "Movie List"
        navigationController?.navigationBar.prefersLargeTitles = true
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

//MARK: PRIVATE
private extension MovieListViewController {
    func setupTableView() {
        movieListTabelView.registerCellNib(MovieTableViewCell.self)
        
        movieListTabelView
            .rx
            .setDelegate(self)
            .disposed(by: disposeBag)
    }
    
    func bindTableViewCellsToData() {
        viewModel
            .moviesSubject
            .asObservable()
            .bind(to: movieListTabelView.rx.items) { (tableView, _, data) in
                let cell: MovieTableViewCell = tableView.dequeue()
                cell.configure(with: data)
                return cell
            }
            .disposed(by: disposeBag)
        
        viewModel.moviesSubject.subscribe(onNext: { [unowned self] movies in
            if movies.isEmpty {
              DispatchQueue.main.async {
                self.movieListTabelView.setEmptyMessage("No Movies Found")
              }
            } else {
              DispatchQueue.main.async {
                self.movieListTabelView.restore()
              }
            }
        }).disposed(by: disposeBag)
    }
    
    func subscribeOnReachingTableViewBottomScroll() {
        movieListTabelView
            .rx
            .reachedBottom(offset: 100)
            .subscribe { [weak self] _ in
                self?.viewModel.fetchMovies()
            }
            .disposed(by: disposeBag)
    }
    
    func subscribeOnTableViewCellSelection() {
        movieListTabelView
            .rx
            .modelSelected(MovieData.self)
            .subscribe(onNext: { [weak self] movieData in
                self?.handleOnSelectMovie(with: movieData.id)
            })
            .disposed(by: disposeBag)
    }
    
    func handleOnSelectMovie(with movieID: Int) {
        self.navigationController?.pushViewController(MovieDetailsViewController(viewModel: MovieDetailsViewModel(movieID: movieID)), animated: true)
    }
}

//MARK: UITableViewDelegate
extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

// MARK: - AlertDisplayer & LoadingDisplayer

extension MovieListViewController: AlertDisplayerProtocol, LoadingDisplayerProtocol {
    func configureLoadingAndAlertViews() {
        bindLoadingIndicator(to: viewModel.stateRelay)
        bindAlert(to: viewModel.alertItemRelay)
    }
}
