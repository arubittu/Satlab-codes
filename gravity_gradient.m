
% a fixed inertial frame is defined such that its origin is at the centre
% of the earth,
%and there is a body in space whose torque we need to find due to the gravity gradient of earths
%gravitational field
%it is assumed that the satellites orbit is in the plane of the x and z
%axes of inertial frame, hence y_com=0;

%constants
M_EARTH= 5.972e24;
G = 6.67408e-11;

U=M_EARTH*G; % mass of earth times gravitational constant

x_Com=input('x coordinate of centre of mass of body');
y_Com=0;
z_Com=input('z coordinate of centre of mass of body');

m_PositionCOM =[x_Com,y_Com,z_Com];


% values of moment of inertia about the respective axes of the body frame
% are to be entered.the body frame is centred at the centre of mass of the body. 

Ixx = input('enter moment of inertia about xx axis ');
Iyy = input('enter moment of inertia about yy axis ');
Izz = input('enter moment of inertia about zz axis ');
Ixy = input('enter moment of inertia about xy axis '); 
Iyz = input('enter moment of inertia about yz axis '); 
Ixz = input('enter moment of inertia about xz axis '); % asssuming these are inputs of body frame axes

m_Moment_of_inertia_body=[Ixx,-Ixy,-Ixz;-Ixy,Iyy,-Iyz;-Ixz,-Iyz,Izz]; % moi about com (body frame)


%finding moi about roated axes, body frame axes are rotated by x-y-z euler angle method (in the respective order) such that they are aligned with orbit frame at that point, 
%NOTE all rotations are assumed to be in the counter clockwise direction

Theta_x=input('angle rotated about x axis in radians');

Theta_y=input('angle rotated about y axis in radians');

theta_z=input('angle rotated about z axis in radians');

%rotation transformation matrix
m_rotation_transformation=[cos(Theta_y)*cos(theta_z),-cos(Theta_x)*sin(theta_z)+sin(Theta_x)*sin(Theta_y)*cos(theta_z),sin(Theta_x)*sin(theta_z)+cos(Theta_x)*sin(Theta_y)*cos(theta_z);cos(Theta_y)*sin(theta_z),cos(Theta_x)*cos(theta_z)+sin(Theta_x)*sin(Theta_y)*sin(theta_z),-sin(Theta_x)*cos(theta_z)+cos(Theta_x)*sin(Theta_y)*sin(theta_z);-sin(Theta_y),sin(Theta_x)*cos(Theta_y),cos(Theta_y)*cos(Theta_x)];


m_new_Moment_of_inertia= m_rotation_transformation*m_Moment_of_inertia_body*transpose(m_rotation_transformation);

m_PositionCOM_OF=[0,0,sqrt(dot(m_PositionCOM,m_PositionCOM))];% com position wrt frame where z axis points from center of earth to satellites com.

%torque about frame centred at earth and parallel to orbit frame.
v_Touque_OF= (3*U/(m_PositionCOM*m_PositionCOM')^2.5).*(cross(m_PositionCOM_OF,m_new_Moment_of_inertia*m_PositionCOM_OF'));

%angle between OF and IF
Theta_Rot_OF_to_IF=acos(z/sqrt(x_Com*x_Com+z_Com*z_Com));

%torque about Inertial frame
v_Touque_IF=[cos(Theta_Rot_OF_to_IF),0,sin(Theta_Rot_OF_to_IF);0,1,0;-sin(Theta_Rot_OF_to_IF),0,cos(Theta_Rot_OF_to_IF)]*v_Touque_OF';
%axis is rotated by the angle in clockwise direction/


