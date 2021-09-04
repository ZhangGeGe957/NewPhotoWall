//
//  ViewController.m
//  new照片墙
//
//  Created by 张佳乔 on 2021/9/1.
//

#import "ViewController.h"
#import "PhotoViewController.h"

@interface ViewController ()<TransitionPhotoDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatView];
}

- (void)creatView {
    self.photoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.photoButton.backgroundColor = [UIColor grayColor];
    [self.photoButton setTitle:@"请添加图片" forState:UIControlStateNormal];
    [self.photoButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.photoButton];
    [self.photoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(50);
        make.right.equalTo(self.view).with.offset(-100);
        make.top.equalTo(self.view).with.offset(200);
        make.bottom.equalTo(self.view).with.offset(-500);
    }];
}

- (void)pressButton:(UIButton *)button {
    PhotoViewController *photo = [[PhotoViewController alloc] init];
    photo.modalPresentationStyle = UIModalPresentationFullScreen;
    photo.delegate = self;
    [self presentViewController:photo animated:YES completion:nil];
}

- (void)changePhoto:(NSMutableArray *)imageArray {
    if (self.quantity.tag == 1) {
        [self.quantity removeFromSuperview];
    }
    
    UIButton *button = imageArray[0];
    NSString *imageName = [[NSString alloc] initWithFormat:@"1-%ld.jpeg", button.tag - 1];
    NSInteger sum = imageArray.count;
    [self.photoButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    NSString* number = [[NSString alloc] initWithFormat:@"%ld", sum];
    self.quantity = [[UILabel alloc] init];
    self.quantity.text = number;
    self.quantity.textColor = [UIColor redColor];
    self.quantity.tag = 1;
    self.quantity.backgroundColor = [UIColor whiteColor];
    self.quantity.frame = CGRectMake(240, 3, 18, 18);
    [self.photoButton addSubview:self.quantity];
}

@end
