//42 RU twinrack 80x120x200
//Rack Dimension Variables
NumRackUnits=42;
RackRackUnitDepth=900;
RackWidth=800;
RackDepth=1200;
RackHeight=2000;

//first Rail mount hole offset from floor (normally one RU is enough for visuals Exact amount can also be entered)
RailHeightOffset=StandardRackUnitHeight;

// Generate DC Floor (each tile is 600x600 unless otherwise specified in the main modules)
useRaisedFloorYN="true";
DCfloor(4,4,FloorColor,RaisedFloorTransparency,RaisedFloorHeight,useRaisedFloorYN);

// Define Positions on DC Floor
RowOffset0=[400,600,0];
Rack1=[RackWidth*0,0,0]+RowOffset0;
Rack2=[RackWidth*1,0,0]+RowOffset0;
//invisible rack for optional animation (pop out)
Rack1A=[RackWidth*0,-RackDepth*$t,0]+RowOffset0;
Rack2A=[RackWidth*1,-RackDepth*$t,0]+RowOffset0;
//invisible rack for optional animation (pop in)
Rack1B=[RackWidth*0,(RackDepth*($t))-RackDepth,0]+RowOffset0;
Rack2B=[RackWidth*0,(RackDepth*($t))-RackDepth,0]+RowOffset0;

// Title
//translate([0,-50,-100]) logo();
translate([350,-50,-100]) floatLabel(floorLevelTitle,FloatLabelColorTitle,60,LabelT);

// Don't modify these. Instead USE them in the section to generate the racks below
RackSidebarInfoON="true";
RackSidebarInfoOFF="false";

//Generate Racks
positionRack(Rack1,RackWidth,RackHeight,RackDepth,RackFrameThickness,RackColor,rackTopTitle1,RackSidebarInfoOFF);
positionRack(Rack2,RackWidth,RackHeight,RackDepth,RackFrameThickness,RackColor,rackTopTitle2,RackSidebarInfoON);

useAirFlowYN="true";

if (settings) {} else  {
	echo("trying to compile settings!");
	linear_extrude(height = 4) {
		text("trying to compile settings!");
		}
	}
