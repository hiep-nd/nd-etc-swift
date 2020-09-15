//
//  NDTagsList.swift
//  NDEtc_Swift
//
//  Created by Nguyen Duc Hiep on 8/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

import NDLog_Swift
import NDMVVM
import TagListView

open class NDTagItemViewModel: NDItemViewModel {
  open var title: String?
}

open class NDTagView: TagView, NDManualObjectProtocol, NDViewProtocol {
  open var removeButton: UIButton? {
    subviews.first(where: { $0 is UIButton }).map({ $0 as! UIButton })
  }

  required public init() {
    super.init(title: "")
    manualInit()
  }

  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    manualInit()
  }

  override init(title: String) {
    super.init(title: title)
    manualInit()
  }

  open func manualInit() {}

  public var viewModel: NDViewModelProtocol?

  public func validate(_ viewModel: NDViewModelProtocol) -> Bool {
    return viewModel is NDTagItemViewModel
  }

  public func didSetViewModel(
    fromOldViewModel oldViewModel: NDViewModelProtocol?
  ) {
    setTitle(rViewModel?.title, for: [])
  }

  private var rViewModel: NDTagItemViewModel? {
    viewModel as? NDTagItemViewModel
  }
}

open class NDTagsListView: TagListView, NDManualObjectProtocol,
  NDListViewProtocol, TagListViewDelegate
{
  override init(frame: CGRect) {
    super.init(frame: frame)
    manualInit()
  }

  required public init?(coder: NSCoder) {
    super.init(coder: coder)
    manualInit()
  }

  public func manualInit() {
    self.delegate = self
  }

  private var classes = [String: AnyClass]()
  open func register(identifier: String, class cls: AnyClass) {
    guard cls is NDTagView.Type else {
      // TODO: -
      nd_assertionFailure()
      return
    }
    classes[identifier] = cls
  }

  public var viewModel: NDViewModelProtocol?

  public func validate(_ viewModel: NDViewModelProtocol) -> Bool {
    return viewModel is NDListViewModelProtocol
  }

  public func didSetViewModel(
    fromOldViewModel oldViewModel: NDViewModelProtocol?
  ) {
    reloadAll()
  }

  func reloadAll() {
    removeAllTags()
    if let rViewModel = rViewModel {
      addTagViews((0..<rViewModel.numberOfItems()).map({ tagView(at: $0) }))
    }
  }

  func tagView(at item: Int) -> NDTagView {
    let viewModel = rViewModel!.viewModel(forItem: item)
    let view: NDTagView
    if let cls = classes[viewModel.identifier] as? NDTagView.Type {
      view = cls.init()
    } else {
      nd_assertionFailure(
        "Unable to create tag view with identifier: '\(viewModel.identifier)' - must register a class for the identifier first."
      )
      view = NDTagView()
    }
    nd_connect(viewModel: viewModel, view: view)
    return view
  }

  private var rViewModel: NDListViewModelProtocol? {
    viewModel as? NDListViewModelProtocol
  }
}

open class NDMutableTagsListView: NDTagsListView, NDMutableListViewProtocol {
  @objc
  public override func reloadAll() {
    super.reloadAll()
  }

  public func deleteItems(
    _ deletedItems: [NSNumber]?, updateItems updatedItems: [NSNumber]?,
    insertItems insertedItems: [NSNumber]?
  ) {
    // TODO:- need implement
    nd_assertionFailure("Not implemented")

    //    let sortedDeleteds = deletedItems?.map({ $0.intValue }).sorted() ?? []
    //    let sortedInserteds = insertedItems?.map({ $0.intValue }).sorted() ?? []
    //    updatedItems?.subtract(deletedItems ?? [], { $0.isEqual(to: $1) }).forEach {
    //      let item = $0.intValue
    //      removeTagView(tagViews[item])
    //      insertTagView(tagView(at: item), at: item)
    //    }
    //
    //    deletedItems?.reversed().forEach {
    //      remove
    //    }
  }
}
