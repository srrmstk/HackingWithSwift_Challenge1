//
//  ViewController.swift
//  Challenge1
//
//  Created by srrmstk on 19.06.2023.
//

import UIKit

class ViewController: UITableViewController {
  var pictures = [String]()

  override func viewDidLoad() {
    super.viewDidLoad()

    let fm = FileManager.default
    let path = Bundle.main.resourcePath!
    let items = try! fm.contentsOfDirectory(atPath: path)

    for item in items {
      if item.hasSuffix(".png") {
        pictures.append(item)
      }
    }
    pictures.sort()
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pictures.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CountryRow", for: indexPath)
    var content = cell.defaultContentConfiguration()
    content.image = UIImage(named: pictures[indexPath.row])
    cell.contentConfiguration = content
    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let vc = storyboard?.instantiateViewController(identifier: "Detail") as DetailViewController? else {
      return
    }
    vc.picture = pictures[indexPath.row]
    navigationController?.pushViewController(vc, animated: true)
  }
}

