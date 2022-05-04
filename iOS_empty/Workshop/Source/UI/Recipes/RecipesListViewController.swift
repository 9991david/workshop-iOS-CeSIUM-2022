// See license.md

import UIKit

class RecipesListViewController: UIViewController {

  private let recipeStore: RecipeStore
  private var recipes: [Recipe]
  private var filteredRecipes: [Recipe]

  private let recipesCollectionView: UICollectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: UICollectionViewFlowLayout.makeLayout(
      minimumInteritemSpacing: 0,
      minimumLineSpacing: 16
    )
  )

  init(recipeStore: RecipeStore) {
    self.recipeStore = recipeStore
    self.recipes = [Recipe]()
    self.filteredRecipes = [Recipe]()

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

  override func viewDidLoad() {
    super.viewDidLoad()

    setupLayout()
    setupView()
    loadRecipes()
  }

  private func setupLayout() {
  }

  private func setupView() {
    title = "Receitas"

    view.backgroundColor = UIColor.nutriumBackground

    recipesCollectionView.showsVerticalScrollIndicator = false
    recipesCollectionView.backgroundColor = UIColor.nutriumBackground
    recipesCollectionView.register(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: "RecipeCell")

    setupSearchBar()
  }

  private func setupSearchBar() {
    let searchController = UISearchController(searchResultsController: nil)
    searchController.searchResultsUpdater = self
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.placeholder = "Procurar receitas"

    navigationItem.searchController = searchController

    definesPresentationContext = true
  }

  private func loadRecipes() {
    // Nota: Podia-se colocar um indicador de loading no UI enquanto executamos esta operação

    // A operação para se obter receitas é async
    // Marcamos self como weak para caso o utilizador sai do ecrã o resultado desta operação seja cancelada
    // Também se podia fazer com que o fetchRecipes devolva uma operação e depois cancelava-se essa operação
    recipeStore.fetchRecipes { [weak self] recipes in
      // Componentes de UI trabalham no DispatchQueue.main
      DispatchQueue.main.async {
        guard let self = self else { return }

        self.recipes = recipes

        // Bug: não estamos a aplicar filtro caso o utilizador esteja a filtrar
        self.filteredRecipes = recipes

        self.recipesCollectionView.dataSource = self
        self.recipesCollectionView.delegate = self

        self.recipesCollectionView.reloadData()
      }
    }
  }

}

// MARK: UICollectionViewDataSource
extension RecipesListViewController: UICollectionViewDataSource {

  private func getReusableRecipeCell(indexPath: IndexPath) -> RecipeCollectionViewCell {
    return recipesCollectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as! RecipeCollectionViewCell
  }

  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return 0
  }

  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let cell = getReusableRecipeCell(indexPath: indexPath)

    return cell
  }

}

// MARK: UICollectionViewDelegateFlowLayout
extension RecipesListViewController: UICollectionViewDelegateFlowLayout {

  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    return CGSize(
      width: collectionView.bounds.width,
      height: collectionView.bounds.width
    )
  }

  func collectionView(
    _ collectionView: UICollectionView,
    willDisplay cell: UICollectionViewCell,
    forItemAt indexPath: IndexPath
  ) {
    cell.alpha = 0
    cell.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)

    UIView.animate(withDuration: 0.33) {
      cell.alpha = 1
      cell.transform = .identity
    }
  }

}

// MARK: UISearchResultsUpdating
extension RecipesListViewController: UISearchResultsUpdating {

  func updateSearchResults(for searchController: UISearchController) {
  }

}
