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
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "沒有想法嗎"
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
    
    let photoScrollView: UIScrollView = {
        
//        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        let scrollView = UIScrollView()
//        scrollView.contentSize = CGSize(width: 5000, height: 300)
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
    
    let testImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "1"))
        return image
    }()
    
    let test2ImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "2"))
        return image
    }()
    
    let leftButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        
        return button
    }()
    
    let rightButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        return button
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupUI
    func setupUI() {
        contentView.addSubview(titleStackView)
        titleStackView.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }
        
        contentView.addSubview(photoScrollView)
        photoScrollView.snp.makeConstraints { make in
            make.top.equalTo(titleStackView.snp.bottom).offset(16)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.bottom.equalTo(-16)
        }
        
        photoScrollView.addSubview(scrollViewContainer)
        scrollViewContainer.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        testImageView.snp.makeConstraints { make in
            make.top.equalTo(photoScrollView.snp.top)
            make.bottom.equalTo(photoScrollView.snp.bottom)
            make.width.equalTo(titleStackView.snp.width)
        }
        
        test2ImageView.snp.makeConstraints { make in
            make.top.equalTo(photoScrollView.snp.top)
            make.bottom.equalTo(photoScrollView.snp.bottom)
            make.width.equalTo(titleStackView.snp.width)
        }
        
        contentView.addSubview(leftButton)
        leftButton.snp.makeConstraints { make in
            make.top.equalTo(titleStackView.snp.bottom).offset(250)
            make.leading.equalTo(20)
        }
        
        contentView.addSubview(rightButton)
        rightButton.snp.makeConstraints { make in
            make.trailing.equalTo(-20)
            make.centerY.equalTo(leftButton.snp.centerY)
        }
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
