//
//  DemoVC0.m
//  SDAutoLayout 测试 Demo
//
//  Created by gsd on 15/10/12.
//  Copyright (c) 2015年 gsd. All rights reserved.
//

/*
 
 *********************************************************************************
 *                                                                                *
 * 完善了第一列view距离nav bar的问题，横屏时也使用同样的规则                                                                    *
 * QQ    : 2689718696(gsdios)                                                      *
 * Email : gsdios@126.com                                                          *
 * GitHub: https://github.com/gsdios                                               *
 * 新浪微博:GSD_iOS                                                                 *
 *                                                                                *
 *********************************************************************************
 
 */

#import "DemoVC0.h"

@implementation DemoVC0

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect rectNav = self.navigationController.navigationBar.frame;
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    //top space to superview--rectNav.size.height+rectStatus.size.height+20
    //if it is in landscape view, the gap between view0 and nav bar is the same in portrait view
    self.view0.sd_layout
    .leftSpaceToView(self.view, 10)
    .topSpaceToView(self.view,rectNav.size.height+rectStatus.size.height+20)
    .heightIs(130)
    .widthRatioToView(self.view, 0.4);
    
    self.view1.sd_layout
    .leftSpaceToView(self.view0, 10)
    .topEqualToView(self.view0)
    .heightIs(60);
    
    self.view2.sd_layout
    .leftSpaceToView(self.view1, 10)
    .topEqualToView(self.view1)
    .heightRatioToView(self.view1, 1)
    .widthRatioToView(self.view1, 1);
    
    self.view3.sd_layout
    .leftEqualToView(self.view1)
    .topSpaceToView(self.view1, 10)
    .heightRatioToView(self.view1, 1)
    .widthRatioToView(self.view1, 1);
    
    self.view4.sd_layout
    .leftEqualToView(self.view2)
    .topEqualToView(self.view3)
    .heightRatioToView(self.view3, 1)
    .widthRatioToView(self.view1, 1);
    
    
    self.view5.sd_layout
    .topSpaceToView(self.view0, 20)
    .leftEqualToView(self.view0)
    .heightIs(120);
    
    self.view6.sd_layout
    .leftSpaceToView(self.view5, 10)
    .topEqualToView(self.view5)
    .heightRatioToView(self.view5, 1)
    .widthRatioToView(self.view5, 1);
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    //do the same for landscape view
    CGRect rectNav = self.navigationController.navigationBar.frame;
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    
    self.view0.sd_layout
    .topSpaceToView(self.view,rectNav.size.height+rectStatus.size.height+20);
    
    CGFloat view1W = (self.view.width * 0.6 - 10 * 4) / 2;
    self.view1.sd_layout.widthIs(view1W);
    
    CGFloat view5W = (self.view.width - 30) / 2;
    self.view5.sd_layout.widthIs(view5W);
}


@end

