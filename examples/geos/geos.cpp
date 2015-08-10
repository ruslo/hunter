/**********************************************************************
 *
 * GEOS - Geometry Engine Open Source
 * http://geos.osgeo.org
 *
 * Copyright (C) 2001-2002 Vivid Solutions Inc.
 * Copyright (C) 2005 Refractions Research Inc.
 *
 * This is free software; you can redistribute and/or modify it under
 * the terms of the GNU Lesser General Public Licence as published
 * by the Free Software Foundation. 
 * See the COPYING file for more information.
 *
 *********************************************************************
 *
 * This file should document by example usage of the GEOS library.
 * It could actually be a live discuss-by-example board for
 * architectural design choices.
 *
 * 			--strk;
 * 
 * DEBUGGING TIPS:
 *  use -D__USE_MALLOC at compile time for gcc 2.91, 2.95, 3.0 and 3.1
 *  and GLIBCXX_FORCE_NEW or GLIBCPP_FORCE_NEW at run time with gcc 3.2.2+
 *  to force libstdc++ avoid caching memory. This should remove some
 *  obscure reports from memory checkers like valgrind.
 *
 **********************************************************************/

#include <geos/geom/PrecisionModel.h>
#include <geos/geom/GeometryFactory.h>
#include <geos/geom/Geometry.h>
#include <geos/geom/Point.h>
#include <geos/geom/LinearRing.h>
#include <geos/geom/LineString.h>
#include <geos/geom/Polygon.h>
#include <geos/geom/GeometryCollection.h>
#include <geos/geom/Coordinate.h>
#include <geos/geom/CoordinateSequence.h>
#include <geos/geom/CoordinateArraySequence.h>
#include <geos/geom/IntersectionMatrix.h>
#include <geos/io/WKBReader.h>
#include <geos/io/WKBWriter.h>
#include <geos/io/WKTWriter.h>
#include <geos/util/GeometricShapeFactory.h>
#include <geos/geom/util/SineStarFactory.h>
#include <geos/util/GEOSException.h>
#include <geos/util/IllegalArgumentException.h>
#include <geos/opLinemerge.h>
#include <geos/opPolygonize.h>
#include <vector>
#include <sstream>
#include <iomanip>
#include <cstdlib> // exit()

#ifndef M_PI
#define M_PI       3.14159265358979323846
#endif

// Set to 0 to skip section
#define GEOMETRIC_SHAPES 1
#define RELATIONAL_OPERATORS 1
#define COMBINATIONS 1
#define UNARY_OPERATIONS 1
#define LINEMERGE 1
#define POLYGONIZE 1


using namespace std;
using namespace geos;
using namespace geos::geom;
using namespace geos::operation::polygonize;
using namespace geos::operation::linemerge;
using geos::util::GEOSException;
using geos::util::IllegalArgumentException;


// Prototypes
void wkt_print_geoms(vector<Geometry *> *geoms);


// This object will be used to construct our geometries.
// It might be bypassed by directly call geometry constructors,
// but that would be boring because you'd need to specify
// a PrecisionModel and a SRID everytime: those infos are
// cached inside a GeometryFactory object.
GeometryFactory *global_factory;

//#define DEBUG_STREAM_STATE 1


//
// This function tests writing and reading WKB
// TODO:
//	- compare input and output geometries for equality
//	- remove debugging lines (on stream state)
//
void WKBtest(vector<Geometry*>*geoms)
{
	stringstream s(ios_base::binary|ios_base::in|ios_base::out);
	io::WKBReader wkbReader(*global_factory);
	io::WKBWriter wkbWriter;
	Geometry *gout;

#if DEBUG_STREAM_STATE
	cout<<"WKBtest: machine byte order: "<<BYTE_ORDER<<endl;
#endif


	unsigned int ngeoms=geoms->size();
	for (unsigned int i=0; i<ngeoms; ++i)
	{
		Geometry *gin = (*geoms)[i];

#if DEBUG_STREAM_STATE
		cout<<"State of stream before WRITE: ";
		cout<<"p:"<<s.tellp()<<" g:"<<s.tellg()<<
			" good:"<<s.good()<<
			" eof:"<<s.eof()<<
			" bad:"<<s.bad()<<
			" fail:"<<s.fail()<<endl; 
#endif

#if DEBUG_STREAM_STATE
		cout<<"State of stream after SEEKP: ";
		cout<<"p:"<<s.tellp()<<" g:"<<s.tellg()<<
			" good:"<<s.good()<<
			" eof:"<<s.eof()<<
			" bad:"<<s.bad()<<
			" fail:"<<s.fail()<<endl; 
#endif

		wkbWriter.write(*gin, s);
#if DEBUG_STREAM_STATE
		cout<<"wkbWriter wrote and reached ";
		cout<<"p:"<<s.tellp()<<" g:"<<s.tellg()<<endl; 

		cout<<"State of stream before DUMP: ";
		cout<<"p:"<<s.tellp()<<" g:"<<s.tellg()<<
			" good:"<<s.good()<<
			" eof:"<<s.eof()<<
			" bad:"<<s.bad()<<
			" fail:"<<s.fail()<<endl; 
#endif

#if DEBUG_STREAM_STATE
		cout<<"State of stream after DUMP: ";
		cout<<"p:"<<s.tellp()<<" g:"<<s.tellg()<<
			" good:"<<s.good()<<
			" eof:"<<s.eof()<<
			" bad:"<<s.bad()<<
			" fail:"<<s.fail()<<endl; 
#endif

		s.seekg(0, ios::beg); // rewind reader pointer

#if DEBUG_STREAM_STATE
		cout<<"State of stream before READ: ";
		cout<<"p:"<<s.tellp()<<" g:"<<s.tellg()<<
			" good:"<<s.good()<<
			" eof:"<<s.eof()<<
			" bad:"<<s.bad()<<
			" fail:"<<s.fail()<<endl; 
#endif

		gout = wkbReader.read(s);

#if DEBUG_STREAM_STATE
		cout<<"State of stream after READ: ";
		cout<<"p:"<<s.tellp()<<" g:"<<s.tellg()<<
			" good:"<<s.good()<<
			" eof:"<<s.eof()<<
			" bad:"<<s.bad()<<
			" fail:"<<s.fail()<<endl; 
#endif

		gin->normalize();
		gout->normalize();
		int failed = gin->compareTo(gout);
		if ( failed ) cout<<"{"<<i<<"} (WKB) ";
		else cout<<"["<<i<<"] (WKB) ";

		io::WKBReader::printHEX(s, cout);
		cout<<endl;

		if ( failed ) {
			io::WKTWriter wkt;
			cout<<"  IN: "<<wkt.write(gin)<<endl;
			cout<<" OUT: "<<wkt.write(gout)<<endl;
		}

		s.seekp(0, ios::beg); // rewind writer pointer

		delete gout;
	}

}


// This function will print given geometries in WKT
// format to stdout. As a side-effect, will test WKB
// output and input, using the WKBtest function.
void
wkt_print_geoms(vector<Geometry *> *geoms)
{
	WKBtest(geoms); // test WKB parser

	// WKT-print given geometries
	io::WKTWriter *wkt = new io::WKTWriter();
	for (unsigned int i=0; i<geoms->size(); i++) {
		const Geometry *g = (*geoms)[i];
		string tmp=wkt->write(g);
		cout<<"["<<i<<"] (WKT) "<<tmp<<endl;
	}
	delete wkt;
}

// This is the simpler geometry you can get: a point.
Point *
create_point(double x, double y)
{
	Coordinate c(x, y);
	Point *p = global_factory->createPoint(c);
	return p;
}

// This function will create a LinearString
// geometry with the shape of the letter U
// having top-left corner at given coordinates
// and 'side' height and width 
LineString *
create_ushaped_linestring(double xoffset, double yoffset, double side)
{
	// We will use a coordinate list to build the linestring
	CoordinateSequence *cl = new CoordinateArraySequence();

	cl->add(Coordinate(xoffset, yoffset));
	cl->add(Coordinate(xoffset, yoffset+side));
	cl->add(Coordinate(xoffset+side, yoffset+side));
	cl->add(Coordinate(xoffset+side, yoffset));

	// Now that we have a CoordinateSequence we can create 
	// the linestring.
	// The newly created LineString will take ownership
	// of the CoordinateSequence.
	LineString *ls = global_factory->createLineString(cl);

	// This is what you do if you want the new LineString
	// to make a copy of your CoordinateSequence:
	// LineString *ls = global_factory->createLineString(*cl);
	
	return ls; // our LineString
}

// This function will create a LinearRing
// geometry rapresenting a square with the given origin 
// and side 
LinearRing *
create_square_linearring(double xoffset, double yoffset, double side)
{
	// We will use a coordinate list to build the linearring
	CoordinateSequence *cl = new CoordinateArraySequence();

	cl->add(Coordinate(xoffset, yoffset));
	cl->add(Coordinate(xoffset, yoffset+side));
	cl->add(Coordinate(xoffset+side, yoffset+side));
	cl->add(Coordinate(xoffset+side, yoffset));
	cl->add(Coordinate(xoffset, yoffset));

	// Now that we have a CoordinateSequence we can create 
	// the linearring.
	// The newly created LinearRing will take ownership
	// of the CoordinateSequence.
	LinearRing *lr = global_factory->createLinearRing(cl);

	// This is what you do if you want the new LinearRing
	// to make a copy of your CoordinateSequence:
	// LinearRing *lr = global_factory->createLinearRing(*cl);
	
	return lr; // our LinearRing
}

// This function will create a Polygon
// geometry rapresenting a square with the given origin 
// and side and with a central hole 1/3 sided.
Polygon *
create_square_polygon(double xoffset, double yoffset, double side)
{
	// We need a LinearRing for the polygon shell 
	LinearRing *outer = create_square_linearring(xoffset,yoffset,side);

	// And another for the hole 
	LinearRing *inner = create_square_linearring(xoffset+(side/3),
			yoffset+(side/3),(side/3));
	
	// If we need to specify any hole, we do it using
	// a vector of Geometry pointers (I don't know why
	// not LinearRings)
	vector<Geometry *> *holes = new vector<Geometry *>;

	// We add the newly created geometry to the vector
	// of holes.
	holes->push_back(inner);

	// And finally we call the polygon constructor.
	// Both the outer LinearRing and the vector of holes
	// will be referenced by the resulting Polygon object,
	// thus we CANNOT delete them, neither the holes, nor
	// the vector containing their pointers, nor the outer
	// LinearRing. Everything will be deleted at Polygon
	// deletion time (this is inconsistent with LinearRing
	// behaviour... what should we do?).
	Polygon *poly = global_factory->createPolygon(outer, holes);

	return poly;
}

//
// This function will create a GeometryCollection
// containing copies of all Geometries in given vector.
//
GeometryCollection *
create_simple_collection(vector<Geometry *> *geoms)
{
	return global_factory->createGeometryCollection(*geoms);
	// if you wanted to transfer ownership of vector end
	// its elements you should have call:
	// return global_factory->createGeometryCollection(geoms);
}

//
// This function uses GeometricShapeFactory to render
// a circle having given center and radius
//
Polygon *
create_circle(double centerX, double centerY, double radius)
{
	geos::util::GeometricShapeFactory shapefactory(global_factory);
	shapefactory.setCentre(Coordinate(centerX, centerY));
	shapefactory.setSize(radius);
	// same as:
	//	shapefactory.setHeight(radius);
	//	shapefactory.setWidth(radius);
	return shapefactory.createCircle();
}

//
// This function uses GeometricShapeFactory to render
// an ellipse having given center and axis size
//
Polygon *
create_ellipse(double centerX, double centerY, double width, double height)
{
	geos::util::GeometricShapeFactory shapefactory(global_factory);
	shapefactory.setCentre(Coordinate(centerX, centerY));
	shapefactory.setHeight(height);
	shapefactory.setWidth(width);
	return shapefactory.createCircle();
}

//
// This function uses GeometricShapeFactory to render
// a rectangle having lower-left corner at given coordinates
// and given sizes.
//
Polygon *
create_rectangle(double llX, double llY, double width, double height)
{
	geos::util::GeometricShapeFactory shapefactory(global_factory);
	shapefactory.setBase(Coordinate(llX, llY));
	shapefactory.setHeight(height);
	shapefactory.setWidth(width);
	shapefactory.setNumPoints(4); // we don't need more then 4 points for a rectangle...
	// can use setSize for a square
	return shapefactory.createRectangle();
}

//
// This function uses GeometricShapeFactory to render
// an arc having lower-left corner at given coordinates,
// given sizes and given angles. 
//
LineString *
create_arc(double llX, double llY, double width, double height, double startang, double endang)
{
	geos::util::GeometricShapeFactory shapefactory(global_factory);
	shapefactory.setBase(Coordinate(llX, llY));
	shapefactory.setHeight(height);
	shapefactory.setWidth(width);
	// shapefactory.setNumPoints(100); // the default (100 pts)
	// can use setSize for a square
	return shapefactory.createArc(startang, endang);
}

auto_ptr<Polygon>
create_sinestar(double cx, double cy, double size, int nArms, double armLenRat)
{
	geos::geom::util::SineStarFactory fact(global_factory);
	fact.setCentre(Coordinate(cx, cy));
	fact.setSize(size);
	fact.setNumPoints(nArms*5);
  fact.setArmLengthRatio(armLenRat);
	fact.setNumArms(nArms);
	return fact.createSineStar();
}

// Start reading here
void do_all()
{
	vector<Geometry *> *geoms = new vector<Geometry *>;
	vector<Geometry *> *newgeoms;
	
	// Define a precision model using 0,0 as the reference origin
	// and 2.0 as coordinates scale.
	PrecisionModel *pm = new PrecisionModel(2.0, 0, 0);

	// Initialize global factory with defined PrecisionModel
	// and a SRID of -1 (undefined).
	global_factory = new GeometryFactory(pm, -1);

	// We do not need PrecisionMode object anymore, it has
	// been copied to global_factory private storage
	delete pm;

////////////////////////////////////////////////////////////////////////
// GEOMETRY CREATION
////////////////////////////////////////////////////////////////////////

	// Read function bodies to see the magic behind them
	geoms->push_back(create_point(150, 350));
	geoms->push_back(create_square_linearring(0,0,100));
	geoms->push_back(create_ushaped_linestring(60,60,100));
	geoms->push_back(create_square_linearring(0,0,100));
	geoms->push_back(create_square_polygon(0,200,300));
	geoms->push_back(create_square_polygon(0,250,300));
	geoms->push_back(create_simple_collection(geoms));

#if GEOMETRIC_SHAPES
	// These ones use a GeometricShapeFactory
	geoms->push_back(create_circle(0, 0, 10));
	geoms->push_back(create_ellipse(0, 0, 8, 12));
	geoms->push_back(create_rectangle(-5, -5, 10, 10)); // a square
	geoms->push_back(create_rectangle(-5, -5, 10, 20)); // a rectangle
	// The upper-right quarter of a vertical ellipse
	geoms->push_back(create_arc(0, 0, 10, 20, 0, M_PI/2));
	geoms->push_back(create_sinestar(10, 10, 100, 5, 2).release()); // a sine star
#endif

	// Print all geoms.
	cout<<"--------HERE ARE THE BASE GEOMS ----------"<<endl;
	wkt_print_geoms(geoms);


#if UNARY_OPERATIONS

////////////////////////////////////////////////////////////////////////
// UNARY OPERATIONS
////////////////////////////////////////////////////////////////////////

	/////////////////////////////////////////////
	// CENTROID
	/////////////////////////////////////////////
	
	// Find centroid of each base geometry
	newgeoms = new vector<Geometry *>;
	for (unsigned int i=0; i<geoms->size(); i++) {
		Geometry *g = (*geoms)[i];
		newgeoms->push_back( g->getCentroid() );
	}

	// Print all convex hulls
	cout<<endl<<"------- AND HERE ARE THEIR CENTROIDS -----"<<endl;
	wkt_print_geoms(newgeoms);

	// Delete the centroids
	for (unsigned int i=0; i<newgeoms->size(); i++) {
		delete (*newgeoms)[i];
	}
	delete newgeoms;
	
	/////////////////////////////////////////////
	// BUFFER
	/////////////////////////////////////////////
	
	newgeoms = new vector<Geometry *>;
	for (unsigned int i=0; i<geoms->size(); i++) {
		Geometry *g = (*geoms)[i];
		try {
			Geometry *g2 = g->buffer(10);
			newgeoms->push_back(g2);
		}
		catch (const GEOSException& exc) {
			cerr <<"GEOS Exception: geometry "<<i<<"->buffer(10): "<<exc.what()<<"\n";
		}
	}

	cout<<endl<<"--------HERE COMES THE BUFFERED GEOMS ----------"<<endl;
	wkt_print_geoms(newgeoms);

	for (unsigned int i=0; i<newgeoms->size(); i++) {
		delete (*newgeoms)[i];
	}
	delete newgeoms;
	
	/////////////////////////////////////////////
	// CONVEX HULL
	/////////////////////////////////////////////
	
	// Make convex hulls of geometries
	newgeoms = new vector<Geometry *>;
	for (unsigned int i=0; i<geoms->size(); i++) {
		Geometry *g = (*geoms)[i];
		newgeoms->push_back( g->convexHull() );
	}

	// Print all convex hulls
	cout<<endl<<"--------HERE COMES THE HULLS----------"<<endl;
	wkt_print_geoms(newgeoms);

	// Delete the hulls
	for (unsigned int i=0; i<newgeoms->size(); i++) {
		delete (*newgeoms)[i];
	}
	delete newgeoms;

#endif // UNARY_OPERATIONS

#if RELATIONAL_OPERATORS

////////////////////////////////////////////////////////////////////////
// RELATIONAL OPERATORS
////////////////////////////////////////////////////////////////////////

cout<<"-------------------------------------------------------------------------------"<<endl;
cout<<"RELATIONAL OPERATORS"<<endl;
cout<<"-------------------------------------------------------------------------------"<<endl;

	/////////////////////////////////////////////
	// DISJOINT
	/////////////////////////////////////////////

	cout<<endl;
	cout<<"   DISJOINT   ";
	for (unsigned int i=0; i<geoms->size(); i++) {
		cout<<"\t["<<i<<"]";
	}
	cout<<endl;
	for (unsigned int i=0; i<geoms->size(); i++) {
		Geometry *g1 = (*geoms)[i];
		cout<<"      ["<<i<<"]\t";
		for (unsigned int j=0; j<geoms->size(); j++) {
			Geometry *g2 = (*geoms)[j];
			try {
				if ( g1->disjoint(g2) ) cout<<" 1\t";
				else cout<<" 0\t";
			}
			// Geometry Collection is not a valid argument
			catch (const IllegalArgumentException& exc) {
				cout<<" X\t";
			}
			catch (const std::exception& exc) {
				cerr<<exc.what()<<endl;
			}
		}
		cout<<endl;
	}
	
	/////////////////////////////////////////////
	// TOUCHES
	/////////////////////////////////////////////

	cout<<endl;
	cout<<"    TOUCHES   ";
	for (unsigned int i=0; i<geoms->size(); i++) {
		cout<<"\t["<<i<<"]";
	}
	cout<<endl;
	for (unsigned int i=0; i<geoms->size(); i++) {
		Geometry *g1 = (*geoms)[i];
		cout<<"      ["<<i<<"]\t";
		for (unsigned int j=0; j<geoms->size(); j++) {
			Geometry *g2 = (*geoms)[j];
			try {
				if ( g1->touches(g2) ) cout<<" 1\t";
				else cout<<" 0\t";
			}
			// Geometry Collection is not a valid argument
			catch (const IllegalArgumentException& exc) {
				cout<<" X\t";
			}
			catch (const std::exception& exc) {
				cerr<<exc.what()<<endl;
			}
		}
		cout<<endl;
	}

	/////////////////////////////////////////////
	// INTERSECTS
	/////////////////////////////////////////////

	cout<<endl;
	cout<<" INTERSECTS   ";
	for (unsigned int i=0; i<geoms->size(); i++) {
		cout<<"\t["<<i<<"]";
	}
	cout<<endl;
	for (unsigned int i=0; i<geoms->size(); i++) {
		Geometry *g1 = (*geoms)[i];
		cout<<"      ["<<i<<"]\t";
		for (unsigned int j=0; j<geoms->size(); j++) {
			Geometry *g2 = (*geoms)[j];
			try {
				if ( g1->intersects(g2) ) cout<<" 1\t";
				else cout<<" 0\t";
			}
			// Geometry Collection is not a valid argument
			catch (const IllegalArgumentException& exc) {
				cout<<" X\t";
			}
			catch (const std::exception& exc) {
				cerr<<exc.what()<<endl;
			}
		}
		cout<<endl;
	}

	/////////////////////////////////////////////
	// CROSSES
	/////////////////////////////////////////////

	cout<<endl;
	cout<<"    CROSSES   ";
	for (unsigned int i=0; i<geoms->size(); i++) {
		cout<<"\t["<<i<<"]";
	}
	cout<<endl;
	for (unsigned int i=0; i<geoms->size(); i++) {
		Geometry *g1 = (*geoms)[i];
		cout<<"      ["<<i<<"]\t";
		for (unsigned int j=0; j<geoms->size(); j++) {
			Geometry *g2 = (*geoms)[j];
			try {
				if ( g1->crosses(g2) ) cout<<" 1\t";
				else cout<<" 0\t";
			}
			// Geometry Collection is not a valid argument
			catch (const IllegalArgumentException& exc) {
				cout<<" X\t";
			}
			catch (const std::exception& exc) {
				cerr<<exc.what()<<endl;
			}
		}
		cout<<endl;
	}

	/////////////////////////////////////////////
	// WITHIN
	/////////////////////////////////////////////

	cout<<endl;
	cout<<"     WITHIN   ";
	for (unsigned int i=0; i<geoms->size(); i++) {
		cout<<"\t["<<i<<"]";
	}
	cout<<endl;
	for (unsigned int i=0; i<geoms->size(); i++) {
		Geometry *g1 = (*geoms)[i];
		cout<<"      ["<<i<<"]\t";
		for (unsigned int j=0; j<geoms->size(); j++) {
			Geometry *g2 = (*geoms)[j];
			try {
				if ( g1->within(g2) ) cout<<" 1\t";
				else cout<<" 0\t";
			}
			// Geometry Collection is not a valid argument
			catch (const IllegalArgumentException& exc) {
				cout<<" X\t";
			}
			catch (const std::exception& exc) {
				cerr<<exc.what()<<endl;
			}
		}
		cout<<endl;
	}

	/////////////////////////////////////////////
	// CONTAINS
	/////////////////////////////////////////////

	cout<<endl;
	cout<<"   CONTAINS   ";
	for (unsigned int i=0; i<geoms->size(); i++) {
		cout<<"\t["<<i<<"]";
	}
	cout<<endl;
	for (unsigned int i=0; i<geoms->size(); i++) {
		Geometry *g1 = (*geoms)[i];
		cout<<"      ["<<i<<"]\t";
		for (unsigned int j=0; j<geoms->size(); j++) {
			Geometry *g2 = (*geoms)[j];
			try {
				if ( g1->contains(g2) ) cout<<" 1\t";
				else cout<<" 0\t";
			}
			// Geometry Collection is not a valid argument
			catch (const IllegalArgumentException& exc) {
				cout<<" X\t";
			}
			catch (const std::exception& exc) {
				cerr<<exc.what()<<endl;
			}
		}
		cout<<endl;
	}

	/////////////////////////////////////////////
	// OVERLAPS
	/////////////////////////////////////////////
	
	cout<<endl;
	cout<<"   OVERLAPS   ";
	for (unsigned int i=0; i<geoms->size(); i++) {
		cout<<"\t["<<i<<"]";
	}
	cout<<endl;
	for (unsigned int i=0; i<geoms->size(); i++) {
		Geometry *g1 = (*geoms)[i];
		cout<<"      ["<<i<<"]\t";
		for (unsigned int j=0; j<geoms->size(); j++) {
			Geometry *g2 = (*geoms)[j];
			try {
				if ( g1->overlaps(g2) ) cout<<" 1\t";
				else cout<<" 0\t";
			}
			// Geometry Collection is not a valid argument
			catch (const IllegalArgumentException& exc) {
				cout<<" X\t";
			}
			catch (const std::exception& exc) {
				cerr<<exc.what()<<endl;
			}
		}
		cout<<endl;
	}

	/////////////////////////////////////////////
	// RELATE
	/////////////////////////////////////////////

	cout<<endl;
	cout<<"     RELATE   ";
	for (unsigned int i=0; i<geoms->size(); i++) {
		cout<<"\t["<<i<<"]";
	}
	cout<<endl;
	for (unsigned int i=0; i<geoms->size(); i++) {
		Geometry *g1 = (*geoms)[i];
		cout<<"      ["<<i<<"]\t";
		for (unsigned int j=0; j<geoms->size(); j++) {
			Geometry *g2 = (*geoms)[j];
			IntersectionMatrix *im=NULL;
			try {
				// second argument is intersectionPattern
				string pattern = "212101212";
				if ( g1->relate(g2, pattern) ) cout<<" 1\t";
				else cout<<" 0\t";
				
				// get the intersectionMatrix itself
				im=g1->relate(g2);
				delete im; // delete afterwards
			}
			// Geometry Collection is not a valid argument
			catch (const IllegalArgumentException& exc) {
				cout<<" X\t";
			}
			catch (const std::exception& exc) {
				cerr<<exc.what()<<endl;
			}
		}
		cout<<endl;
	}

	/////////////////////////////////////////////
	// EQUALS
	/////////////////////////////////////////////

	cout<<endl;
	cout<<"     EQUALS   ";
	for (unsigned int i=0; i<geoms->size(); i++) {
		cout<<"\t["<<i<<"]";
	}
	cout<<endl;
	for (unsigned int i=0; i<geoms->size(); i++) {
		Geometry *g1 = (*geoms)[i];
		cout<<"      ["<<i<<"]\t";
		for (unsigned int j=0; j<geoms->size(); j++) {
			Geometry *g2 = (*geoms)[j];
			try {
				if ( g1->equals(g2) ) cout<<" 1\t";
				else cout<<" 0\t";
			}
			// Geometry Collection is not a valid argument
			catch (const IllegalArgumentException& exc) {
				cout<<" X\t";
			}
			catch (const std::exception& exc) {
				cerr<<exc.what()<<endl;
			}
		}
		cout<<endl;
	}

	/////////////////////////////////////////////
	// EQUALS_EXACT
	/////////////////////////////////////////////

	cout<<endl;
	cout<<"EQUALS_EXACT  ";
	for (unsigned int i=0; i<geoms->size(); i++) {
		cout<<"\t["<<i<<"]";
	}
	cout<<endl;
	for (unsigned int i=0; i<geoms->size(); i++) {
		Geometry *g1 = (*geoms)[i];
		cout<<"      ["<<i<<"]\t";
		for (unsigned int j=0; j<geoms->size(); j++) {
			Geometry *g2 = (*geoms)[j];
			try {
				// second argument is a tolerance
				if ( g1->equalsExact(g2, 0.5) ) cout<<" 1\t";
				else cout<<" 0\t";
			}
			// Geometry Collection is not a valid argument
			catch (const IllegalArgumentException& exc) {
				cout<<" X\t";
			}
			catch (const std::exception& exc) {
				cerr<<exc.what()<<endl;
			}
		}
		cout<<endl;
	}

	/////////////////////////////////////////////
	// IS_WITHIN_DISTANCE
	/////////////////////////////////////////////

	cout<<endl;
	cout<<"IS_WITHIN_DIST";
	for (unsigned int i=0; i<geoms->size(); i++) {
		cout<<"\t["<<i<<"]";
	}
	cout<<endl;
	for (unsigned int i=0; i<geoms->size(); i++) {
		Geometry *g1 = (*geoms)[i];
		cout<<"      ["<<i<<"]\t";
		for (unsigned int j=0; j<geoms->size(); j++) {
			Geometry *g2 = (*geoms)[j];
			try {
				// second argument is the distance
				if ( g1->isWithinDistance(g2,2) ) cout<<" 1\t";
				else cout<<" 0\t";
			}
			// Geometry Collection is not a valid argument
			catch (const IllegalArgumentException& exc) {
				cout<<" X\t";
			}
			catch (const std::exception& exc) {
				cerr<<exc.what()<<endl;
			}
		}
		cout<<endl;
	}

#endif // RELATIONAL_OPERATORS

#if COMBINATIONS

////////////////////////////////////////////////////////////////////////
// COMBINATIONS
////////////////////////////////////////////////////////////////////////

cout<<endl;
cout<<"-------------------------------------------------------------------------------"<<endl;
cout<<"COMBINATIONS"<<endl;
cout<<"-------------------------------------------------------------------------------"<<endl;

	/////////////////////////////////////////////
	// UNION
	/////////////////////////////////////////////

	// Make unions of all geoms
	newgeoms = new vector<Geometry *>;
	for (unsigned int i=0; i<geoms->size()-1; i++) {
		Geometry *g1 = (*geoms)[i];
		for (unsigned int j=i+1; j<geoms->size(); j++) {
			Geometry *g2 = (*geoms)[j];
			try {
				Geometry *g3 = g1->Union(g2);
				newgeoms->push_back(g3);
			}
			// It's illegal to union a collection ...
			catch (const IllegalArgumentException& ill) {
				//cerr <<ill.toString()<<"\n";
			}
			catch (const std::exception& exc) {
				cerr<<exc.what()<<endl;
			}
		}
	}

	// Print all unions
	cout<<endl<<"----- AND HERE ARE SOME UNION COMBINATIONS ------"<<endl;
	wkt_print_geoms(newgeoms);

	// Delete the resulting geoms
	for (unsigned int i=0; i<newgeoms->size(); i++) {
		delete (*newgeoms)[i];
	}
	delete newgeoms;
	

	/////////////////////////////////////////////
	// INTERSECTION
	/////////////////////////////////////////////
	
	// Compute intersection of adhiacent geometries
	newgeoms = new vector<Geometry *>;
	for (unsigned int i=0; i<geoms->size()-1; i++) {
		Geometry *g1 = (*geoms)[i];
		for (unsigned int j=i+1; j<geoms->size(); j++) {
			Geometry *g2 = (*geoms)[j];
			try {
				Geometry *g3 = g1->intersection(g2);
				newgeoms->push_back(g3);
			}
			// Collection are illegal as intersection argument
			catch (const IllegalArgumentException& ill) {
				//cerr <<ill.toString()<<"\n";
			}
			catch (const std::exception& exc) {
				cerr<<exc.what()<<endl;
			}
		}
	}

	cout<<endl<<"----- HERE ARE SOME INTERSECTIONS COMBINATIONS ------"<<endl;
	wkt_print_geoms(newgeoms);

	// Delete the resulting geoms
	for (unsigned int i=0; i<newgeoms->size(); i++) {
		delete (*newgeoms)[i];
	}
	delete newgeoms;

	/////////////////////////////////////////////
	// DIFFERENCE
	/////////////////////////////////////////////
	
	// Compute difference of adhiacent geometries
	newgeoms = new vector<Geometry *>;
	for (unsigned int i=0; i<geoms->size()-1; i++) {
		Geometry *g1 = (*geoms)[i];
		for (unsigned int j=i+1; j<geoms->size(); j++) {
			Geometry *g2 = (*geoms)[j];
			try {
				Geometry *g3 = g1->difference(g2);
				newgeoms->push_back(g3);
			}
			// Collection are illegal as difference argument
			catch (const IllegalArgumentException& ill) {
				//cerr <<ill.toString()<<"\n";
			}
			catch (const std::exception& exc) {
				cerr<<exc.what()<<endl;
			}
		}
	}

	cout<<endl<<"----- HERE ARE SOME DIFFERENCE COMBINATIONS ------"<<endl;
	wkt_print_geoms(newgeoms);

	// Delete the resulting geoms
	for (unsigned int i=0; i<newgeoms->size(); i++) {
		delete (*newgeoms)[i];
	}
	delete newgeoms;
	
	/////////////////////////////////////////////
	// SYMMETRIC DIFFERENCE
	/////////////////////////////////////////////
	
	// Compute symmetric difference of adhiacent geometries
	newgeoms = new vector<Geometry *>;
	for (unsigned int i=0; i<geoms->size()-1; i++) {
		Geometry *g1 = (*geoms)[i];
		for (unsigned int j=i+1; j<geoms->size(); j++) {
			Geometry *g2 = (*geoms)[j];
			try {
				Geometry *g3 = g1->symDifference(g2);
				newgeoms->push_back(g3);
			}
			// Collection are illegal as symdifference argument
			catch (const IllegalArgumentException& ill) {
				//cerr <<ill.toString()<<"\n";
			}
			catch (const std::exception& exc) {
				cerr<<exc.what()<<endl;
			}
		}
	}

	cout<<endl<<"----- HERE ARE SYMMETRIC DIFFERENCES ------"<<endl;
	wkt_print_geoms(newgeoms);

	// Delete the resulting geoms
	for (unsigned int i=0; i<newgeoms->size(); i++) {
		delete (*newgeoms)[i];
	}
	delete newgeoms;

#endif // COMBINATIONS

#if LINEMERGE
	
	/////////////////////////////////////////////
	// LINEMERGE
	/////////////////////////////////////////////
	LineMerger lm;
	lm.add(geoms);
	vector<LineString *> *mls = lm.getMergedLineStrings();
	newgeoms = new vector<Geometry *>;
	for (unsigned int i=0; i<mls->size(); i++)
		newgeoms->push_back((*mls)[i]);
	delete mls;

	cout<<endl<<"----- HERE IS THE LINEMERGE OUTPUT ------"<<endl;
	wkt_print_geoms(newgeoms);
	
	// Delete the resulting geoms
	for (unsigned int i=0; i<newgeoms->size(); i++) {
		delete (*newgeoms)[i];
	}
	delete newgeoms;

#endif // LINEMERGE

#if POLYGONIZE

	/////////////////////////////////////////////
	// POLYGONIZE
	/////////////////////////////////////////////
	Polygonizer plgnzr;
	plgnzr.add(geoms);
	vector<Polygon *> *polys = plgnzr.getPolygons();
	newgeoms = new vector<Geometry *>;
	for (unsigned int i=0; i<polys->size(); i++)
		newgeoms->push_back((*polys)[i]);
	delete polys;

	cout<<endl<<"----- HERE IS POLYGONIZE OUTPUT ------"<<endl;
	wkt_print_geoms(newgeoms);
	
	// Delete the resulting geoms
	for (unsigned int i=0; i<newgeoms->size(); i++) {
		delete (*newgeoms)[i];
	}
	delete newgeoms;

#endif // POLYGONIZE

	/////////////////////////////////////////////
	// CLEANUP
	/////////////////////////////////////////////

	// Delete base geometries 
	for (unsigned int i=0; i<geoms->size(); i++) {
		delete (*geoms)[i];
	}
	delete geoms;

	delete global_factory;
}

int
main()
{
	cout<<"GEOS "<<geosversion()<<" ported from JTS "<<jtsport()<<endl;
	try
	{
		do_all();
	}
	// All exception thrown by GEOS are subclasses of this
	// one, so this is a catch-all 
	catch (const GEOSException& exc)
	{
		cerr <<"GEOS Exception: "<<exc.what()<<"\n";
		exit(1);
	}
	catch (const exception &e)
	{
		cerr <<"Standard exception thrown: "<<e.what()<<endl;
		exit(1);
	}
	// and this is a catch-all non standard ;)
	catch (...)
	{
		cerr <<"unknown exception trown!\n";
		exit(1);
	}

	// Unload is no more necessary
	//io::Unload::Release();

	exit(0);
}
