linear_extrude(height=15, scale=[1,0.01], slices=5, twist=80)

polygon(points=[[0,0], [20,10], [20, -10]]);

rotate_extrude(angle=360, convexity=10, $fn=200)
polygon(points=[[0,0], [2,1], [1, 2], [1,3], [3,4], [0,5]]);
//square(5);

variavel=15; //raio da roda;
module roda() {
    rotate_extrude(angle=360) {
        //Linha externa:
        translate([variavel, 0,0])
        square(2);
    }
    
    //Aros da roda:
    translate([0,0,1])
    for(i=[0:45:360]) {
        rotate([0,90,i])
        cylinder(variavel, .5,.5);
    }
}

roda();

//OPERAÇÕES BOLEANAS:
//union()
{square(10); circle(10);}

//difference()
{square(10); circle(10);}

//intersection()
{square(10); circle(10);}

//3D
union(){cube(12, center=true); sphere(8);}
difference(){cube(12, center=true); sphere(8);}
intersection(){cube(12, center=true); sphere(8);}
