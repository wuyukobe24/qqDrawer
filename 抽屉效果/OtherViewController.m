//
//  OtherViewController.m
//  抽屉效果
//
//  Created by WangXueqi on 16/12/10.
//  Copyright © 2016年 JingBei. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController ()

@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"其他";
    [self creatSubView];
}

-(void)creatSubView{

    UIImageView * imagView = [[UIImageView alloc]init];
    imagView.frame = CGRectMake(0, 0, self.view.frame.size.width/2, self.view.frame.size.height/2);
    imagView.center = self.view.center;
    imagView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:imagView];
    imagView.image = _image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
