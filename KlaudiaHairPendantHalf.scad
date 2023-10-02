module PyramidPrimitive()
{
   polyhedron(
  points=[ [10,10,0],[10,-10,0],[-10,-10,0],[-10,10,0], // the four points at base
           [0,0,45]  ],                                 // the apex point 
  faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4],              // each triangle side
              [1,0,3],[2,1,3] ]                         // two triangles for square base
 ); 
}

module KlaudiaHairPendant()
{
    difference()
    {
        
       union()
       {
           intersection()
           {
               union()
               {
                    PyramidPrimitive();
                    scale([1,1,0.3]) mirror([0,0,1])PyramidPrimitive();
               }
               cube(79.1,center=true);
           }
            // This part is broken off after the part is printed.   
            translate([0,0,40]) cylinder(d=30,h=1,center=true);
       } 
       difference()
       {
           translate([0,0,-14]) cube(5,center=true);
       } 
       // This hole through the length of this pendant ensures the resin drains out as it is printed. 
       cylinder(d=2,h=200,$fn=100,center=true);
    }
}

module KlaudiaHairPendantCap()
{
    difference()
    {
        intersection()
        {
            scale([1.3,1.3,1.3])PyramidPrimitive();
            translate([0,0,40]) cube([15,15,15],center=true);
        }
        PyramidPrimitive();        
        translate([0,0,43]) rotate([0,90,0]) cylinder(d=3,h=200,$fn=100,center=true);
        // This hole through the length of this pendant ensures the resin drains out as it is printed. 
        cylinder(d=2,h=200,$fn=100,center=true);
    }
}

//KlaudiaHairPendant();
//KlaudiaHairPendantCap();