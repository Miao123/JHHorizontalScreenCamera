//
//  imageViewController.m
//  横屏时访问相册
//
//  Created by andy on 16/3/17.
//  Copyright © 2016年 andy. All rights reserved.
//

#import "imageViewController.h"

@interface imageViewController ()<UIImagePickerControllerDelegate>

@end

@implementation imageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(UIInterfaceOrientationMask) application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
    return UIInterfaceOrientationMaskLandscapeLeft;
}

-(BOOL) prefersStatusBarHidden{
    return YES;
}


- (BOOL)shouldAutorotate{
    return YES;
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
