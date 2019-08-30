
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, ZKButtonEdgeInsetsStyle) {
    ZKButtonEdgeInsetsStyleLeft,
    ZKButtonEdgeInsetsStyleRight,
    ZKButtonEdgeInsetsStyleTop,
    ZKButtonEdgeInsetsStyleBottom
};
@interface UIButton (ZKCategory)

- (void)zkLayoutButtonWithStyle:(ZKButtonEdgeInsetsStyle)style spacing:(CGFloat)space;

@end

@interface UIView (ZKCategory)

@property (nonatomic, assign)CGFloat zk_left;
@property (nonatomic, assign)CGFloat zk_right;
@property (nonatomic, assign)CGFloat zk_top;
@property (nonatomic, assign)CGFloat zk_bottom;
@property (nonatomic, assign)CGFloat zk_width;
@property (nonatomic, assign)CGFloat zk_height;
@property (nonatomic, assign)CGFloat zk_centerX;
@property (nonatomic, assign)CGFloat zk_centerY;
@property (nonatomic, assign)CGPoint zk_origin;
@property (nonatomic, assign)CGSize zk_size;
@property (nonatomic, assign, readonly) CGFloat zkBottomFromSuperView;

- (void)zkAddBottomBorderWithColor:(UIColor *)color borderWidth:(CGFloat) borderWidth;
- (void)zkAddLeftBorderWithColor:(UIColor *)color borderWidth:(CGFloat) borderWidth;
- (void)zkAddRightBorderWithColor:(UIColor *)color borderWidth:(CGFloat) borderWidth;
- (void)zkAddTopBorderWithColor:(UIColor *)color borderWidth:(CGFloat) borderWidth;

@end

@interface ZKCommonTools : NSObject

#pragma mark - 快速初始化

///快速创建button
+ (UIButton *)zkInitButtonWithTitle:(NSString *)title
                         titleColor:(UIColor *)titleColor
                          titleFont:(UIFont *)titleFont
                              image:(UIImage *)image
                        selectImage:(UIImage *)selectImage
                             target:(id)target
                             action:(SEL)action;

///快速创建imageView
+ (UIImageView *)zkInitImageViewWithImage:(UIImage *)image
                              contentMode:(UIViewContentMode)contentMode;


///快速创建label
+ (UILabel *)zkInitLabelWithText:(NSString *)text
                       textColor:(UIColor *)textColor
                            font:(UIFont *)font
                   textAlignment:(NSTextAlignment)textAlignment;


///快速创建textField
+ (UITextField *)zkInitTextFieldWithPlaceholder:(NSString *)placeholder
                                           font:(UIFont *)font
                                      textColor:(UIColor *)textColor
                                secureTextEntry:(BOOL)secureTextEntry
                               placeholderColor:(UIColor *)placeholderColor
                                   keyboardType:(UIKeyboardType)keyboardType;

#pragma mark - 常用正则

///校验手机号
+ (BOOL)zkCheckPhoneNumber:(NSString *)phoneNumber;

///校验密码强度(密码的强度必须是包含大小写字母和数字的组合，不能使用特殊字符，长度在8-10之间)
+ (BOOL)zkCheckPasswordStrength:(NSString *)password;

///校验中文(字符串仅能是中文)
+ (BOOL)zkCheckChinese:(NSString *)string;

///校验数字、26个英文字母或下划线组成的字符串
+ (BOOL)zkCheckNumbersLetters:(NSString *)string;

///校验邮箱
+ (BOOL)zkCheckEmail:(NSString *)Email;

///校验身份证号(15位和18位)
+ (BOOL)zkCheckIDNumber:(NSString *)IDNumber;

///校验日期(“yyyy-mm-dd“ 格式的日期校验)
+ (BOOL)zkCheckDate:(NSString *)date;

///校验金额(精确到2位小数)
+ (BOOL)zkCheckMoney:(NSString *)money;

@end


