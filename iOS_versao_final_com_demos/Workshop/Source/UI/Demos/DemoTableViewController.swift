// See license.md

import UIKit

class DemoTableViewController: UIViewController, UITableViewDataSource {

  private let exampleTableView = UITableView()

  private let colors: [UIColor] = [
    .green,
    .blue,
    .red
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()

    setupLayout()
    setupView()
  }

  private func setupLayout() {
    view.addSubviews([
      exampleTableView
    ])

    NSLayoutConstraint.activate([
      exampleTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
      exampleTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
      exampleTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
      exampleTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
    ])
  }

  private func setupView() {
    title = "DemoTableViewController"

    view.backgroundColor = UIColor.nutriumBackground

    exampleTableView.backgroundColor = UIColor.nutriumBackground

    exampleTableView.register(UITableViewCell.self, forCellReuseIdentifier: "ExampleCell")

    exampleTableView.dataSource = self
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return colors.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ExampleCell", for: indexPath)

    cell.backgroundColor = colors[indexPath.row]

    return cell
  }

}
