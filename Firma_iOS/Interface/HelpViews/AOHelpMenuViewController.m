    //
    //  AOHelpMenuViewController.m
    //  Firma_iOS
    //
    //

#import "AOHelpMenuViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "NSMutableAttributedString+Extension.h"
#import "AOHelpCell.h"
#import "GlobalConstants.h"
#import "UIFont+Utils.h"

@interface AOHelpMenuViewController ()

@end

@implementation AOHelpMenuViewController

@synthesize tblViewHelp;
NSMutableArray *tableData = NULL;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
            // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        // Do any additional setup after loading the view.
    
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    
        // Load data
    [self populateTable];
    
    self.screenName = @"IOS AOHelpMenuViewController - Help menu";
    
        // Help menu description
    UIFont *helpMenuDescriptionFont = [UIFont systemFontOfSize:14];
    NSMutableAttributedString *helpMenuDescriptionAttributedString = [@"help_menu_description_label".localized getHtml:helpMenuDescriptionFont];
    [helpMenuDescriptionAttributedString addExternalLinkIcon:helpMenuDescriptionFont];
    [helpMenuDescriptionAttributedString align:NSTextAlignmentCenter];
    [self.helpMenuDescriptionLabel setAttributedText:helpMenuDescriptionAttributedString];
    
        // Help menu
    [self.helpMenuTitle setText: @"help_menu_title".localized];
    self.title = @"help".localized ;
    
        // Logo
    self.logo.accessibilityLabel = @"logo".localized;
    
        // Table
        // Borders
    self.tblViewHelp.layer.borderWidth = 0.5;
    self.tblViewHelp.layer.borderColor = [[UIColor grayColor] CGColor];
    self.tblViewHelp.layer.cornerRadius = 6.0f;
        // Necessary for the cells to adjust their height automatically
    self.tblViewHelp.estimatedRowHeight = 44.0;
    self.tblViewHelp.rowHeight = UITableViewAutomaticDimension;
    self.tblViewHelpHeight.constant = [self calculateTotalTableHeight];
    
        // If it is an iPad we increase it and it is in a vertical position, we increase the height of the text below the table
    if (UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation) && ([(NSString*)[UIDevice currentDevice].model hasPrefix:IPAD] )) {
        
        self.tblViewHelp.translatesAutoresizingMaskIntoConstraints = YES;
        
        dispatch_async(dispatch_get_main_queue(), ^(void){
            CGFloat descriptionLabelNewSize = 300;
            
                // Update helpMenuDescriptionLabel height
            CGRect descriptionLabelFrame= self.helpMenuDescriptionLabel.frame;
            descriptionLabelFrame.size.height = descriptionLabelNewSize;
            [self.helpMenuDescriptionLabel setFrame:descriptionLabelFrame];
            
                // Update tblViewHelp height
            CGRect tableFrame= self.tblViewHelp.frame;
            tableFrame.size.height = tableFrame.size.height - descriptionLabelNewSize;
            [self.tblViewHelp setFrame:tableFrame];
            [self.tblViewHelp setNeedsDisplay];
        });
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
}


- (IBAction)goBackHome:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

    // We configure the options available in the table
-(void)populateTable {
    
    tableData = [[NSMutableArray alloc] init];
    
    [tableData addObject: @"help_acercade".localized];
    [tableData addObject: @"help_instalar_certificados".localized];
    [tableData addObject: @"help_preguntas".localized];
    [tableData addObject: @"privacy_policy".localized];
    [tableData addObject: @"accesibility_statement".localized];
}

    // Method to get the height of the table
- (CGFloat)calculateTotalTableHeight {
    CGFloat totalHeight = 0.0;
    for (NSInteger section = 0; section < [self.tblViewHelp numberOfSections]; section++) {
        for (NSInteger row = 0; row < [self.tblViewHelp numberOfRowsInSection:section]; row++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
            UITableViewCell *cell = [self.tblViewHelp cellForRowAtIndexPath:indexPath];
            
            CGFloat contentHeight = [self heightForCell:cell];
            totalHeight += contentHeight;
        }
    }
    return totalHeight;
}

    // Method to calculate the height of the cell that is passed by parameter
- (CGFloat)heightForCell:(UITableViewCell *)cell {
        // Get cell label
    AOHelpCell *helpCell = (AOHelpCell *)cell;
    UILabel *label = [helpCell getCellLabel];
    
        // Scale the font based on what the user has selected
    UIFont *fontScaled = [[UIFont alloc] scaledSystemFont:label.font.pointSize iPadFontSize:label.font.pointSize];
        // Calculate label size based on font
    CGSize size = [label.text sizeWithAttributes:@{NSFontAttributeName: fontScaled}];
    
    CGFloat height = size.height;
    height += fontScaled.lineHeight;
    
    return height;
}

/******************************************************************/
/******** METODOS IMPLEMENTADOS DE LA TABLA DE CERTIFICADOS *******/
/******************************************************************/

#pragma mark -
#pragma mark Table view data source
    // Detalla el nombre de secciones en la tabla.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

    // Detalla el número de filas en la tabla.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tableData count];
}

    // Detalla la apariencia de las celdas.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AOHelpCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HelpCell"];
    
    [cell setCellLabel:[tableData objectAtIndex:indexPath.row]];
    [cell setSelectionStyle: UITableViewCellSelectionStyleDefault];
    [cell setAccessoryType: UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
}

    //Nos devuelve la fila seleccionada.
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int fila = (int)indexPath.row;
    @try {
        if(fila==0 || fila == 1 || fila == 2){
            NSString *destinationVCName;
            switch(fila){
                case 0:
                    destinationVCName = @"AboutScreen";
                    break;
                case 1:
                    destinationVCName = @"CertificateInstallationScreen";
                    break;
                case 2:
                    destinationVCName = @"FrequentlyQuestionsScreen";
                    break;
            }
            UIViewController *destinationController = [self.storyboard instantiateViewControllerWithIdentifier:destinationVCName];
            [self.navigationController pushViewController:destinationController animated:YES];
        }
        else if (fila==3) {
                // Open privacy policy
            NSURL* privacyPolicyUrl = [NSURL URLWithString: @"url_privacy_policy".localized];
            if( [[UIApplication sharedApplication] canOpenURL:privacyPolicyUrl])
                [[UIApplication sharedApplication] openURL:privacyPolicyUrl options:@{} completionHandler:nil];
        }
        else if (fila==4) {
                // Open accesibility statement
            NSURL* accesibiltyUrl = [NSURL URLWithString: @"url_accessibility_statement".localized];
            if( [[UIApplication sharedApplication] canOpenURL:accesibiltyUrl])
                [[UIApplication sharedApplication] openURL:accesibiltyUrl options:@{} completionHandler:nil];
        }
    }
    @catch (NSException *e) {
            // Se ignora
    }
}

@end
