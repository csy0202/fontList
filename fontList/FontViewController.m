//
//  FontViewController.m
//  SystemFont
//
//  Created by 紫竹 on 2017/11/27.
//  Copyright © 2017年 CSY. All rights reserved.
//

#import "FontViewController.h"

@interface FontViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation FontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = self.fontName;
    self.textView.font =[UIFont fontWithName:self.fontName size:15.0];
//    self.textView.userInteractionEnabled = NO;
}
- (IBAction)textField:(UITextField *)sender {
    self.textView.text = sender.text;
}

- (IBAction)slider:(UISlider *)sender {
    
    self.sizeLabel.text = [NSString stringWithFormat:@"%.0lf",sender.value];
    self.textView.font =[UIFont fontWithName:self.fontName size:self.sizeLabel.text.floatValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
