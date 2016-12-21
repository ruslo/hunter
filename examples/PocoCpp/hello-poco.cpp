#include <iostream>
#include <Poco/AutoPtr.h>
#include <Poco/RefCountedObject.h>
#include <Poco/Util/Application.h>

class MyRCO : public Poco::RefCountedObject
{
public:
	MyRCO()
	{
	}

	void great() const
	{
		std::cout << "Hello, RCO!" << std::endl;
	}

protected:
	~MyRCO()
	{
	}
};

class HelloPocoApplication : public Poco::Util::Application
{
protected:
	virtual int main(const std::vector<std::string> &args)
	{
		std::cout << "Hello, POCO C++ Libraries!" << std::endl;
        
        Poco::AutoPtr<MyRCO> pMyRCO(new MyRCO());
        
        pMyRCO->great();
        (*pMyRCO).great();
        
        MyRCO *p1 = pMyRCO;
        MyRCO *p2 = pMyRCO.get();
        
        std::cout << "[Before] Reference count: " << pMyRCO->referenceCount() << std::endl;
        
        {
            Poco::AutoPtr<MyRCO> anotherAutoPtr(pMyRCO);
            std::cout << "[In Scope] Reference count: " << pMyRCO->referenceCount() << std::endl;
        }
        
        std::cout << "[Out Scope] Reference count: " << pMyRCO->referenceCount() << std::endl;
        
		return EXIT_OK;
	}
};

POCO_APP_MAIN(HelloPocoApplication);
