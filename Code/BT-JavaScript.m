#if BT_BASICS

//
//  BT-JavaScript.m
//  BuzzamApp
//
//  Created by Joshua Wright on 10/2/11.
//  Copyright 2011 Bendy Tree. All rights reserved.
//

#import "BT-JavaScript.h"

@interface JavaScript()
@property (retain) UIWebView* web;
+ (JavaScript*) current;
- (NSString*) page_html;
@end

@implementation JavaScript

@synthesize web;

- (id)init {
    self = [super init];
    if (self) {
        
        UIWindow* window = [[UIApplication sharedApplication] keyWindow];
        self.web = [[[UIWebView alloc] initWithFrame:CGRectMake(0, 2*MAX(window.frame.size.height, window.frame.size.width), 1, 1)] autorelease];
        [window addSubview:self.web];
        [self.web setHidden:YES];
        
        [self.web loadHTMLString:[self page_html] baseURL:[[NSBundle mainBundle] resourceURL]];
        
    }
    return self;
}

- (void)dealloc {
    [self setAllPropertiesToNil];
    
    [super dealloc];
}

+ (void) includeScript:(NSString*)path
{
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    
    [self runStatement:content];
}

//must be run on main thread
static NSString* statementResult = nil;
+ (NSString*) runStatement:(NSString*)script
{
    if(statementResult){
        [statementResult autorelease];
        statementResult = nil;
    }
    
    if ([NSThread isMainThread] == NO) {
        [self performSelector:@selector(runStatement:) onThread:[NSThread mainThread] withObject:script waitUntilDone:YES];
        NSString* result = statementResult;
        [statementResult autorelease];
        statementResult = nil;
        return result;
    }
    
    JavaScript* js = [self current];
    NSString* result = [js.web stringByEvaluatingJavaScriptFromString:script];
    statementResult = [result retain];
    return result;
}

+ (NSString*) runFunctionBody:(NSString*)script
{
    script = [NSString stringWithFormat:@"(function(){ %@ })()", script];
    return [self runStatement:script];
}

+ (void) boot
{
    TRACK();
    
    [self current];
}

static JavaScript* _current = NULL;
+ (JavaScript*) current
{
    @synchronized(self)
    {
        if (_current == NULL)
            _current = [[self alloc] init];
    }
    return _current;
}

- (NSString*) page_html
{        
    return @"<html><head><script type='text/javascript'>if(!this.JSON){JSON=function(){function f(n){return n<10?'0'+n:n;} Date.prototype.toJSON=function(){return this.getUTCFullYear()+'-'+f(this.getUTCMonth()+1)+'-'+f(this.getUTCDate())+'T'+f(this.getUTCHours())+':'+ f(this.getUTCMinutes())+':'+ f(this.getUTCSeconds())+'Z';};var m={'\\b':'\\\\b','\\t':'\\\\t','\\n':'\\\\n','\\f':'\\\\f','\\r':'\\\\r','\"':'\\\\\"','\\\\':'\\\\\\\\'};function stringify(value,whitelist){var a,i,k,l,r=/[\"\\\\\\x00-\\x1f\\x7f-\\x9f]/g,v;switch(typeof value){case'string':return r.test(value)?'\"'+value.replace(r,function(a){var c=m[a];if(c){return c;} c=a.charCodeAt();return'\\\\u00'+Math.floor(c/16).toString(16)+ (c%16).toString(16);})+'\"':'\"'+value+'\"';case'number':return isFinite(value)?String(value):'null';case'boolean':case'null':return String(value);case'object':if(!value){return'null';} if(typeof value.toJSON==='function'){return stringify(value.toJSON());} a=[];if(typeof value.length==='number'&&!(value.propertyIsEnumerable('length'))){l=value.length;for(i=0;i<l;i+=1){a.push(stringify(value[i],whitelist)||'null');} return'['+a.join(',')+']';} if(whitelist){l=whitelist.length;for(i=0;i<l;i+=1){k=whitelist[i];if(typeof k==='string'){v=stringify(value[k],whitelist);if(v){a.push(stringify(k)+':'+v);}}}}else{for(k in value){if(typeof k==='string'){v=stringify(value[k],whitelist);if(v){a.push(stringify(k)+':'+v);}}}} return'{'+a.join(',')+'}';}} return{stringify:stringify,parse:function(text,filter){var j;function walk(k,v){var i,n;if(v&&typeof v==='object'){for(i in v){if(Object.prototype.hasOwnProperty.apply(v,[i])){n=walk(i,v[i]);if(n!==undefined){v[i]=n;}}}} return filter(k,v);} if(/^[\\],:{}\\s]*$/.test(text.replace(/\\\\./g,'@').replace(/\"[^\"\\\\\\n\\r]*\"|true|false|null|-?\\d+(?:\\.\\d*)?(?:[eE][+\\-]?\\d+)?/g,']').replace(/(?:^|:|,)(?:\\s*\\[)+/g,''))){j=eval('('+text+')');return typeof filter==='function'?walk('',j):j;} throw new SyntaxError('parseJSON');}};}();}</script></head><body></body></html>";
}

@end

#endif