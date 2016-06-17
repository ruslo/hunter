// Example from: http://www.angusj.com/delphi/clipper.php#code

#include "polyclipping/clipper.hpp"

int main() {
  using namespace ClipperLib;

  Paths subj(2), clip(1), solution;

  //define outer blue 'subject' polygon
  subj[0] <<
    IntPoint(180,200) << IntPoint(260,200) <<
    IntPoint(260,150) << IntPoint(180,150);

  //define subject's inner triangular 'hole' (with reverse orientation)
  subj[1] <<
    IntPoint(215,160) << IntPoint(230,190) << IntPoint(200,190);

  //define orange 'clipping' polygon
  clip[0] <<
    IntPoint(190,210) << IntPoint(240,210) <<
    IntPoint(240,130) << IntPoint(190,130);

  //draw input polygons with user-defined routine ...
  // DrawPolygons(subj, 0x160000FF, 0x600000FF); //blue
  // DrawPolygons(clip, 0x20FFFF00, 0x30FF0000); //orange

  //perform intersection ...
  Clipper c;
  c.AddPaths(subj, ptSubject, true);
  c.AddPaths(clip, ptClip, true);
  c.Execute(ctIntersection, solution, pftNonZero, pftNonZero);

  //draw solution with user-defined routine ...
  // DrawPolygons(solution, 0x3000FF00, 0xFF006600); //solution shaded green
}
