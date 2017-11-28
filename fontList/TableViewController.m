//
//  TableViewController.m
//  SystemFont
//
//  Created by 紫竹 on 2017/11/27.
//  Copyright © 2017年 CSY. All rights reserved.
//

#import "TableViewController.h"
#import "FontViewController.h"
@interface TableViewController ()
@property (nonatomic,strong)NSArray * familyNames;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (NSString * familyName in [UIFont familyNames]) {
        NSArray * fontNames =[UIFont fontNamesForFamilyName:familyName];
        NSLog(@"familyName: %@",familyName);
        for (NSString * fontName in fontNames) {
            NSLog(@"   fontName: %@",fontName);
        }
    }
    self.familyNames = [[UIFont familyNames] sortedArrayUsingSelector:@selector(compare:)];
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.familyNames.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString * familyName =self.familyNames[section];
    NSArray * fontNames =[UIFont fontNamesForFamilyName:familyName];
    return fontNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSString * familyName =self.familyNames[indexPath.section];
    NSArray * fontNames =[UIFont fontNamesForFamilyName:familyName];
    NSString * fontName =fontNames[indexPath.row];
    cell.textLabel.text =@"紫竹吟风 ❤️ zyl 1314 @#%&";
    cell.textLabel.font =[UIFont fontWithName:fontName size:17];
    cell.detailTextLabel.text = fontName;
    return cell;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.familyNames[section];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * familyName =self.familyNames[indexPath.section];
    NSArray * fontNames =[UIFont fontNamesForFamilyName:familyName];
    NSString * fontName =fontNames[indexPath.row];
   [self performSegueWithIdentifier:@"next"sender:fontName];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    FontViewController* vc=segue.destinationViewController;
    vc.fontName= sender;
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
