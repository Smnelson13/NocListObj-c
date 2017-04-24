//
//  NOCListTableViewController.m
//  NocListObj-c
//
//  Created by Shane Nelson on 4/24/17.
//  Copyright © 2017 Shane Nelson. All rights reserved.
//

#import "NOCListTableViewController.h"
#import "Agent.h"

@interface NOCListTableViewController ()
{
  NSMutableArray *agents;
}

- (void)loadAgents;

@end

@implementation NOCListTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
  [super viewDidLoad];
  self.title = @"Agents";
  agents = [[NSMutableArray alloc] init];
  [self loadAgents];
}

- (void)loadAgents
{
  NSString *filePath = [[NSBundle mainBundle] pathForResource:@"NOC" ofType:@"json"];
  
  NSArray *NOCJSON = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
  
  for (NSDictionary *aDict in NOCJSON)
  {
    Agent *anAgent = [Agent agentWithDictionary:aDict];
    [agents addObject:anAgent];
  }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [agents count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AgentCell" forIndexPath:indexPath];
  
  Agent *aAgent = [agents objectAtIndex:indexPath.row];
  
  cell.textLabel.text = aAgent.realName;
  cell.detailTextLabel.text = aAgent.coverName;
  
    return cell;
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
