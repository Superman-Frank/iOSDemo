#import "ViewController.h"
#import "SecondViewController.h"
#import "Player.h"
#import "DrawStringView.h"
#import "objc/runtime.h"
#import "AccountManager.h"
#import "UITableView+SCIndexView.h"
#import "GetFirstLetters.h"
#import "SCIndexView.h"
#import "BMChineseSort.h"
#import "YFGroupedData.h"
#import "YFMetroListBox.h"
#import "ZKUsers.h"
#import "ZKCollectionViewCell.h"
#import "ZKGradientBorderView.h"

#define kIndexKey @"title"
#define kArrayKey @"array"
#define kHeaderView @"headerView"
//在定义函数时，define会引起语义上的歧义
#define MULTI(x) (x * x)

static inline int MULTI2(int x) {
    return x * x;
}
static NSString * const cellID = @"cellID";
#define  ScreenHeight [UIScreen mainScreen].bounds.size.height
#define  ScreenWidth  [UIScreen mainScreen].bounds.size.width
#import "MyView.h"
#import "SectionView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,SCIndexViewDelegate,SCTableViewSectionIndexDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)UITableView * tableView;
@property (nonatomic,strong)NSArray * contentArray;
@property (nonatomic,strong)NSMutableArray * indexArrays;
@property (nonatomic,strong)YFMetroListBox *metroListBox;
@property (nonatomic,strong)UICollectionView * collectionView;
@property (nonatomic,strong)UICollectionViewFlowLayout * gridLayout;
@property (nonatomic,strong)UICollectionViewFlowLayout * listLayout;
@property (nonatomic,strong)UIButton * btn;
@property (nonatomic,strong)UITextField * textField;
@property (nonatomic,strong)UIDatePicker * datePicker;
@property (nonatomic,strong)UIToolbar * toolbar;


@end

@implementation ViewController
-(void)injected{
    [self viewDidLoad];
}
-(void)cancelClick:(UIBarButtonItem *)item{
    [self.textField resignFirstResponder];
}
-(void)doneClick:(UIBarButtonItem *)item{
    NSDate * date = self.datePicker.date;
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy年 MM月 dd号"];
    NSString * dateString = [dateFormatter stringFromDate:date];
    self.textField.text = dateString;
    [self.view endEditing:YES];
}
- (UIDatePicker *)datePicker
{
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc]init];
        _datePicker.datePickerMode = UIDatePickerModeDate;
        _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
    }
    return _datePicker;
}
- (UIToolbar *)toolbar
{
    if (!_toolbar) {
        _toolbar = [[UIToolbar alloc]init];
        _toolbar.bounds = CGRectMake(0, 0, 0, 44);
        UIBarButtonItem * cancelItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelClick:)];
        UIBarButtonItem * flexiableItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem * donelItem = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(doneClick:)];
        _toolbar.items = @[cancelItem,flexiableItem,donelItem];
        
    }
    return _toolbar;
}
- (UITextField *)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc]initWithFrame:CGRectMake(30, 100, ScreenWidth - 60, 44)];
        _textField.layer.borderWidth = 1;
        _textField.layer.borderColor = [UIColor systemRedColor].CGColor;
        _textField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 16, 0)];
        _textField.leftView.backgroundColor = [UIColor systemGreenColor];
        _textField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _textField;;
}
-(UICollectionViewFlowLayout *)gridLayout
{
    if (!_gridLayout) {
        _gridLayout = [[UICollectionViewFlowLayout alloc]init];
        CGFloat width = (ScreenWidth - 30)/2;
        _gridLayout.itemSize = CGSizeMake(width, width * 0.8);
        //滚动方向相同的间距
        _gridLayout.minimumLineSpacing = 10;
        //滚动方向垂直的间距
        _gridLayout.minimumInteritemSpacing = 10;
        _gridLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    }
    return _gridLayout;
}

- (UICollectionViewFlowLayout *)listLayout
{
    if (!_listLayout) {
        _listLayout = [[UICollectionViewFlowLayout alloc]init];
        CGFloat width = ScreenWidth - 30;
        _listLayout.itemSize = CGSizeMake(width, 100);
        _gridLayout.minimumLineSpacing = 0;
        _listLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return _listLayout;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZKCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.isList = 1;
     cell.animation = 1;
    return cell;
    
}
-(void)clicks{
    NSLog(@"dsqasadsasadsadsadasdsa");
}
-(void)sure{
    NSLog(@"makeSure");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
<<<<<<< HEAD
    [self.view addSubview:self.textField];
    self.textField.inputView = self.datePicker;
    self.textField.inputAccessoryView = self.toolbar;
//    [self.view addSubview:_toolbar];
=======
//    UIControl * control = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
//    [control addTarget:self action:@selector(clicks) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:control];
    
    NSLog(@"取消屏幕点击");
>>>>>>> dev
    
    
//    UIControl * control = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
//    [control addTarget:self action:@selector(clicks) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:control];
//
//    UIView *colorView = [[UIView alloc] init];
//    colorView.frame = CGRectMake(0, 400, 200, 200);
////    colorView.center = CGPointMake(375/2.0, 100);
//    [self.view addSubview:colorView];
//
//    CAGradientLayer *gradient = [CAGradientLayer layer];
//    gradient.frame = colorView.bounds;
//    gradient.colors = @[(__bridge id)[UIColor blackColor].CGColor,(__bridge id)[UIColor whiteColor].CGColor];
//    gradient.startPoint = CGPointMake(0, 1);
//    gradient.endPoint = CGPointMake(1, 0);
//    //    gradient.locations = @[@(0.5f), @(1.0f)];
//    [colorView.layer addSublayer:gradient];
    
    
    
    
    
//    ZKGradientBorderView * akv =[[ZKGradientBorderView alloc]initWithFrame:CGRectMake(100,300, 200, 100)];
//    [self.view addSubview:akv];
    
//
//    UIToolbar * toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 100, ScreenWidth, 50)];
//
//    UIBarButtonItem * item1 = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(sure)];
    
    
//    SectionView * sv = [SectionView sectionView];
//
//    sv.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
//
//    [self.view addSubview:sv];
  
//    self.view.backgroundColor = [UIColor whiteColor];
//    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) collectionViewLayout:self.listLayout];
//    self.collectionView.dataSource = self;
//    self.collectionView.delegate = self;
//    [self.collectionView registerClass:[ZKCollectionViewCell class] forCellWithReuseIdentifier:cellID];
////    if (@available(iOS 11.0, *)) {
////        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
////    } else {
////        self.automaticallyAdjustsScrollViewInsets = NO;
////
////    }
//    [self.view addSubview:self.collectionView];
    
    
    
    
//    //背景图片
//    UIButton * btn1  = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn1.frame = CGRectMake(100, 100, 100, 100);
//    btn1.layer.cornerRadius = 50;
//    [btn1 setImage:[UIImage imageNamed:@"截屏2020-07-07 上午11.05.22"] forState:0];
//    [self.view addSubview:btn1];
//    btn1.clipsToBounds = YES;
//
//
//    //背景颜色加背景图片
//    UIButton * btn2  = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn2.frame = CGRectMake(100, 230, 100, 100);
//    btn2.layer.cornerRadius = 50;
//    btn2.backgroundColor = [UIColor systemBlueColor];
//    [btn2 setImage:[UIImage imageNamed:@"截屏2020-07-07 上午11.05.05"] forState:0];
//    [self.view addSubview:btn2];
//    btn2.clipsToBounds = YES;
//
//    //不存在背景图片
//    UIButton * btn3  = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn3.frame = CGRectMake(100, 350, 100, 100);
//    btn3.layer.cornerRadius = 50;
//    btn3.backgroundColor = [UIColor systemBlueColor];
//    [self.view addSubview:btn3];
//    btn3.clipsToBounds = YES;
//
//    //只设置图片无背景色
//
//    UIButton * btn4  = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn4.frame = CGRectMake(100, 480, 100, 100);
//    btn4.layer.cornerRadius = 50;
//    [btn4 setImage:[UIImage imageNamed:@"截屏2020-07-07 上午11.05.05"] forState:0];
//    [self.view addSubview:btn4];
//    btn4.clipsToBounds = YES;
//
    
    
    
    
    
//    NSLog(@"MULTI(10) = %d",MULTI(10));//打印结果 100 10 * 10
//    NSLog(@"MULTI(10 + 10) = %d",MULTI(10 + 10)); //打印结果 120 10 + 10 * 10 + 10 = 10 + 100 + 10 = 120;
//    NSLog(@"MULTI(10 + 10 + 10) = %d",MULTI(10 + 10 + 10));//打印结果 140 10 + 10 + 10 * 10 + 10 + 10 = 20 + 100 + 20 = 140;
//    NSLog(@"MULTI(10 + 30) = %d",MULTI(10 + 30));//打印结果 340 10 + 30 * 10 + 30 = 10 + 300 + 30 = 340;
//    NSLog(@"MULTI(10 + 30) = %d",MULTI(30 + 10));//打印结果 340 30 + 10 * 30 + 10 = 30 + 300 + 10 = 340;
    
//
//    NSDictionary *dict1 = @{
//        @"name" : @"Jack",
//        @"icon" : @"lufy.png",
//        @"age" : @20,
//        @"height" : @"1.55",
//        @"money" : @100.9,
//        @"sex" : @(1),/* 枚举需要使用NSNumber包装 */
//        @"gay" : @"NO"
//    };
//
//
//    ZKUsers * zkUsers = [ZKUsers mj_objectWithKeyValues:dict1];
//
//    NSLog(@"hhhhh = %@jjjjj = %@",zkUsers.name,zkUsers.height);
//
//
//
//
//    NSLog(@"MULT2(10) = %d",MULTI2(10));//打印结果 100 10 * 10
//    NSLog(@"MULT2(10 + 10) = %d",MULTI2(10 + 10)); //打印结果 400 (10 + 10) * (10 + 10) = 20 * 20 = 400;
//    NSLog(@"MULT2(10 + 10 + 10) = %d",MULTI2(10 + 10 + 10));//打印结果 900 (10 + 10 + 10) * (10 + 10 + 10) = 30 * 30 = 900;
//    NSLog(@"MULT2(10 + 30) = %d",MULTI2(10 + 30));//打印结果 1600 (10 + 30) * (10 + 30) = 40 * 40 = 1600;
//    #if TARGET_IPHONE_SIMULATOR
//        NSLog(@"模拟器");
//    #else
//        NSLog(@"真机");
//    #endif
//
//
//    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
//    btn.backgroundColor = [UIColor systemRedColor];
//    [btn setTitle:@"Go" forState:0];
//    self.btn = btn;
//    [btn addTarget:self action:@selector(goNext:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
//
//
//
//    NSMutableArray *arrShortcutItem = (NSMutableArray *)[UIApplication sharedApplication].shortcutItems;
//
//    UIApplicationShortcutItem *shoreItem1 = [[UIApplicationShortcutItem alloc] initWithType:@"cn.damon.DM3DTouchDemo.openSearch" localizedTitle:@"搜索" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch] userInfo:nil];
//    [arrShortcutItem addObject:shoreItem1];
//
//    UIApplicationShortcutItem *shoreItem2 = [[UIApplicationShortcutItem alloc] initWithType:@"cn.damon.DM3DTouchDemo.openCompose" localizedTitle:@"新消息" localizedSubtitle:@"" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCompose] userInfo:nil];
//    [arrShortcutItem addObject:shoreItem2];
//
//    [UIApplication sharedApplication].shortcutItems = arrShortcutItem;
//    self.title = @"首页";
//    self.indexArrays= [NSMutableArray array];
//    self.contentArray = [YFGroupedData getGroupedDictionaryArray:@[@"Once",@"Begin Again",@"hello wolrd",@"~opk",@"Windows",@"Lumia",@"苏菲",@"Yvan Wang",@"超能陆战队",@"Angry birds",@")xxxxxx",@"%jay",@"Windows Phone",@"950XL",@"速度与激情",@"1520",@"Titanic",@"霸王别姬",@"Captain America",@"World of Warcraft",@"星际穿越",@"反叛的鲁鲁修",@"消失的爱人",@"The Love of Siam",@"荷尔蒙",@"爱·回家",@"7号房的礼物",@"春夏秋冬又一春",@"The Little Prince",@"太阳的后裔",@"非首脑会谈",@"初恋这件小事",@";;;;;;",@"Baby And Me",@"疯狂动物城",@"Old Boy",@"我的女孩",@"奔跑吧兄弟",@"我滴个神啊"]indexKey:kIndexKey arrayKey:kArrayKey];
//
//    for (NSDictionary * dic in self.contentArray) {
//        NSString * title = dic[kIndexKey];
//        [self.indexArrays addObject:title];
//    }
//
//    NSLog(@"jjj = %@",self.indexArrays);
//
//    MyView * myview = [[MyView alloc]initWithFrame:CGRectMake(15, 168, 290,400)];
//    myview.backgroundColor = [UIColor clearColor];
//    UIView *dottedLine = [[UIView alloc]initWithFrame:CGRectMake(8, 64, 290 - 16, 1)];
//    //绘制虚线
//    [self drawDashLine:dottedLine lineLength:8 lineSpacing:4 lineColor:[UIColor blackColor]];
//    [myview addSubview:dottedLine];
//    [self.view addSubview:myview];
//
//
    
    
//    NSArray * array =@[@"apple",@"amani",@"保加利亚",@"benz",@"cat",@"changan",@"dog",@"doge",@"egg",@"edges",@"fish",@"fuxx",@"goat",@"ghost",@"123",@"hehe"];
//
//
//    [BMChineseSort sortAndGroup:array key:@"" finish:^(bool isSuccess, NSMutableArray *unGroupedArr, NSMutableArray *sectionTitleArr, NSMutableArray<NSMutableArray *> *sortedObjArr) {
//
//            self.contentArray = sortedObjArr;
//            [self.tableView reloadData];
//
//    }];
//    self.contentArray = [BMChineseSort sort/]
    
    
    
//    self.indexArrays = [GetFirstLetters getFirstLetterFromStringArray:self.contentArray];
    
//    self.indexArrays = @[[GetFirstLetters getFirstLetterFromString:@"apple"],
//                         [GetFirstLetters getFirstLetterFromString:@"保加利亚"],
//                         [GetFirstLetters getFirstLetterFromString:@"dog"],
//                         [GetFirstLetters getFirstLetterFromString:@"egg"],
//                         [GetFirstLetters getFirstLetterFromString:@"fish"],
//                         [GetFirstLetters getFirstLetterFromString:@"goat"],
//                         [GetFirstLetters getFirstLetterFromString:@"123"],
//                         [GetFirstLetters getFirstLetterFromString:@"呵呵"],
//    ];
//
//    SEL sel1 = @selector(viewDidLoad);
//    NSLog(@"XXX = %s",sel1);
//
//
//    SEL sel2 = @selector(dismiss);
//    NSLog(@"SSS = %s",sel2);
//
//    [self performSelector:sel2];
//
//    self.view.backgroundColor = [UIColor whiteColor];
//    // Do any additional setup after loading the view.
//    UIButton * btn =[[UIButton alloc]initWithFrame:CGRectMake(200, 100, 100, 100)];
//    [btn setTitle:@"hello world" forState:0];
//    btn.backgroundColor = [UIColor systemOrangeColor];
//    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
//
//    UIView * viewWithString = [[DrawStringView alloc] initWithContent:@"This is test string" Frame:CGRectMake(100, 100, 200, 200)];
//    [self.view addSubview:viewWithString];
//
//
//
//    NSMutableArray * arr = @[@1,@16,@13,@9,@10,@8,@5].mutableCopy;
//
//    for (int i = 0; i<arr.count; i++) {
//        for (int j = i+1; j<arr.count; j++) {
//            //倒序排由大到小 arr[i]:前一项值 < [arr[j]后一项至 ，那么前一项值和后一项的值交换位置  [arr exchangeObjectAtIndex:j withObjectAtIndex:i]
//            if ([arr[i] intValue]>[arr[j] intValue]) {
//                [arr exchangeObjectAtIndex:i withObjectAtIndex:j];
//            }
//
//            /*
//             if ([arr[i] intValue]<[arr[j] intValue]) {
//                 [arr exchangeObjectAtIndex:i withObjectAtIndex:ij;
//             }
//             */
//
//        }
//    }
//     NSString * str = @"";
//        for (NSNumber * value in arr) {
//           str = [str stringByAppendingString:[NSString stringWithFormat:@"%zd ",[value integerValue]]];
//        }
//        NSLog(@"%@",str);
//
//
    
//    NSString * path = [[NSBundle mainBundle]pathForResource:@"NBA" ofType:@"plist"];
//    NSDictionary * dic = [NSDictionary dictionaryWithContentsOfFile:path];
//    NSLog(@"dic = %@",dic);
//
//    //创建一个plist文件
//    NSArray * path1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString * plistPath = [path1 objectAtIndex:0];
//    NSString * fileName = [plistPath stringByAppendingPathComponent:@"test.plist"];
//    NSFileManager * fm = [NSFileManager defaultManager];
//    [fm createFileAtPath:fileName contents:nil attributes:nil];
//
//    //写入内容
//    NSDictionary * dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"testeee", nil];
//    [dic1 writeToFile:fileName atomically:YES];
//    NSLog(@"dic1 = %@",dic1);
    
    
    
    
    
//
//    NSMutableDictionary *dict1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"BMW",@"CarLogo",@"Red",@"CarColor", nil];
//    NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:@"Xiaoming",@"name",@"28", @"age",nil];
//    [dict1 addEntriesFromDictionary:dict2];
//
//    NSLog(@"%@",dict1);
    
    
    
    
//    dispatch_queue_t queue = dispatch_queue_create(@"test", DISPATCH_QUEUE_SERIAL);
//    NSLog(@"1");
//    dispatch_async(queue, ^{
//        NSLog(@"2");
//    });
//    NSLog(@"3");
//    dispatch_async(queue, ^{
//        NSLog(@"4");
//    });
//    NSLog(@"5");
//    dispatch_async(queue, ^{
//           NSLog(@"6");
//       });
//    NSLog(@"7");
//    dispatch_async(queue, ^{
//           NSLog(@"8");
//       });
//    NSLog(@"9");
//
    
    
//    //创建一个plist文件  testPlist
//       NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
//       NSString *plistpath = [paths objectAtIndex:0];
//       NSLog(@"path = %@",plistpath);
//       NSString *filename=[plistpath stringByAppendingPathComponent:@"testPlist.plist"];
//       NSFileManager* fm = [NSFileManager defaultManager];
//       [fm createFileAtPath:filename contents:nil attributes:nil];
//
//       //写入内容
//       NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"value1", @"key1", @"value2", @"key2",nil];
//       [dic writeToFile:filename atomically:YES];
////    NSLog(@"xxx = %@",dic);
//
//    //读取内容
//    NSDictionary * dict1 = [NSDictionary dictionaryWithContentsOfFile:filename];
//    NSLog(@"xxx = %@",dict1);
//打印数组
//    [self performSelector:@selector(fun)];
    
//    AccountManager * id1 =  [AccountManager shareInstance];
//    AccountManager * id2 =  [AccountManager shareInstance];
//    AccountManager * id3 =  [AccountManager shareInstance];
//
//    NSLog(@"%@%@%@",id1,id2,id3);
//
//    //获取草稿（不用创建，只是拿来用就好）
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//
//    //设置描绘的起点
//    CGContextMoveToPoint(ctx, 100, 100);
//    //设置重点(起点终点之间进行连线)
//    CGContextAddLineToPoint(ctx, 200, 200);
//    //此时线已经连好，则开始使用它去渲染到屏幕上
//    CGContextStrokePath(ctx);
    
    
    
    
    
    
    
    
    
//    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
//    self.tableView.dataSource = self;
//    self.tableView.delegate = self;
//    self.tableView.showsHorizontalScrollIndicator = NO;
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
////    [self.view addSubview:self.tableView];
//    if (@available(iOS 11.0, *)){
//        // 这两个方法必须要，否则代理中设置组头/尾高度无限
//        self.tableView.estimatedSectionHeaderHeight = 0;
//        self.tableView.estimatedSectionFooterHeight = 0;
//    }
//
//    [self.view layoutIfNeeded];
//
//    SCIndexViewConfiguration *configuration = [SCIndexViewConfiguration configurationWithIndexViewStyle:SCIndexViewStyleDefault];
//
//    _tableView.sc_indexViewConfiguration = configuration;
//    _tableView.sc_translucentForTableViewInNavigationBar = YES;
//    _tableView.sc_indexViewDataSource = self.indexArrays;
    /*
     SCIndexViewConfiguration *indexViewConfiguration = [SCIndexViewConfiguration configuration];
     SCIndexView *indexView = [[SCIndexView alloc] initWithTableView:self.tableView configuration:indexViewConfiguration];
     indexView.translucentForTableViewInNavigationBar = self.translucent;
     [self.view addSubview:indexView];
     indexView.dataSource = indexViewDataSource;
     复

     作者：TalkingJourney
     链接：https://juejin.im/post/5a5b490df265da3e5a5739cb
     来源：掘金
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
//        SCIndexViewConfiguration *indexViewConfiguration = [SCIndexViewConfiguration configuration];
//    SCIndexView *indexView = [[SCIndexView alloc] initWithTableView:self.tableView configuration:indexViewConfiguration];
//    indexView.translucentForTableViewInNavigationBar = YES;
//    [self.view addSubview:indexView];
//    indexView.dataSource = self.indexArrays;
    
}

-(void)goNext:(UIButton *)button{
    SecondViewController * second = [[SecondViewController alloc]init];
    
    second.block = ^(NSString * _Nonnull passValue) {
    [self.btn setTitle:[NSString stringWithFormat:@"%@",passValue] forState:0];
    };
    
    [self.navigationController pushViewController:second animated:YES];
}
//- (void)indexView:(SCIndexView *)indexView didSelectAtSection:(NSUInteger)section
//{
//    NSLog(@"XXXXXXXX");
//}
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    NSLog(@"UUUUUUUUUUu");
//}

//

- (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];

    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL,CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * header = [[UIView alloc]init];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(16,0,self.view.frame.size.width - 100,20)];
    label.textColor = [UIColor blackColor];
    NSDictionary *dic = [self.contentArray objectAtIndex:section];
    NSString *title = [dic objectForKey:kIndexKey];
    label.text = title;
    [header addSubview:label];
    return header;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dic = [self.contentArray objectAtIndex:section];
    NSArray *array = [dic objectForKey:kArrayKey];
    return array.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.contentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSDictionary * dic = [self.contentArray objectAtIndex:indexPath.section];

    NSArray * array  = [dic objectForKey:kArrayKey];
    
    cell.textLabel.text =array[indexPath.row];
    return cell;
}


// 重写 resolveInstanceMethod: 添加对象方法实现
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(fun)) { // 如果是执行 fun 函数，就动态解析，指定新的 IMP
        class_addMethod([self class], sel, (IMP)funMethod, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}
void funMethod(id obj,SEL _cmd){
    NSLog(@"funMetsccssddvshod");//新的函数
}
-(void)dismiss{
    NSLog(@"HHHHHHH");
}
- (void)logArr:(NSMutableArray * )array {
    NSString * str = @"";
    for (NSNumber * value in array) {
       str = [str stringByAppendingString:[NSString stringWithFormat:@"%zd ",[value integerValue]]];
    }
    NSLog(@"%@",str);
}
-(void)click{
    SecondViewController * secondVC = [SecondViewController new];
    [self.navigationController pushViewController:secondVC animated:YES];
}

@end
