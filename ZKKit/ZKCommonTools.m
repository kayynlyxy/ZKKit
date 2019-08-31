
#import "ZKCommonTools.h"

@implementation UIButton (ZKCategory)

- (void)zkLayoutButtonWithStyle:(ZKButtonEdgeInsetsStyle)style spacing:(CGFloat)space {
    [self.superview layoutIfNeeded];
    CGFloat imageViewWidth = CGRectGetWidth(self.imageView.frame);
    CGFloat labelWidth = CGRectGetWidth(self.titleLabel.frame);
    
    if (labelWidth == 0) {
        CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
        labelWidth  = titleSize.width;
    }
    
    CGFloat imageInsetsTop = 0.0f;
    CGFloat imageInsetsLeft = 0.0f;
    CGFloat imageInsetsBottom = 0.0f;
    CGFloat imageInsetsRight = 0.0f;
    
    CGFloat titleInsetsTop = 0.0f;
    CGFloat titleInsetsLeft = 0.0f;
    CGFloat titleInsetsBottom = 0.0f;
    CGFloat titleInsetsRight = 0.0f;
    
    switch (style) {
        case ZKButtonEdgeInsetsStyleRight:
        {
            space = space * 0.5;
            
            imageInsetsLeft = labelWidth + space;
            imageInsetsRight = -imageInsetsLeft;
            
            titleInsetsLeft = - (imageViewWidth + space);
            titleInsetsRight = -titleInsetsLeft;
        }
            break;
            
        case ZKButtonEdgeInsetsStyleLeft:
        {
            space = space * 0.5;
            
            imageInsetsLeft = -space;
            imageInsetsRight = -imageInsetsLeft;
            
            titleInsetsLeft = space;
            titleInsetsRight = -titleInsetsLeft;
        }
            break;
        case ZKButtonEdgeInsetsStyleBottom:
        {
            CGFloat imageHeight = CGRectGetHeight(self.imageView.frame);
            CGFloat labelHeight = CGRectGetHeight(self.titleLabel.frame);
            CGFloat buttonHeight = CGRectGetHeight(self.frame);
            CGFloat boundsCentery = (imageHeight + space + labelHeight) * 0.5;
            
            CGFloat centerX_button = CGRectGetMidX(self.bounds); // bounds
            CGFloat centerX_titleLabel = CGRectGetMidX(self.titleLabel.frame);
            CGFloat centerX_image = CGRectGetMidX(self.imageView.frame);
            
            CGFloat imageBottomY = CGRectGetMaxY(self.imageView.frame);
            CGFloat titleTopY = CGRectGetMinY(self.titleLabel.frame);
            
            imageInsetsTop = buttonHeight - (buttonHeight * 0.5 - boundsCentery) - imageBottomY;
            imageInsetsLeft = centerX_button - centerX_image;
            imageInsetsRight = - imageInsetsLeft;
            imageInsetsBottom = - imageInsetsTop;
            
            titleInsetsTop = (buttonHeight * 0.5 - boundsCentery) - titleTopY;
            titleInsetsLeft = -(centerX_titleLabel - centerX_button);
            titleInsetsRight = - titleInsetsLeft;
            titleInsetsBottom = - titleInsetsTop;
            
        }
            break;
        case ZKButtonEdgeInsetsStyleTop:
        {
            CGFloat imageHeight = CGRectGetHeight(self.imageView.frame);
            CGFloat labelHeight = CGRectGetHeight(self.titleLabel.frame);
            CGFloat buttonHeight = CGRectGetHeight(self.frame);
            CGFloat boundsCentery = (imageHeight + space + labelHeight) * 0.5;
            
            CGFloat centerX_button = CGRectGetMidX(self.bounds); // bounds
            CGFloat centerX_titleLabel = CGRectGetMidX(self.titleLabel.frame);
            CGFloat centerX_image = CGRectGetMidX(self.imageView.frame);
            
            CGFloat imageTopY = CGRectGetMinY(self.imageView.frame);
            CGFloat titleBottom = CGRectGetMaxY(self.titleLabel.frame);
            
            imageInsetsTop = (buttonHeight * 0.5 - boundsCentery) - imageTopY;
            imageInsetsLeft = centerX_button - centerX_image;
            imageInsetsRight = - imageInsetsLeft;
            imageInsetsBottom = - imageInsetsTop;
            
            titleInsetsTop = buttonHeight - (buttonHeight * 0.5 - boundsCentery) - titleBottom;
            titleInsetsLeft = -(centerX_titleLabel - centerX_button);
            titleInsetsRight = - titleInsetsLeft;
            titleInsetsBottom = - titleInsetsTop;
        }
            break;
            
        default:
            break;
    }
    
    self.imageEdgeInsets = UIEdgeInsetsMake(imageInsetsTop, imageInsetsLeft, imageInsetsBottom, imageInsetsRight);
    self.titleEdgeInsets = UIEdgeInsetsMake(titleInsetsTop, titleInsetsLeft, titleInsetsBottom, titleInsetsRight);
}

@end

@implementation UIView (ZKCategory)

- (CGFloat)zk_left {
    return self.frame.origin.x;
}

- (void)setZk_left:(CGFloat)zk_left {
    CGRect frame = self.frame;
    frame.origin.x = zk_left;
    self.frame = frame;
}

- (CGFloat)zk_top {
    return self.frame.origin.y;
}

- (void)setZk_top:(CGFloat)zk_top {
    CGRect frame = self.frame;
    frame.origin.y = zk_top;
    self.frame = frame;
}

- (CGFloat)zk_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setZk_right:(CGFloat)zk_right {
    CGRect frame = self.frame;
    frame.origin.x = zk_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)zk_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setZk_bottom:(CGFloat)zk_bottom {
    CGRect frame = self.frame;
    frame.origin.y = zk_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)zk_width {
    return self.frame.size.width;
}

- (void)setZk_width:(CGFloat)zk_width {
    CGRect frame = self.frame;
    frame.size.width = zk_width;
    self.frame = frame;
}

- (CGFloat)zk_height {
    return self.frame.size.height;
}

- (void)setZk_height:(CGFloat)zk_height {
    CGRect frame = self.frame;
    frame.size.height = zk_height;
    self.frame = frame;
}

- (CGFloat)zk_centerX {
    return self.center.x;
}

- (void)setZk_centerX:(CGFloat)zk_centerX {
    self.center = CGPointMake(zk_centerX, self.center.y);
}

- (CGFloat)zk_centerY {
    return self.center.y;
}

- (void)setZk_centerY:(CGFloat)zk_centerY {
    self.center = CGPointMake(self.center.x, zk_centerY);
}

- (CGPoint)zk_origin {
    return self.frame.origin;
}

- (void)setZk_origin:(CGPoint)zk_origin {
    CGRect frame = self.frame;
    frame.origin = zk_origin;
    self.frame = frame;
}

- (CGSize)zk_size {
    return self.frame.size;
}

- (void)setZk_size:(CGSize)zk_size {
    CGRect frame = self.frame;
    frame.size = zk_size;
    self.frame = frame;
}

- (CGFloat)zkBottomFromSuperView{
    return self.superview.zk_height - self.zk_top - self.zk_height;
}

- (void)zkAddBottomBorderWithColor:(UIColor *)color borderWidth:(CGFloat) borderWidth {
    [self.superview layoutIfNeeded];
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    border.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, borderWidth);
    [self.layer addSublayer:border];
}
- (void)zkAddLeftBorderWithColor:(UIColor *)color borderWidth:(CGFloat) borderWidth {
    [self.superview layoutIfNeeded];
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    border.frame = CGRectMake(0, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:border];
}
- (void)zkAddRightBorderWithColor:(UIColor *)color borderWidth:(CGFloat) borderWidth {
    [self.superview layoutIfNeeded];
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    border.frame = CGRectMake(self.frame.size.width - borderWidth, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:border];
}
- (void)zkAddTopBorderWithColor:(UIColor *)color borderWidth:(CGFloat) borderWidth {
    
    [self.superview layoutIfNeeded];
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    border.frame = CGRectMake(0, 0, self.frame.size.width, borderWidth);
    [self.layer addSublayer:border];
    
}

@end

@implementation ZKCommonTools

+ (UIButton *)zkInitButtonWithTitle:(NSString *)title
                         titleColor:(UIColor *)titleColor
                          titleFont:(UIFont *)titleFont
                              image:(UIImage *)image
                        selectImage:(UIImage *)selectImage
                             target:(id)target
                             action:(SEL)action {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (titleColor) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (titleFont) {
        button.titleLabel.font = titleFont;
    }
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
    }
    if (selectImage) {
        [button setImage:selectImage forState:UIControlStateSelected];
    }
    if (target && action) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return button;
}

+ (UIImageView *)zkInitImageViewWithImage:(UIImage *)image
                              contentMode:(UIViewContentMode)contentMode {
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = image;
    imageView.contentMode = contentMode;
    if (contentMode == UIViewContentModeScaleToFill || contentMode == UIViewContentModeScaleAspectFill) {
        imageView.clipsToBounds = YES;
        [imageView setContentScaleFactor:[[UIScreen mainScreen] scale]];
    }
    return imageView;
}

+ (UILabel *)zkInitLabelWithText:(NSString *)text
                       textColor:(UIColor *)textColor
                            font:(UIFont *)font
                   textAlignment:(NSTextAlignment)textAlignment {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    label.textAlignment = textAlignment;
    
    return label;
}

+ (UITextField *)zkInitTextFieldWithPlaceholder:(NSString *)placeholder
                                           font:(UIFont *)font
                                      textColor:(UIColor *)textColor
                                secureTextEntry:(BOOL)secureTextEntry
                               placeholderColor:(UIColor *)placeholderColor
                                   keyboardType:(UIKeyboardType)keyboardType {
    
    UITextField *textField = [[UITextField alloc] init];
    textField.placeholder = placeholder;
    textField.font = font;
    textField.textColor = textColor;
    textField.secureTextEntry = secureTextEntry;
    if (keyboardType) {
        textField.keyboardType = keyboardType;
    }
    if (placeholderColor) {
        textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:textField.placeholder attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    }
    
    return textField;
}

+ (BOOL)zkCheckPhoneNumber:(NSString *)phoneNumber {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",@"1[34578]\\d{9}"];
    return [predicate evaluateWithObject:phoneNumber];
}

+ (BOOL)zkCheckPasswordStrength:(NSString *)password {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",@"^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}$"];
    return [predicate evaluateWithObject:password];
}

+ (BOOL)zkCheckChinese:(NSString *)string {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",@"^[\\u4e00-\\u9fa5]{0,}$"];
    return [predicate evaluateWithObject:string];
}

+ (BOOL)zkCheckNumbersLetters:(NSString *)string {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",@"^\\w+$"];
    return [predicate evaluateWithObject:string];
}

+ (BOOL)zkCheckEmail:(NSString *)Email {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",@"[\\w!#$%&'*+/=?^_`{|}~-]+(?:\\.[\\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\\w](?:[\\w-]*[\\w])?\\.)+[\\w](?:[\\w-]*[\\w])?"];
    return [predicate evaluateWithObject:Email];
}

+ (BOOL)zkCheckIDNumber:(NSString *)IDNumber {
    
    NSPredicate *predicate15 = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",@"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$"];
    NSPredicate *predicate18 = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",@"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$"];
    BOOL result = NO;
    if ([predicate15 evaluateWithObject:IDNumber] || [predicate18 evaluateWithObject:IDNumber]) {
        result = YES;
    }
    return result;
}

+ (BOOL)zkCheckDate:(NSString *)date {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",@"^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$"];
    return [predicate evaluateWithObject:date];
}

+ (BOOL)zkCheckMoney:(NSString *)money {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",@"^[0-9]+(.[0-9]{2})?$"];
    return [predicate evaluateWithObject:money];
}

@end
