#import "WBXML.h"

@implementation WBXML
- (id)init {
  if ([super init] == self) {
    wbxml_conv_wbxml2xml_create(&_w2x);
    wbxml_conv_xml2wbxml_create(&_x2w);
    return self;
  }
  return nil;
}

- (void)dealloc {
  free(_w2x); _w2x = NULL;
  free(_x2w); _x2w = NULL;
}

- (void)setGenType:(GenType)gen_type {
  wbxml_conv_wbxml2xml_set_gen_type(_w2x, gen_type);
}

- (void)setLang:(Lang)lang {
  wbxml_conv_wbxml2xml_set_language(_w2x, lang);
}

- (void)setVersion:(Version)version {
  wbxml_conv_xml2wbxml_set_version(_x2w, version);
}

- (void)disablePublicId {
  wbxml_conv_xml2wbxml_disable_public_id(_x2w);
}

- (NSData*)toWBXML:(NSString*)xml {
  NSData *retval = nil;
  WB_UTINY *output_buf_ptr = NULL;
  WB_ULONG output_len = 0;
  WBXMLError code = WBXML_OK;
  code = wbxml_conv_xml2wbxml_run(_x2w, 
				  [xml cStringUsingEncoding:NSUTF8StringEncoding],
				  [xml lengthOfBytesUsingEncoding:NSUTF8StringEncoding],
				  &output_buf_ptr,
				  &output_len);
  if (WBXML_OK != code) {
    NSLog(@"Conversion to WBXML failed: %s.",wbxml_errors_string(code));
    return nil;
  }
  retval = [NSData dataWithBytes:output_buf_ptr length:output_len];
  free(output_buf_ptr);
  return retval;
}

- (NSString*)toXML:(NSData*)wbxml {
  NSString *retval = nil;
  WB_UTINY *output_buf_ptr = NULL;
  WB_ULONG output_len = 0;
  WBXMLError code = WBXML_OK;
  code = wbxml_conv_wbxml2xml_run(_w2x,
				  [wbxml bytes], 
				  [wbxml length],
				  &output_buf_ptr,
				  &output_len);
  if (WBXML_OK != code) {
    NSLog(@"Conversion to XML failed: %s.",wbxml_errors_string(code));
    return nil;
  }
  retval = [NSString stringWithCString:output_buf_ptr encoding:NSUTF8StringEncoding];
  free(output_buf_ptr);
  return retval;
}
@end
