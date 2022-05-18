//
//  ScrollPhotoTableViewCell.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/25.
//

import UIKit
import SnapKit
import Reusable

class ScrollPhotoTableViewCell: UITableViewCell, Reusable {
    
    static let identifier = "ScrollPhotoTableViewCell"
    
    //MARK: - UIs
    lazy
    var titleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitlelabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 4
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "沒有想法嗎"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    let subtitlelabel: UILabel = {
        let label = UILabel()
        label.text = "看看最近有什麼最新展覽吧！"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .systemGray
        return label
    }()
    
    let imageBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 20
        return view
    }()
    
    let photoScrollView: UIScrollView = {
//        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: 100, height: 100)
        scrollView.backgroundColor = .black
        scrollView.isPagingEnabled = true
        // 是否顯示水平的滑動條
        scrollView.showsHorizontalScrollIndicator = false
        // 是否顯示垂直的滑動條
        scrollView.showsVerticalScrollIndicator = false
        // 是否可以按狀態列回到最上方
        scrollView.scrollsToTop = false
        // 滑動超過範圍時是否使用彈回效果
        scrollView.bounces = true
        // 以一頁為單位滑動
        scrollView.isPagingEnabled = true
        scrollView.layer.cornerRadius = 20
        return scrollView
    }()
    
    lazy
    var scrollViewContainer: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [testImageView, test2ImageView])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 0
        return stackView
    }()
    
    let imagePageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
//        pageControl.tintColor = .red
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .brown
        return pageControl
    }()
    
    let testImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "1"))
        return image
    }()
    
    let test2ImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "2"))
        return image
    }()
    
//    let leftButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
//        button.contentVerticalAlignment = .fill
//        button.contentHorizontalAlignment = .fill
//        return button
//    }()
//    
//    let rightButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
//        button.contentVerticalAlignment = .fill
//        button.contentHorizontalAlignment = .fill
//        return button
//    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupUI
    func setupUI() {
        contentView.addSubview(titleStackView)
        titleStackView.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }
        
        contentView.addSubview(imageBackView)
        imageBackView.snp.makeConstraints { make in
            make.top.equalTo(titleStackView.snp.bottom).offset(16)
            make.bottom.equalTo(-30)
            make.leading.equalTo(18)
            make.trailing.equalTo(-18)
        }
        
        imageBackView.addSubview(photoScrollView)
        photoScrollView.snp.makeConstraints { make in
            make.top.equalTo(imageBackView.snp.top).offset(16)
            make.leading.equalTo(imageBackView.snp.leading).offset(16)
            make.trailing.equalTo(imageBackView.snp.trailing).offset(-16)
            make.bottom.equalTo(imageBackView.snp.bottom).offset(-81)
        }
        
        photoScrollView.addSubview(scrollViewContainer)
        scrollViewContainer.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
            make.top.equalTo(photoScrollView.snp.top)
            make.leading.equalTo(photoScrollView.snp.leading)
            make.trailing.equalTo(photoScrollView.snp.trailing)
        }
        
        testImageView.snp.makeConstraints { make in
            make.top.equalTo(photoScrollView.snp.top)
            make.bottom.equalTo(photoScrollView.snp.bottom)
            make.width.equalTo(photoScrollView.snp.width)
        }

        test2ImageView.snp.makeConstraints { make in
            make.top.equalTo(photoScrollView.snp.top)
            make.bottom.equalTo(photoScrollView.snp.bottom)
            make.width.equalTo(photoScrollView.snp.width)
        }
        
        contentView.addSubview(imagePageControl)
        imagePageControl.snp.makeConstraints { make in
            make.top.equalTo(imageBackView.snp.bottom).offset(5)
            make.centerX.equalTo(self.snp.centerX)
        }
        
//        contentView.addSubview(leftButton)
//        leftButton.snp.makeConstraints { make in
//            make.centerY.equalTo(photoScrollView.snp.centerY)
//            make.leading.equalTo(20)
//            make.height.equalTo(50)
//            make.width.equalTo(30)
//        }
//
//        contentView.addSubview(rightButton)
//        rightButton.snp.makeConstraints { make in
//            make.centerY.equalTo(leftButton.snp.centerY)
//            make.trailing.equalTo(-20)
//            make.height.equalTo(50)
//            make.width.equalTo(30)
//        }
    }
}

//MARK: - Scroll Delegate
extension ScrollPhotoTableViewCell: UIScrollViewDelegate {
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//
//        let page = scrollView.contentOffset.x / scrollView.bounds.width
//        pageControl.currentPage = Int(page)
//    }
}
