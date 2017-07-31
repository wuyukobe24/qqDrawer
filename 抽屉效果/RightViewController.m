//
//  RightViewController.m
//  抽屉效果
//
//  Created by WangXueqi on 16/12/7.
//  Copyright © 2016年 JingBei. All rights reserved.
//

#import "RightViewController.h"
#import "OtherViewController.h"
@interface RightViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * testTableView;
@end

@implementation RightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    UIBarButtonItem * btnItem = [[UIBarButtonItem alloc]initWithTitle:@"点击" style:UIBarButtonItemStylePlain target:self action:@selector(btnClick)];
    self.navigationItem.leftBarButtonItem = btnItem;
    
    
    [self creatSubView];
}

-(void)creatSubView{
//
//    UIButton * button = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    button.center = self.view.center;
//    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
    
    _testTableView = [[UITableView alloc]initWithFrame:CGRectMake(10, 0, self.view.frame.size.width-20, self.view.frame.size.height) style:UITableViewStyleGrouped];
    _testTableView.delegate = self;
    _testTableView.dataSource = self;
    [self.view addSubview:_testTableView];
    
}

-(void)buttonClick{

  
}

- (UIImage*)screenView:(UIView *)view{
    CGRect rect = view.frame;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

-(void)btnClick{

    OtherViewController * other = [[OtherViewController alloc]init];
    UIImage * img = [self screenView:self.view];
    NSLog(@"image == %@",img);
    other.image = img;
    
    [self.navigationController pushViewController:other animated:YES];
    
    //    发送通知
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"主传左" object:nil];
}

#pragma mark - 

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
        cell.textLabel.text = @"京北众筹";
        
    }
    return cell;
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
