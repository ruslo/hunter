# Global Variables

### HUNTER_GATE_SHA1
The SHA1 value of the downloaded tar of hunter

### HUNTER_GATE_VERSION
Set to the used version of hunter.

### HUNTER_SELF 
To access the location of downloaded and extracted hunter package. For examples the projects folder can be accessed in the folder 
`${HUNTER_SELF}/cmake/projects`
The Variable is set in module hunter_finalize and computed with HUNTER_GATE_VERSION and HUNTER_GATE_SHA1

### HUNTER_INSTALL_PREFIX
The default install location

# Package Specific
Package specific variables are available in configuring schemes in the form of @variable_name@

### HUNTER_PACKAGE_NAME
Set to the package being installed without the version or component. For example, while installing component 'test' of Boost, HUNTER_PACKAGE_NAME will be set to 'Boost'.

### HUNTER_PACKAGE_DOWNLOAD_DIR
Location where the package will be downloaded. 

### HUNTER_PACKAGE_HOME_DIR
Home directory for the package. This directory will contain the source, build and install directories. While installing component of the package HUNTER_PACKAGE_HOME_DIR will be set to HUNTER_PACKAGE_HOME_DIR(of parent)/_componentName

### HUNTER_PACKAGE_SOURCE_DIR
Directory where the source of the package will be extracted. 

### HUNTER_PACKAGE_BUILD_DIR
Build directory of the package.

### HUNTER_PACKAGE_VERSION
Set to the version of package being installed.

### HUNTER_PACKAGE_COMPONENT
Set to the component being installed without the version. For example, while installing component 'test' of Boost, HUNTER_PACKAGE_COMPONENT is set to 'test'.

### HUNTER_EP_NAME
Set to the project being installed. For example, while installing component 'test' of Boost, HUNTER_PACKAGE_COMPONENT will be set to 'Boost-test' and while installing the Boost as a parent package it will be set to 'Boost'.

### HUNTER_[PACKAGE_NAME]_VERSION
Set to the version of package being installed. For example, while installing component 'test' of Boost with version 1.49.0, HUNTER_Boost_VERSION is set to '1.49.0'.

### HUNTER_PACKAGE_INSTALL_PREFIX
The location where the current package will be installed. Based on the cacheable property this location may differ from the default HUNTER_INSTALL_PREFIX location. Always use the project specific HUNTER_PACKAGE_INSTALL_PREFIX in schemes.
