//
//  ViewController.m
//  横屏时访问相册
//
//  Created by andy on 16/3/17.
//  Copyright © 2016年 andy. All rights reserved.
//

#import "ViewController.h"
#import "imageViewController.h"
#import "PhotoManager.h"
@interface ViewController ()<UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}
- (void)button:(UIButton *)sender{
    UIActionSheet *actionSheet = [UIActionSheet new];
    actionSheet.delegate = self;
    [actionSheet addButtonWithTitle:@"拍照"];
    [actionSheet addButtonWithTitle:@"相册选择"];
    [actionSheet addButtonWithTitle:@"取消"];
    actionSheet.cancelButtonIndex = actionSheet.numberOfButtons - 1;
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if ( buttonIndex == 0 ) {
        NSLog(@"相机");
        [self selectCamera];
        
    }else if( buttonIndex == 1 ){
        NSLog(@"照片");
        [[PhotoManager getInstance] setShuping];
        [self selectPhotos];
    }else{
        NSLog(@"取消了啊啊 ");
    }
}

//从相机中选
-(void)selectCamera{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *image = [[UIImagePickerController alloc] init];
        image.delegate = self;
        image.allowsEditing = NO;
        image.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self dismissViewControllerAnimated:YES completion:nil];
        [self presentViewController:image animated:YES completion:^{}];
    }else{
        NSLog(@"请确定相机是否能正常打开");
    }
}

-(BOOL) shouldAutorotate{
    return YES;
}

//从相册中选择
-(void)selectPhotos{
    if ([imageViewController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum; //保存的相片
        imageViewController *picker = [[imageViewController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = NO;//是否允许编辑
        picker.sourceType = sourceType;
        [self dismissViewControllerAnimated:YES completion:^{
            [[PhotoManager getInstance] setShuping];
        }];
        [self presentViewController:picker animated:YES completion:nil];
    }else{
        [[PhotoManager getInstance] setHengping];
    }
}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [[PhotoManager getInstance] setHengping];
    NSLog(@"选择了照片");
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [[PhotoManager getInstance] setHengping];
    [picker dismissViewControllerAnimated:YES completion:^{
    }];
    NSLog(@"xuanz");
    
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [[PhotoManager getInstance] setHengping];
    [picker dismissViewControllerAnimated:YES completion:^{
    }];
    NSLog(@"取消");
}

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
