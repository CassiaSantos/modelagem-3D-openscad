///////////////////////////////////////////////////////
// DRONE ESTILO “MAVIC-LIKE” EM OPENSCAD
// (modelo simplificado e aproximado)
// Aluna: Cássia Santos
///////////////////////////////////////////////////////

// ----------- PARAMETROS GERAIS -----------
body_length = 70;       // comprimento do corpo
body_width = 35;        // largura do corpo
body_height = 20;       // altura do corpo

arm_length = 40;        // comprimento dos braços
arm_width = 8;          // largura dos braços
arm_height = 5;         // altura dos braços

motor_radius = 6;       // raio dos motores
motor_height = 6;       // altura dos motores

propeller_length = 25;  // comprimento da pá
propeller_width = 2;    // largura da pá
propeller_thickness = 1;// espessura da pá

landing_leg_height = 15;   // altura do "pé" de pouso
landing_leg_thickness = 3; // espessura do "pé" de pouso

camera_radius = 5;         // “tamanho” da lente/cilindro da câmera
camera_box = [10,10,6];    // caixa retangular em volta da câmera

// Para ajudar a visualizar melhor
$fn = 60;

// ----------- CORPO PRINCIPAL -----------
module drone_body() {
    // Vamos criar uma forma mais “aerodinâmica” usando hull() de dois retângulos
    // e um polígono para o topo. É apenas um truque simples de design.
    difference() {
        union() {
            // Parte inferior (retângulo extrudado)
            translate([0,0,-body_height/2])
            cube([body_length, body_width, body_height], center=true);
            
            // Parte superior (tentando criar uma leve curvatura)
            translate([-body_length/2, -body_width/2, body_height/2 - 2]) 
            linear_extrude(height=5, center=false, convexity=10)
            polygon(points=[
                [0,0],
                [body_length,0],
                [body_length*0.8, body_width],
                [body_length*0.2, body_width]
            ]);
        }
        // “Escavando” o interior para simular algo mais oco
        translate([0,0,-(body_height/2 -1)])
        cube([body_length-4, body_width-4, body_height-2], center=true);
    }
}

// ----------- BRAÇO COM MOTOR E HÉLICE -----------
module drone_arm(angle=0) {
    // Rotacionamos o braço num certo ângulo em relação ao corpo
    rotate([0,0,angle]) {
        // Mover para fora do corpo
        translate([body_length/2 - 5, 0, 0]) {
            // Criar o braço
            cube([arm_length, arm_width, arm_height], center=false);
            
            // Criar o motor
            translate([arm_length, arm_width/2, arm_height/2])
            cylinder(h = motor_height, r = motor_radius, center=true);

            // Criar as hélices
            translate([arm_length, arm_width/2, arm_height/2 + motor_height/2])
            propellers();
        }
    }
}

// ----------- HELICES -----------
module propellers() {
    // Duas pás em cruz, rotacionadas em 90 graus
    for (rot = [0,90]) {
        rotate([0,0,rot]) {
            translate([-propeller_length/2, 0, 0]) {
                cube([propeller_length, propeller_width, propeller_thickness], center=true);
            }
        }
    }
}

// ----------- PERNAS DE POUSO -----------
module landing_legs() {
    // Pernas dianteiras e traseiras (duplas)
    // Ajuste de posições para ficarem abaixo do corpo
    leg_offset_x = body_length/4;
    leg_offset_y = body_width/2 + 2;
    leg_width = 2;

    // Pernas frontais
    for (sign=[1,-1]) {
        translate([leg_offset_x, sign*leg_offset_y, -landing_leg_height]) {
            cube([leg_width, leg_width, landing_leg_height], center=false);
        }
    }

    // Pernas traseiras
    for (sign=[1,-1]) {
        translate([-leg_offset_x, sign*leg_offset_y, -landing_leg_height]) {
            cube([leg_width, leg_width, landing_leg_height], center=false);
        }
    }
}

// ----------- CAMERA FRONTAL -----------
module front_camera() {
    // Vamos criar uma pequena “caixa” frontal e uma lente
    translate([body_length/2 - 5, 0, -body_height/4]) {
        // Caixa protetora da câmera
        cube(camera_box, center=true);
        
        // Lente
        translate([camera_box[0]/2 + camera_radius/2, 0, 0])
        cylinder(h = camera_box[2], r = camera_radius, center=true);
    }
}

// ----------- MONTAGEM GERAL -----------
module drone_mavic_like() {
    // Corpo
    drone_body();

    // Braços (quatro, em ângulos específicos)
    // Ajustando a rotação para ficar em diagonal
    // Ex: 35° e 145° para a frente, 215° e 325° para trás (aproximado)
    drone_arm(35);
    drone_arm(145);
    drone_arm(215);
    drone_arm(325);

    // Pernas de pouso
    landing_legs();

    // Câmera frontal
    front_camera();
}

// Chamando o módulo principal
drone_mavic_like();
