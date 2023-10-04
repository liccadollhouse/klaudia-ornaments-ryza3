module PendantPrimitive()
{
   hull()
   { 
       linear_extrude(0.01)
       { 
           polygon(
             points=[ [10,10],[10*sqrt(2),0],[10,-10],[0,-10*sqrt(2)],
                      [-10,-10],[-10*sqrt(2),0],[-10,10],[0,10*sqrt(2)] ] // the 8 points at base
           );
       }
       translate([0,0,45]) cube(0.001,center=true);
   }   
}

module KlaudiaNeckPendant()
{
    difference()
    {
        
       union()
       {
           intersection()
           {
               union()
               {
                    PendantPrimitive();
                    scale([1,1,0.3]) mirror([0,0,1])PendantPrimitive();
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

module KlaudiaNeckPendantCap()
{
    difference()
    {
        intersection()
        {
            scale([1.15,1.15,1.15])PendantPrimitive();
            translate([0,0,40]) cube([15,15,15],center=true);
        }
        PendantPrimitive();        
        translate([0,0,43]) rotate([0,90,0]) cylinder(d=3,h=200,$fn=100,center=true);
        // This hole through the length of this pendant ensures the resin drains out as it is printed. 
        cylinder(d=2,h=200,$fn=100,center=true);
    }
}

//KlaudiaNeckPendant();
//KlaudiaNeckPendantCap();