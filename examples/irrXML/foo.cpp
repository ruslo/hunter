#include <irrXML/irrXML.h>
using namespace irr; // irrXML is located
using namespace io;  // in the namespace irr::io

#include <string> // we use STL strings to store data
                  // in this example
#include <string.h> // strcmp

int main()
{
  // create the reader using one of the factory functions
  IrrXMLReader* xml = createIrrXMLReader("config.xml");

  // strings for storing the data we want to get out of the file
  std::string modelFile;
  std::string messageText;
  std::string caption;

  // parse the file until end reached

  while(xml && xml->read())
  {
    switch(xml->getNodeType())
    {
    case EXN_TEXT:
       // in this xml file, the only text which
       // occurs is the messageText
       messageText = xml->getNodeData();
       break;
    case EXN_ELEMENT:
       if (!strcmp("model", xml->getNodeName()))
         modelFile = xml->getAttributeValue("file");
       else
       if (!strcmp("messageText", xml->getNodeName()))
         caption = xml->getAttributeValue("caption");
       break;
    }
  }

  // delete the xml parser after usage
  delete xml;
}
