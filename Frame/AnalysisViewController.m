//
//  AnalysisViewController.m
//  Frame
//
//  Created by Jovanny Espinal on 11/16/15.
//  Copyright © 2015 Jovanny Espinal. All rights reserved.
//

#import "AnalysisViewController.h"
#import "LQNetworkManager.h"
#import <AFNetworking/AFNetworking.h>
#import "PNChart.h"


@interface AnalysisViewController ()
@property (weak, nonatomic) IBOutlet UILabel *sentimentLabel;
@property (weak, nonatomic) IBOutlet UILabel *subjectivityLabel;
@property (nonatomic) PNPieChart *pieChart;
@end

@implementation AnalysisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sentimentLabel.text = self.articleObject.sentimentAnalysis;
    self.subjectivityLabel.text = self.articleObject.subjectivityAnalysis;
    
    NSArray *items = @[[PNPieChartDataItem dataItemWithValue:self.articleObject.liberal color:PNRed description:@"Liberal"],
                       [PNPieChartDataItem dataItemWithValue:self.articleObject.green color:PNGreen description:@"Green"],
                       [PNPieChartDataItem dataItemWithValue:self.articleObject.conservative color:PNBlue description:@"Conservative"],
                       [PNPieChartDataItem dataItemWithValue:self.articleObject.libertarian color:PNYellow description:@"Libertarian"]
                       ];
    
    self.pieChart = [[PNPieChart alloc] initWithFrame:CGRectMake(SCREEN_WIDTH /2.0 - 100, 240, 240.0, 240.0) items:items];
    self.pieChart.center = self.view.center;
    self.pieChart.descriptionTextColor = [UIColor whiteColor];
    self.pieChart.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium" size:11.0];
    self.pieChart.descriptionTextShadowColor = [UIColor clearColor];
    self.pieChart.showAbsoluteValues = NO;
    self.pieChart.showOnlyValues = NO;
    [self.pieChart strokeChart];
    
    
    self.pieChart.legendStyle = PNLegendItemStyleStacked;
    self.pieChart.legendFont = [UIFont boldSystemFontOfSize:12.0f];
    
    UIView *legend = [self.pieChart getLegendWithMaxWidth:200];
    [legend setFrame:CGRectMake(150, 470, legend.frame.size.width, legend.frame.size.height)];
    
    
    [self.view addSubview:legend];
    
    [self.view addSubview:self.pieChart];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissViewController:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
