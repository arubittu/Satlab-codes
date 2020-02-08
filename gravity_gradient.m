
% a fixed inertial frame is defined such that its origin is at the centre
% of the earth,
%and there is a body in space whose torque we need to find due to the gravity gradient of earths
%gravitational field

M_EARTH= 5.972e24;
G = 6.67408e-11;

U=M_EARTH*G; % mass of earth times gravitational constant

x_Com=input('x coordinate of centre of mass of body');
y_Com=input('y coordinate of centre of mass of body');
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


%finding moi about roated axes, body frame axes are rotated by x-y-z euler angle method (in the respective order) such that they are parralel to the respective fixed earth centred axes, 
%NOTE all rotations are assumed to be in the counter clockwise direction

Theta_x=input('angle rotated about x axis in radians');

Theta_y=input('angle rotated about y axis in radians');

theta_z=input('angle rotated about z axis in radians');

%rotation transformation matrix
m_rotation_transformation=[cos(Theta_y)*cos(theta_z),-cos(Theta_x)*sin(theta_z)+sin(Theta_x)*sin(Theta_y)*cos(theta_z),sin(Theta_x)*sin(theta_z)+cos(Theta_x)*sin(Theta_y)*cos(theta_z);cos(Theta_y)*sin(theta_z),cos(Theta_x)*cos(theta_z)+sin(Theta_x)*sin(Theta_y)*sin(theta_z),-sin(Theta_x)*cos(theta_z)+cos(Theta_x)*sin(Theta_y)*sin(theta_z);-sin(Theta_y),sin(Theta_x)*cos(Theta_y),cos(Theta_y)*cos(Theta_x)];


m_new_Moment_of_inertia= m_rotation_transformation*m_Moment_of_inertia_body*transpose(m_rotation_transformation);


Touque= (3*U/(m_PositionCOM*m_PositionCOM')^2.5).*(cross(m_PositionCOM,m_new_Moment_of_inertia*m_PositionCOM'));




