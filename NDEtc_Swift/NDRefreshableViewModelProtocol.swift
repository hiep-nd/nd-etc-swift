//
//  NDRefreshableViewModelProtocol.swift
//  NDEtc_Swift
//
//  Created by Nguyen Duc Hiep on 8/13/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

import NDMVVM

extension NDRefreshableViewModelProtocol {
  @inlinable
  public func mimicRefresh() {
    __NDRefreshableViewModelMimicRefresh(self)
  }
}
