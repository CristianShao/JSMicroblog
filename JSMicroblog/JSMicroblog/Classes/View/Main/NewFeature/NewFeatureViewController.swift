//
//  NewFeatureViewController.swift
//  JSMicroblog
//
//  Created by ShaoJiansheng on 16/4/12.
//  Copyright © 2016年 ASM. All rights reserved.
//

import UIKit
import SnapKit

private let WBNewFeatureID = "WBNewFeatureID"

//图片数量
private let WBImageCount  = 4

class NewFeatureViewController: UICollectionViewController {
    
    init(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = UIScreen.mainScreen().bounds.size
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .Horizontal
        
        super.init(collectionViewLayout: layout)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCollectView()
      
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    private func loadCollectView(){
        // Register cell classes
        self.collectionView!.registerClass(NewFeatureCell.self, forCellWithReuseIdentifier: WBNewFeatureID)
        collectionView?.pagingEnabled = true
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.bounces = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - UICollectionViewDataSource


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return WBImageCount
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(WBNewFeatureID, forIndexPath: indexPath) as! NewFeatureCell
    
        cell.imageIndex = indexPath.row
    
        return cell
    }
    
    override func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let offset = Int(scrollView.contentOffset.x / scrollView.bounds.size.width)
        
        if offset == (WBImageCount-1){
            (collectionView?.visibleCells().last as!NewFeatureCell).showStartBtn()
        }
        
    }

}
 ///  自定义CELL
private class NewFeatureCell :UICollectionViewCell{
    private var imageIndex :Int =  0{
        didSet{
            iconView.image = UIImage(named: "new_feature_\(imageIndex + 1)")
            
            startBtn.hidden = true
        }
    }
    
    //监听方法
    @objc private func didClickBtn(){
        print("OK")
    }
    //按钮动画
    private func showStartBtn(){
        startBtn.hidden = false
        startBtn.userInteractionEnabled = false
        startBtn.transform = CGAffineTransformMakeScale(0, 0)
        UIView.animateWithDuration(1.2,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 10,
            options: [],
            animations: { () -> Void in
                self.startBtn.transform = CGAffineTransformIdentity
                
            }) { (_) -> Void in
                self.startBtn.userInteractionEnabled = true
        }
    }
    
    /// 设置cell
    override init(frame: CGRect) {
        super.init(frame :frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        addSubview(iconView)
        addSubview(startBtn)
        startBtn.layer.cornerRadius = 5;
        startBtn.layer.masksToBounds = true
        
        //自动布局
        iconView.frame = bounds
        startBtn.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.snp_centerX)
            make.bottom.equalTo(self.snp_bottom).multipliedBy(0.7)
        }
        //添加监听方法
        startBtn.addTarget(self, action: "didClickBtn", forControlEvents: .TouchUpInside)
        
    }
    
    private lazy var iconView = UIImageView()
    
    private lazy  var  startBtn = UIButton(title: "立即体验", size: 18, titleColor: UIColor.whiteColor(), bgImg: "new_feature_finish_button")
    
    
}
