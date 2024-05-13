mcHolesX = [-12,12];                //  master cylinder x hole centres
mcHolesY = [-0,40];                 //  master cylinder y hole centres
fpHolesX = [-15,15];                //  faceplate cylinder x holes
fpHolesY = [-21,21];                //  faceplate cylinder x holes
dimX = concat(mcHolesX,fpHolesX);   //  for x dimensions
dimY = concat(mcHolesY,fpHolesY);   //  for y diminsions
w = 50;                             //  metal plate width
bhd = 5;                            //  bolt hole diameter

l = - (fpHolesY.x - mcHolesY.y) + 20;   //  metal plate length

echo(l);

difference(){
    translate([0,10]) offset(3) offset(-3) square([w,l],center=true);
    for(x=fpHolesX) for(y=fpHolesY){
        translate([x,y]) circle(bhd/2);
    }
    for(x=mcHolesX) for(y=mcHolesY){
        translate([x,y]) circle(bhd/2);
    }
}

color("black"){
    translate([0,14]) for(x=dimX){
        translate([x,0]) square([0.4,94],center=true);
        translate([x,47.5]) 
                rotate([0,0,45]) text(text=str(x,"mm"),size=2);
    }
    for(y=dimY){
        translate([0,y]) square([64,0.4],center=true);
        translate([33,y]) text(text=str(y,"mm"),size=2);
    }
    translate([-w/2,-36]) square([0.4,10],center=true);
    translate([w/2,-36]) square([0.4,10],center=true);
    translate([-w/2-0.2,-40]) 
        text(text=str("<-------------------- ",w," mm -------------------->"),
        size=2);
    translate([-w/2-7,l/2+10]) square([16,0.4],center=true);
    translate([-w/2-7,-l/2+10]) square([16,0.4],center=true);
    translate([-10-w/2,10-l/2]) rotate([0,0,90])
        text(text=str("<------------------------------------ ",l," mm ------------------------------------->"),
        size=2);
    translate([-74,-50]) 
        text(text=str("Giant Conduct Master Cylinder to Merocca Stem Adapter Plate"),
        size=4);
    translate([-58,-55]) 
        text(text=str("©2024, Crunchysteve, free & open source for non-commercial use"),
        size=3);
    translate([-54,-59]) 
        text(text=str("Holes for Giant Conduct are for M4 Screws, holes for your stem may be M5 Screws, #YMMV."),
        size=2);
    translate([-65,-63]) 
        text(text=str("Use spacers between stem faceplate and adapter plate that are just long enough for adapter to clear faceplate."),
        size=2);
}