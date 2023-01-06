///////////
// Parameters
$fn=$preview ? 64:64;	// facet number (level of detail preview : render)

///////////////////////////////////////////////////////////////////////////////
// Prevews

w=80;
h=1;
scale([w/4,w/4]) 
{
    color("black") tz(0) linear_extrude(height=h) black();
    color("white") tz(0) linear_extrude(height=h) white();
    color("blue") tz(0) linear_extrude(height=h) blue();
    color("red") tz(0) linear_extrude(height=h) red();
}

module blue()
{
    difference()
    {
        projection(cut=true) tz (.1) w88logo();
        masktop();
    }
}

module red()
{
    intersection()
    {
        projection(cut=true) tz (.1) w88logo();
        masktop();
    }
}

module white()
{
    difference()
    {
        offset(delta=.13) shield();
        projection(cut=true) tz (.1) w88logo();}
}

module black()
{
    difference()
    {
        offset(delta=.26) shield();
        offset(delta=.13) shield();

    }
}
module shield()
{
    projection(cut=true) tz (1) w88logo();
    
}

module masktop()
{
    for (m=[0,1]) mirror([m,0,0]) hull()
    {
        t([.55,.75]) circle(d=.1,$fn=4);
        t([0,1]) circle(d=.1,$fn=4);
        t([2,1.1]) circle(d=.1,$fn=4);
        t([2,2]) circle(d=.1,$fn=4);
        t([0,2]) circle(d=.1,$fn=4);
    }
}

// 10mm wide W88 logo
module w88logo()
{
	s=1;    //2.8;
	scale([s,s,2]) translate([-8.1,-2.1,-2.6 /*+.125*/])
	import("w88_logo.stl");
}

module w88logoSlice(height=.2)
{
	linear_extrude(height=height) projection(cut=true) w88logo();
}

module t(t) {translate(t) children();}
module tx(t) {translate([t,0,0]) children();}
module ty(t) {translate([0,t,0]) children();}
module tz(t) {translate([0,0,t]) children();}
module r(r) {rotate(r) children();}
module rx(r) {rotate([r,0,0]) children();}
module ry(r) {rotate([0,r,0]) children();}
module rz(r) {rotate([0,0,r]) children();}
module s(t) {scale(t) children();}
module sx(t) {scale([t,1,1]) children();}
module sy(t) {scale([1,t,1]) children();}
module sz(t) {scale([1,1,t]) children();}
module c(c) {color(c) children();}