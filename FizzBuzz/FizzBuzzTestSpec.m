#import "Kiwi.h"

@interface FizzBuzz : NSObject

-(NSString*) answer:(int)number;

@end

@implementation FizzBuzz

-(NSString*) answer:(int)number
{
    if(number != 0)
    {
        if(number % 3 == 0 && number % 5 == 0)
        {
            return @"fizzbuzz";
        }
        
        if(number % 3 == 0)
        {
            return @"fizz";
        }
        
        if(number % 5 == 0)
        {
            return @"buzz";
        }
    }
    
    return [NSString stringWithFormat:@"%d", number];
}

@end

SPEC_BEGIN(FizzBuzzSpec)

describe(@"FizzBuzz", ^{
    
    context(@"Given a number", ^{
        __block FizzBuzz* calculator;
        
        beforeEach(^{
           calculator = [[FizzBuzz alloc] init];
        });
        
        afterEach(^{
            [calculator release], calculator = nil;
        });
        
        it(@"should return '0' when given number is zero", ^{
            
            NSString* answer = [calculator answer:0];
            
            [[answer should] equal:@"0"];
        });
        
        it(@"should return '1' when given number is one", ^{
            
            NSString* answer = [calculator answer:1];
            
            [[answer should] equal:@"1"];
        });
        
        it(@"should return '2' when given number is two", ^{
            
            NSString* answer = [calculator answer:2];
            
            [[answer should] equal:@"2"];
        });
        
        it(@"should return 'fizz' when given number is multiple of three", ^{
            
            NSString* answer = [calculator answer:6];
            
            [[answer should] equal:@"fizz"];
        });
        
        it(@"should return 'buzz' when given number is multiple of 5", ^{
            
            NSString* answer = [calculator answer:10];
            
            [[answer should] equal:@"buzz"];
        });
        
        it(@"should return 'fizzbuzz' when given number is multiple of 3 and 5", ^{
            
            NSString* answer = [calculator answer:15];
            
            [[answer should] equal:@"fizzbuzz"];
        });
    });
    
});

SPEC_END
