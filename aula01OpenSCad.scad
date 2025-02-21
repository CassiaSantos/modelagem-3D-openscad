/* FORMAS BÁSICAS: 
cube([3,7,8]);
circle(10);
sphere(10);
cylinder(h=15, r1=5, r2=2); 
cylinder(20, 9, center=true);
*/
 
 /* 
 //TRANLATE: 
translate([ 42,-42]) circle(20,$fn=100);
translate([-20, 0, 1]) sphere(10);
*/

/* RESOLUÇÃO: 
$fn=100;
*/

/* RESIZE: resize([x,y,z]) 
// resize the sphere to extend 30 in x, 60 in y, and 10 in the z directions.
resize(newsize=[30,60,10]) sphere(r=10); $fn=100;
*/


/* POLÍGONOS 2D
//polygon(points = [ [x, y], ... ], paths = [ [p1, p2, p3..], ...], convexity = N);
polygon(
    points = [[1,1], [1,3], [2,3], [3,4], [3,2], [4,2], [4,1]],
    paths = [[0,1,2,3,4,5,6]]);//ordem ds pares ordenados: indexes;
*/

/* POLIÉDRO - PIRÂMIDES (3D): 
polyhedron(
    points=[[0,0,0], [0,0,5], [5,0,5], [5,0,0], [3,10,3]],
    faces=[[0,1,2,3], [0,1,4], [1,2,4], [2,3,4], [0,3,4]]);
//faces: base, lateral 1, 2,3 e 4;
*/

/*DESAFIO: */
//circle(20);

/*MOVIMENTAÇÃO - TRANSLAÇÃO
translate([-40, -10, 10])
resize(newsize=[-9,0,0]) cube(18); */

/*MOVIMENTAÇÃO - ROTAÇÃO
rotate([45, 50, 60])
cube([10, 5, 8]); 

translate([30, 8, 10])
rotate([45, 0, 0])
cube([10, 5, 8]);

cube(10);
translate([40,0,0])
cube(10); */

/*ESCALA:
scale([0.5,2,2])
cylinder(20, 15, 0); */

/*VARIÁVEIS - APENAS TIPO NUMÉRICO: 
raio=3;
movimentoX=10;
translate([movimentoX-5, 0, 0])
sphere(raio+10); */

/*Forma textual
text("Cássia Santos");
translate(0, 0, -10)
text("Desenvolvedora Full-stack");*/

/*MODULO: 
module meu_modulo(){
    text("Cássia Santos", size=4);
};

meu_modulo();*/

/* ======================= Desafio: CASTELO =======================*/
//lateral 1:
cylinder(25, 5, 5);
translate([0,0,25])
cylinder(15, 8, 0);
cube([100, 5, 20]);

translate([100,0,0])
cylinder(25, 5, 5);

translate([100,0,25])
cylinder(15, 8, 0);

//lateral 2:
cube([5, 100, 20]);
translate([0,100,0])
cylinder(25, 5, 5);

translate([0,100,25])
cylinder(15, 8, 0);

//lateral 3:
translate([100,0,0])
cube([5, 100, 20]);
translate([100,100,0])
cylinder(25, 5, 5);

translate([100,100,25])
cylinder(15, 8, 0);

//lateral 4:
//rotate(180)
translate([0,100,0])
cube([100, 5, 20]);

//chão:
cube([100,100,1]);

//Cubos no muro:
module cuboMuro(){
    cube(5);
};

translate([0, 05, 20])
cuboMuro();

translate([0, 15, 20])
cuboMuro();

translate([0, 26, 20])
cuboMuro();

translate([0, 37, 20])
cuboMuro();

translate([0, 48, 20])
cuboMuro();

translate([0, 59, 20])
cuboMuro();

translate([0, 70, 20])
cuboMuro();

translate([0, 80, 20])
cuboMuro();

translate([0, 90, 20])
cuboMuro();

//outro lado dos quadrados no muro:
translate([05, 0, 20])
cuboMuro();
translate([15, 0, 20])
cuboMuro();
translate([26, 0, 20])
cuboMuro();
translate([37, 0, 20])
cuboMuro();
translate([37, 0, 20])
cuboMuro();
translate([48, 0, 20])
cuboMuro();
translate([59, 0, 20])
cuboMuro();
translate([70, 0, 20])
cuboMuro();
translate([80, 0, 20])
cuboMuro();
translate([90, 0, 20])
cuboMuro();

//outro lado dos quadrados no muro:
translate([5, 100, 20])
cuboMuro();
translate([15, 100, 20])
cuboMuro();
translate([26, 100, 20])
cuboMuro();
translate([37, 100, 20])
cuboMuro();
translate([37, 100, 20])
cuboMuro();
translate([48, 100, 20])
cuboMuro();
translate([59, 100, 20])
cuboMuro();
translate([70, 100, 20])
cuboMuro();
translate([80, 100, 20])
cuboMuro();
translate([90, 100, 20])
cuboMuro();

//outro lado dos quadrados no muro:
translate([100, 5, 20])
cuboMuro();
translate([100, 16, 20])
cuboMuro();
translate([100, 26, 20])
cuboMuro();
translate([100, 37, 20])
cuboMuro();
translate([100, 47, 20])
cuboMuro();
translate([100, 58, 20])
cuboMuro();
translate([100, 68, 20])
cuboMuro();
translate([100, 79, 20])
cuboMuro();
translate([100, 89, 20])
cuboMuro();