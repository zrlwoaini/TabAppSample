#include <wbxml_conv.h>

typedef enum {kCompact = WBXML_GEN_XML_COMPACT,
	      kIndent = WBXML_GEN_XML_INDENT,
	      kCanonical = WBXML_GEN_XML_CANONICAL} GenType;

typedef enum {kActiveSync = WBXML_LANG_ACTIVESYNC,
	      kAirSync = WBXML_LANG_AIRSYNC} Lang;

typedef enum {kV1_2 = WBXML_VERSION_12,
	      kV1_3 = WBXML_VERSION_13} Version;

@interface WBXML : NSObject
  @property(nonatomic) GenType genType;
  @property(nonatomic) Lang lang;
  @property(nonatomic) Version version;

  @property(nonatomic) WBXMLConvWBXML2XML *w2x;
  @property(nonatomic) WBXMLConvXML2WBXML *x2w;

  - (void)disablePublicId;
  - (NSData*)toWBXML:(NSString*)xml;
  - (NSString*)toXML:(NSData*)wbxml;
@end





