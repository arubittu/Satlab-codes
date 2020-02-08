% a fixed inertial frame is defined such that its origin is at the centre
% of the earth, orbit plane is assumed to be along x and z axis
%and there is a cubsat in space whose torque we need to find due to the aerodynamic drag of earths
% atmosphere

%v_R_G_COM is the vector from body's geometric centre to the centre of mass
%this vector is wrt to our inertial earth frame

m_COM=input('enter position vector of COM wrt inertial frame');
m_G_COM=input('enter position vector of geometrical center wrt inertial frame');

m_R_G_COM=m_COM-m_G_COM;


ATMOS_DENSITY=input('enter atmosperic density');

DRAG_COEFF=2; %is taken to be between 1.98 to 2.00 for plane surfaces going against flow of fluid.

v_velocity_sat=input('enter velocity vector as row matrix');%wrt to earth centered frame

%unit vectors of axis centered at geometrical centre of body wrt to earth centred inertial frame are to be entered
m_x_cap=input('enter x unit vector matrix');
m_y_cap=input('enter y unit vector matrix');
m_z_cap= cross(m_x_cap,m_y_cap);

%side dimensions of cubesat
SIDE_L1=input('lenght of side parralel to m_x_cap');
SIDE_L2=input('lenght of side parralel to m_y_cap');
SIDE_L3=input('lenght of side parralel to m_z_cap');

Touque_Drag=(0.5*ATMOS_DENSITY*DRAG_COEFF*dot(v_velocity_sat,v_velocity_sat)*(SIDE_L2*SIDE_L3*abs(dot(v_velocity_sat,m_x_cap))+SIDE_L1*SIDE_L3*abs(dot(v_velocity_sat,m_y_cap))+SIDE_L1*SIDE_L2*abs(dot(v_velocity_sat,m_z_cap))))*(cross(m_R_G_COM,v_velocity_sat));
%is the torque vector wrt inertial frame.
%units and modulus
