//
//  UIListViewCell.h
//  DiDiSongYou
//
//  Created by Wayne on 6/16/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  列表行视图处理类
 */
@interface UIListViewCell : UITableViewCell

/**
 *  设置列数
 *
 *  @param count 列数
 */
- (void)setColumnCount:(NSInteger)count;

/**
 *  设置列标题
 *
 *  @param title  标题
 *  @param column 列索引
 *  @retun 操作成功返回YES，否则返回NO
 */
- (BOOL)setColumnTitle:(NSString*)title withColumn:(NSInteger)column;

/**
 *  获取某列的视图
 *
 *  @param column 列索引
 *
 *  @return 列视图对象
 */
- (id)viewWithColumn:(NSInteger)column;
@end
