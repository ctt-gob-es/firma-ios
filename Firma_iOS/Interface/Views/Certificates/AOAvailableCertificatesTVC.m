//
//  AOAvailableCertificatesTVC.m
//  Firma_iOS
//
//  Created by Rocio Tovar on 25/3/15.
//  Copyright (c) 2015 Atos. All rights reserved.
//

#import "AOAvailableCertificatesTVC.h"
#import "GlobalConstants.h"

static NSString *const kAOAvailableCertificatesTVCCellIdentifier = @"AOCertificateFileCell";

@interface AOAvailableCertificatesTVC ()
{
    NSString *_selectedCertificate;
    NSArray *_filesArray;
}

@property (strong, nonatomic) IBOutlet UILabel *messageLabel;

@end

@implementation AOAvailableCertificatesTVC

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView reloadData];
    _selectedCertificate = nil;
    _filesArray = [self findFiles:@[@"p12", @"pfx"]];
    
    if (_filesArray.count == 0) {
        _messageLabel.text = NSLocalizedString(@"certificate_instructions", nil);
    }
    
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [self.availableCertificatesDescriptionLabel setText:NSLocalizedString(@"available_certificates_description_label", nil)];
    self.title = NSLocalizedString(@"available_certificates", nil);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    _selectedCertificate = nil;
    _filesArray = nil;
}

#pragma mark - User Interaction

- (IBAction)didClickCancelButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Certificates Methods

- (NSArray *)findFiles:(NSArray *)extensions
{
#if TARGET_IPHONE_SIMULATOR
    
    NSMutableArray *arrayCertsMut = [[NSMutableArray alloc] init];
    
    [arrayCertsMut addObject:ANF_PF_ACTIVO];
    [arrayCertsMut addObject:PF_ACTIVO_FIR_SHA1];
    [arrayCertsMut addObject:PRUEBAS_PORTAFIRMAS];
    
    return arrayCertsMut;
    
#else
    
    NSMutableArray *matches = [@[] mutableCopy];
    NSFileManager *fManager = [NSFileManager defaultManager];
    NSString *item;
    NSString *ext;
    NSArray *contents = [fManager contentsOfDirectoryAtPath:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] error:nil];
    
    for (item in contents) {
        for (ext in extensions) {
            if ([[item pathExtension] isEqualToString:ext]) {
                [matches addObject:item];
            }
        }
    }
    
    return matches;
    
#endif /* if TARGET_IPHONE_SIMULATOR */
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _filesArray ? _filesArray.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kAOAvailableCertificatesTVCCellIdentifier];
    cell.textLabel.text = _filesArray[indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedCertificate = _filesArray[indexPath.row];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showRegisterCertificate"]) {
        if (!_selectedCertificate) {
            NSIndexPath *selectedRowIndexPath = [self.tableView indexPathForSelectedRow];
            _selectedCertificate = _filesArray[selectedRowIndexPath.row];
        }
        AORegisterCertificateVC *registerCertificateVC  = [segue destinationViewController];
        registerCertificateVC.selectedCertificate = _selectedCertificate;
        registerCertificateVC.modalPresentationStyle = 17;
        [registerCertificateVC setDelegate:self];
    }
}

#pragma mark - AORegisterCertificateVCDelegate

- (void)certificateAdded
{
    [self didClickCancelButton:nil];
}

@end
