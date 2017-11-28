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
@property (nonatomic,strong)NSMutableArray * array;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.array =[NSMutableArray array];
    self.array = [UIFont familyNames].mutableCopy;
    
    [self.array sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSString *a = (NSString *)obj1;
        NSString *b = (NSString *)obj2;
        
        if (a > b) {
            return NSOrderedDescending;
        }
        else if (a < b){
            return NSOrderedAscending;
        }
        else {
            return NSOrderedSame;
        }
    }];
    
    NSLog(@"p %@", self.array);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [UIFont familyNames].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString * name =[UIFont familyNames][section];
    NSArray * mames =[UIFont fontNamesForFamilyName:name];
    return mames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSString * name =[UIFont familyNames][indexPath.section];
    NSArray * mames =[UIFont fontNamesForFamilyName:name];
    NSString * string =mames[indexPath.row];
    cell.textLabel.text =@"紫竹吟风 love 123 @#%&";
    cell.textLabel.font =[UIFont fontWithName:string size:17];
    cell.detailTextLabel.text = string;
    
    return cell;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [UIFont familyNames][section];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * name =[UIFont familyNames][indexPath.section];
    NSArray * mames =[UIFont fontNamesForFamilyName:name];
    NSString * string =mames[indexPath.row];
   [self performSegueWithIdentifier:@"next"sender:string];

}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    FontViewController* vc=segue.destinationViewController;
//    UITableViewCell * cell = sender;
//    NSIndexPath* indexPath = [self.tableView indexPathForCell:cell];
//    NSString * name =[UIFont familyNames][indexPath.section];
//    NSArray * mames =[UIFont fontNamesForFamilyName:name];
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
