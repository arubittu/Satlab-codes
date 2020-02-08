% a fixed inertial frame is defined such that its origin is at the centre
% of the earth, orbit plane is assumed to be along x and z axis
%and there is a cubsat in space whose torque we need to find due to the
%solar radiaton force.



%v_R_G_COM is the vector from body's geometric centre to the centre of mass
%this vector is wrt to our inertial earth frame

m_COM=input('enter position vector of COM wrt inertial frame');
m_G_COM=input('enter position vector of geometrical center wrt inertial frame');

m_R_G_COM=m_COM-m_G_COM;

v_Sun=input('enter sun vector as row matrix');%wrt to inettial frame

COEFF_REFLECTIVITY=input('enter coefficient of reflectivity');

SOLAR_RADIATION_PRESSURE=input('enter solar radiation pressure of the sun');

%unit vectors of axis centered at geometrical centre of body wrt to earth centred inertial frame are to be entered
m_x_cap=input('enter x unit vector in the form of a row matrix');
m_y_cap=input('enter y unit vector in the form of a row matrix');
m_z_cap= cross(m_x_cap,m_y_cap);

%side dimensions of cubesat
SIDE_L1=input('lenght of side parralel to m_x_cap');
SIDE_L2=input('lenght of side parralel to m_y_cap');
SIDE_L3=input('lenght of side parralel to m_z_cap');

%torque due to absorbed radiation: about inertial frame
Touque_Absorbed=(SOLAR_RADIATION_PRESSURE*(1-COEFF_REFLECTIVITY)*(SIDE_L2*SIDE_L3*abs(dot(v_Sun,m_x_cap))+SIDE_L1*SIDE_L3*abs(dot(v_Sun,m_y_cap))+SIDE_L1*SIDE_L2*abs(dot(v_Sun,m_z_cap))))*cross(m_R_G_COM,v_Sun);

%torque due to reflected radiation :about inertial frame
Touque_Reflected=2*COEFF_REFLECTIVITY*SOLAR_RADIATION_PRESSURE*cross(m_R_G_COM,(SIDE_L2*SIDE_L3*abs(dot(v_Sun,m_x_cap))*dot(v_Sun,m_x_cap)*m_x_cap+SIDE_L1*SIDE_L3*abs(dot(v_Sun,m_y_cap))*dot(v_Sun,m_y_cap)*m_y_cap+SIDE_L1*SIDE_L2*abs(dot(v_Sun,m_z_cap))*dot(v_Sun,m_z_cap)*m_z_cap));

%total radiation torque is sum of torques due to absorbed and reflected
%radiation;

Touque_total=Touque_Absorbed+Touque_Reflected;
%this is about inertial frame