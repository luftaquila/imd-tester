// ============================================================
//  IMD Tester — integrated enclosure (flat top, no step)
//
//  3 printed parts:
//    shell     : top + walls, OPEN bottom (뚜껑 + 옆면)
//    baseplate : closes the bottom, fits inside the walls (바닥판)
//                4 corner M2 self-tap bolts (heads recessed) + 1 central LCR-support post
//    button    : captive LCR power-button plunger
//
//  Layout: LCR-ST1 in the +Y (back) half, screen up through the top window.
//  Pot + toggle on the top, -Y (front) strip, straddling the X-centre. Banana
//  jacks on the +Y (back) wall; a 2-socket banana-plug parking holder is
//  embedded in the -Y (front) face (bottom-right). Flat top (the pot's ~36 mm
//  body is swallowed by the box height — no step / tower).
//
//  Tweezer ARMS removed by the user, so the box length = LCR body + a small -X
//  wiring lead (measurement wires exit the LCR's -X end). The LCR is raised on
//  a baseplate post so its face seats on the bezel fence, 0.4 mm below the top
//  window; the captive power button is captured in a local panel counterbore.
//
//  Device frame: X = LCR length (+X = USB-C end), Y = width, Z = up.
//  VERIFY all dimensions against the real parts.
// ============================================================

/* [Part selection] */
part = "assembly"; // [shell, baseplate, button, assembly, preview, interference]

/* [LCR-ST1 body] */
lcr_len  = 60;
lcr_wid  = 27.8;
lcr_hi   = 19.2;
lcr_lead = 12;  // -X wiring lead room — trimmed so the screen centres in X

/* [Shell] */
wall      = 2.5;
top_th    = 2.5;
plate_th  = 3.0;
plate_fit = 0.3;

/* [Pot — LA42DWQ-22, top-mounted in the -Y strip] */
pot_depth   = 36;   // body behind the panel
pot_body_d  = 29;   // body diameter inside the box (안쪽, measured)
pot_knob_d  = 31;   // knob outer diameter above the panel (바깥, measured)
pot_clear   = 2;    // gap below the pot body
pot_hole_d  = 22.5; // panel bushing cutout
pot_notch_w = 3;    // anti-rotation notch
pot_notch_d = 1.5;
pot_pos     = [8, -18];  // [x, y] knob centre (balanced about X-centre 28, ±20)

/* [Toggle — MTS-203, top, -Y strip] */
tog_hole_d = 6.2;
tog_pos    = [48, -18]; // balanced about X-centre 28 (same 20 mm as the pot)

/* [Banana jacks — +Y (back) wall, below the LCR] */
jack_d     = 8;    // 7 mm passes, 10 mm flange stops (7 < Ø8 < 10)
jack_body_d = 11;  // jack body Ø inside the box (assumed) — drives support clearance
jack_pitch = 30;   // centre-to-centre
jack_depth = 20;   // jack housing depth inside the box (measured)
jack_xc    = 28;   // pair centre = housing X-centre (jacks symmetric L/R)
jack_z     = 10;   // below the LCR back (Z 18.4); jack body tucks under the LCR

/* [Banana-plug parking sockets — 2x, EMBEDDED in the -Y (front) face, bottom-right; insert +Y; grips the Ø9x12 rubber body] */
park_pin_d    = 4.0;    // contact-pin bore Ø
park_pin_len  = 18;     // contact-pin bore depth (metal pin = 18 mm)
park_grip_d   = 9.0;    // rubber-body bore Ø (per spec)
park_grip_len = 12;     // rubber-body grip length (per spec)
park_wall     = 2;      // material around the bores
park_xs       = [41, 54];// two socket X positions (side by side / horizontal), toward the right
park_z        = 7;       // socket height (low / bottom)

/* [LCR power button + captive plunger] */
pb_w_x = 4.5; pb_w_y = 6;
pb_cx  = lcr_len - 10 - pb_w_x / 2; // 47.75
pb_cy  = 5 + pb_w_y / 2;            // 8.0
pb_protrude = 0.5;
cb_flange_d = 8.0; cb_flange_h = 1.0;  // big flange: caught in the panel counterbore + presses the LCR button
cb_stem_d   = 4.6; cb_hole_d   = 5.0;
cb_cbore_d  = 8.4; cb_stem_out = 2.5;  // cbore thins panel over button; stem protrudes 2.5 mm above the top (was 1.5)

/* [LCR support post (single, centred, on the baseplate)] */
post_jack_clear = 1;  // clearance from each Ø11 jack body
// widest block that clears the two jack bodies: gap between bodies minus clearance
lcr_post_x = jack_pitch - jack_body_d - 2 * post_jack_clear;  // 17 (x 19.5..36.5)
lcr_post_y = 18;                                              // Y length of the support post

/* [Corner bolts — M2, square corner pillars] */
boss_r       = 3.5;  // pilot offset from the inner walls (= bolt hole position)
boss_sq      = 7;    // how far the square pillar reaches into the cavity
boss_pilot_d = 1.75; // M2 self-tap pilot
boss_pilot_h = 9;
m2_clear_d   = 2.4;
m2_head_d    = 4.0;
m2_head_h    = 2.0;

/* [LCR grips] */
grip_xR  = lcr_len - 13; // 47 (Y-grip stations on the long sides)
grip_xL  = 20;
grip_w   = 8;            // Y-grip width along X
grip_th  = 4;            // -Y grip rib thickness (Y) — strengthened from 2 mm (pot-limited)
xgrip_w  = 5;            // X-stop width (Y)
xstop_th = 5;            // X-stop thickness (X, butting the LCR end face)
xstop_squeeze = 0.8;     // -X stop bites this far past the LCR -X face (tighter grip)

/* [Screen window] (display 15..41 x 5.5..22.3); bezel shrinks the cutout 1.5 mm/side */
scr_x0 = 14.5; scr_x1 = 41.5;
scr_y0 = 5.5;  scr_y1 = 22.5;

/* [Display bezel fence] thin lip on the panel underside; the LCR face seats on it,
   levelling the meter against its proud (0.5 mm) power button */
fence_h = 0.4;  // protrusion below the panel underside (LCR sits 0.4 mm below the panel)
fence_w = 1.0;  // fence wall width around the window

/* [USB-C cutout, right wall] */
usb_w = 13; usb_h = 8; usb_r = 1.5; // rounded corners (W,H +1 each, centre kept)
usb_frame_w = 2.0;                  // +X stop border around the USB (wraps the port on all sides)

/* [Edge rounding] */
edge_r  = 2;   // fillet on all outer edges (top, vertical, and bottom -Z)

/* [Engraving — recessed (음각) labels on the top] */
engrave_depth = 0.5;
txt_formula   = "250 Ω / V";
txt_sw_a      = "SET";      // +Y toggle position
txt_sw_off    = "OFF";
txt_sw_b      = "TEST";     // -Y toggle position
txt_pwr       = "PWR";
formula_pos   = [8, -34];   // below the pot

/* [Rendering] */
$fn     = 64;
explode = 45;
eps     = 0.1;

// ---------- derived heights ----------
roof_z0 = pot_depth + pot_clear;   // 38   top-panel underside
roof_z1 = roof_z0 + top_th;        // 40.5 top
face_z  = roof_z0 - fence_h;       // LCR face seats on the bezel fence, 0.4 mm below the panel
post_h  = face_z - lcr_hi;         // 18.4 LCR rests on the baseplate post at this Z

cb_flange_z0 = face_z + pb_protrude;          // flange bottom = LCR-button contact level (starts at the very bottom)
cb_flange_z1 = cb_flange_z0 + cb_flange_h;    // counterbore shoulder height
cb_stem_z1   = roof_z1 + cb_stem_out;

usb_cy = lcr_wid / 2;       // width-centred
usb_z  = post_h + 11;       // 11 mm above the device back

// ---------- interior / outer ----------
cav_x0 = -lcr_lead;         // -12 (no tweezers; just wiring lead room)
cav_x1 = lcr_len + 8;       // 68 (USB-C wall pad)
cav_y0 = -36;               // front strip (pot/toggle); fits the Ø29 pot body
cav_y1 = lcr_wid + 2;       // 29.8 back

out_x0 = cav_x0 - wall; out_x1 = cav_x1 + wall;
out_y0 = cav_y0 - wall; out_y1 = cav_y1 + wall;
out_z0 = -plate_th;

// corner bolts (box corners, clear of the LCR)
boss = [
    [cav_x0 + boss_r, cav_y0 + boss_r],
    [cav_x1 - boss_r, cav_y0 + boss_r],
    [cav_x0 + boss_r, cav_y1 - boss_r],
    [cav_x1 - boss_r, cav_y1 - boss_r],
];

// ---------- shell ----------

module rounded_outer() { // box with ALL edges rounded (top, vertical, and bottom -Z)
    r = edge_r;
    hull() for (x = [out_x0 + r, out_x1 - r], y = [out_y0 + r, out_y1 - r]) {
        translate([x, y, roof_z1 - r]) sphere(r = r);  // top corners
        translate([x, y, out_z0 + r]) sphere(r = r);   // bottom corners (rounded -Z)
    }
}

module engrave(str, pos, sz) { // recessed text on the top surface
    translate([pos[0], pos[1], roof_z1 - engrave_depth])
        linear_extrude(engrave_depth + 1)
            text(str, size = sz, halign = "center", valign = "center",
                 font = "Liberation Sans:style=Bold");
}

module grip(xc, side) { // Y-grip: rib hugging a LONG side of the LCR
    th    = (side < 0) ? grip_th : cav_y1 - lcr_wid; // -Y: thick rib; +Y: fills LCR↔wall gap (wall-backed)
    yEdge = (side < 0) ? 0 : lcr_wid;
    ribY  = (side < 0) ? yEdge - th : yEdge;
    translate([xc - grip_w / 2, ribY, post_h])
        cube([grip_w, th, roof_z0 - post_h]);
}

module grip_x(side, z0, z1, w) { // X-stop against a short end face (width centre)
    if (side < 0)  // -X: fin hung from the top panel, butts the LCR -X end (xstop_th thick)
        translate([-xstop_th, lcr_wid / 2 - w / 2, z0]) cube([xstop_th + xstop_squeeze, w, z1 - z0]);
    else           // +X: rib bridging the right wall to the LCR +X end
        translate([lcr_len, lcr_wid / 2 - w / 2, z0]) cube([cav_x1 - lcr_len, w, z1 - z0]);
}

module corner_bosses() { // SQUARE bolt pillars filling the wall corners (one piece with the case)
    cxm = (cav_x0 + cav_x1) / 2;
    cym = (cav_y0 + cav_y1) / 2;
    for (b = boss) {
        ox  = (b[0] < cxm) ? out_x0 : out_x1;
        cc  = (b[0] < cxm) ? cav_x0 : cav_x1;
        // +X/+Y boss reaches all the way to the LCR end (flush with the USB stop frame); others use boss_sq
        inx = (b[0] < cxm) ? cc + boss_sq : ((b[1] > cym) ? lcr_len : cc - boss_sq);
        oy  = (b[1] < cym) ? out_y0 : out_y1;
        cd  = (b[1] < cym) ? cav_y0 : cav_y1;
        iny = (b[1] < cym) ? cd + boss_sq : cd - boss_sq;
        difference() {
            intersection() {
                translate([min(ox, inx), min(oy, iny), 0])
                    cube([abs(inx - ox), abs(iny - oy), roof_z0]);
                rounded_outer();   // trim the boss to the rounded shell (no pointy corner)
            }
            translate([b[0], b[1], -1]) cylinder(h = boss_pilot_h + 1, d = boss_pilot_d);
        }
    }
}

module usb_cut() {       // USB-C opening, spanning the +X wall and the stop frame
    hull() for (dy = [-1, 1], dz = [-1, 1])
        translate([lcr_len - 1, usb_cy + dy * (usb_w / 2 - usb_r),
                   usb_z + dz * (usb_h / 2 - usb_r)])
            rotate([0, 90, 0]) cylinder(h = cav_x1 + wall + 2 - (lcr_len - 1), r = usb_r);
}

module xstop_usb_frame() { // +X stop: plate wrapping the USB, extended in +Y to merge into the +X/+Y corner boss (one piece)
    y0 = usb_cy - usb_w / 2 - usb_frame_w;       // -Y border kept; +Y side runs to the back wall / corner boss
    difference() {
        translate([lcr_len, y0, post_h])
            cube([cav_x1 - lcr_len, cav_y1 - y0, roof_z0 - post_h]);
        usb_cut();
    }
}

module bezel_fence() {   // thin lip around the display window (panel underside); LCR seats on it
    difference() {
        translate([scr_x0 - fence_w, scr_y0 - fence_w, roof_z0 - fence_h])
            cube([scr_x1 - scr_x0 + 2 * fence_w, scr_y1 - scr_y0 + 2 * fence_w, fence_h]);
        translate([scr_x0, scr_y0, roof_z0 - fence_h - 1])
            cube([scr_x1 - scr_x0, scr_y1 - scr_y0, fence_h + 2]);
    }
}

park_total  = park_grip_len + park_pin_len;              // full socket depth (30)
park_blk_x0 = park_xs[0] - park_grip_d / 2 - park_wall;  // holder block -X
park_blk_x1 = park_xs[1] + park_grip_d / 2 + park_wall;  // holder block +X
park_blk_y1 = out_y0 + park_total + park_wall;           // holder block back (blind end + wall)
park_blk_z1 = park_z + park_grip_d / 2 + park_wall;      // holder block top

module park_bores() {    // 2 stepped Y-axis bores into the -Y face, side by side: Ø9 rubber grip + Ø4 contact (deeper, +Y)
    for (x = park_xs) {
        translate([x, out_y0 - 1, park_z]) rotate([-90, 0, 0])
            cylinder(h = park_grip_len + 1, d = park_grip_d);                 // rubber body (front opening)
        translate([x, out_y0 + park_grip_len, park_z]) rotate([-90, 0, 0])
            cylinder(h = park_pin_len, d = park_pin_d);                       // contact pin (deeper)
    }
}

module embedded_holder() { // solid block in the front strip (bottom-right) holding the 2 bores; internal, no external protrusion
    difference() {
        translate([park_blk_x0, out_y0, 0])
            cube([park_blk_x1 - park_blk_x0, park_blk_y1 - out_y0, park_blk_z1]);
        park_bores();
    }
}

module shell() {
    difference() {
        rounded_outer();                                                     // outer solid (all edges rounded)
        translate([cav_x0, cav_y0, out_z0 - 1])                              // hollow, open bottom
            cube([cav_x1 - cav_x0, cav_y1 - cav_y0, roof_z0 - out_z0 + 1]);
        translate([scr_x0, scr_y0, roof_z0 - 1])                             // screen window
            cube([scr_x1 - scr_x0, scr_y1 - scr_y0, top_th + 2]);
        translate([pb_cx, pb_cy, roof_z0 - eps])                             // captive-button counterbore
            cylinder(h = cb_flange_z1 - roof_z0 + eps, d = cb_cbore_d);
        translate([pb_cx, pb_cy, cb_flange_z1])                              // small top hole
            cylinder(h = roof_z1 - cb_flange_z1 + 1, d = cb_hole_d);
        translate([pot_pos[0], pot_pos[1], roof_z0 - 1]) {                   // pot hole + notch
            cylinder(h = top_th + 2, d = pot_hole_d);
            translate([-pot_notch_w / 2, pot_hole_d / 2 - eps, 0])
                cube([pot_notch_w, pot_notch_d + eps, top_th + 2]);
        }
        translate([tog_pos[0], tog_pos[1], roof_z0 - 1])                     // toggle hole
            cylinder(h = top_th + 2, d = tog_hole_d);
        for (dx = [-jack_pitch / 2, jack_pitch / 2])                         // banana jacks (+Y back wall)
            translate([jack_xc + dx, out_y1 + 1, jack_z])
                rotate([90, 0, 0]) cylinder(h = wall + 2, d = jack_d);
        usb_cut();                                                           // USB-C (through the +X wall and the stop frame)
        park_bores();                                                        // 2 banana-plug parking bores (open the front face)
        // top-panel engraved labels removed (per request)
    }
    grip(grip_xL, -1); grip(grip_xL, +1);   // Y-grips (long sides)
    grip(grip_xR, -1); grip(grip_xR, +1);
    grip_x(-1, post_h, roof_z0, xgrip_w);                // -X stop (full height, 5 mm thick)
    xstop_usb_frame();                                   // +X stop: full plate wrapping the USB on all 4 sides
    corner_bosses();                         // bolt bosses, merged into the wall corners
    bezel_fence();                           // display-window lip (LCR seats on it, levels the meter)
    embedded_holder();                       // 2 parking sockets embedded in the front face (bottom-right)
}

// ---------- baseplate (with LCR-support post) ----------

module baseplate() {
    difference() {
        translate([cav_x0 + plate_fit, cav_y0 + plate_fit, -plate_th])
            cube([cav_x1 - cav_x0 - 2 * plate_fit,
                  cav_y1 - cav_y0 - 2 * plate_fit, plate_th]);
        for (b = boss)
            translate([b[0], b[1], 0]) {
                translate([0, 0, -plate_th - 1]) cylinder(h = plate_th + 2, d = m2_clear_d);
                translate([0, 0, -plate_th - eps]) cylinder(h = m2_head_h, d = m2_head_d);
            }
    }
    // single central LCR-support post, centred between the two jacks (no notch needed)
    translate([jack_xc - lcr_post_x / 2, lcr_wid / 2 - lcr_post_y / 2, 0])
        cube([lcr_post_x, lcr_post_y, post_h]);
}

// ---------- captive button ----------

module button() {
    translate([pb_cx, pb_cy, 0]) {
        translate([0, 0, cb_flange_z0]) cylinder(h = cb_flange_h, d = cb_flange_d); // big flange from the bottom (presses LCR button; caught by housing)
        translate([0, 0, cb_flange_z1]) cylinder(h = cb_stem_z1 - cb_flange_z1, d = cb_stem_d); // press stem
    }
}

// ---------- ghosts (preview only) ----------

module lcr_ghost() {
    %translate([0, 0, post_h]) union() {
        cube([lcr_len, lcr_wid, lcr_hi]);
        translate([pb_cx - pb_w_x / 2, pb_cy - pb_w_y / 2, lcr_hi])
            cube([pb_w_x, pb_w_y, pb_protrude]);
    }
}

module pot_ghost() {
    %translate([pot_pos[0], pot_pos[1], 0]) {
        cylinder(h = roof_z0, d = pot_body_d);
        translate([0, 0, roof_z1]) cylinder(h = 12, d = pot_knob_d);
    }
}

// ---------- interference check ----------
// Volumes that must NOT be occupied by printed material. LCR is shrunk 0.3 mm
// because grips/posts/panel intentionally touch its faces; everything else true size.
chk = "all"; // [all, pot, tog, jack, lcr]
module keepclear() {
    if (chk == "all" || chk == "pot") {
        translate([pot_pos[0], pot_pos[1], 0]) cylinder(h = roof_z0, d = pot_body_d);
        translate([pot_pos[0], pot_pos[1], roof_z1]) cylinder(h = 12, d = pot_knob_d);
    }
    if (chk == "all" || chk == "tog")
        translate([tog_pos[0] - 6.5, tog_pos[1] - 6.5, roof_z0 - 13]) cube([13, 13, 13]);
    if (chk == "all" || chk == "jack")
        for (dx = [-jack_pitch / 2, jack_pitch / 2])
            translate([jack_xc + dx, cav_y1, jack_z]) rotate([90, 0, 0]) cylinder(h = jack_depth, d = jack_body_d);
    if (chk == "all" || chk == "lcr")
        translate([0.3, 0.3, post_h + 0.3]) cube([lcr_len - 0.6, lcr_wid - 0.6, lcr_hi - 0.6]);
}

// ---------- output ----------

if (part == "interference") {
    intersection() { union() { shell(); baseplate(); } keepclear(); }
} else if (part == "shell") {
    shell();
} else if (part == "baseplate") {
    baseplate();
} else if (part == "button") {
    button();
} else if (part == "assembly") {
    shell();
    color("lightgray") translate([0, 0, -explode]) baseplate();
    color("orange")    translate([0, 0,  explode]) button();
} else { // preview
    shell();
    color("lightgray") baseplate();
    color("orange")    button();
    lcr_ghost();
    pot_ghost();
}
