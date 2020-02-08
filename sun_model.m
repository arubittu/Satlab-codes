%we will be finding the sun vector i.e. the vector pointing from earths
%center to the centre of the sun with respect to the Earth Centered
%Inertial Frame or (ECIF).

%We shall find this vector as a function of time(in days) which denotes the time
%difference between current time and the day of March equinox (20'th march)

%DESCRIPTION OF FRAMES IS MENTIONED BELOW;

%ECIF frame is defined such that the x axis points towards the vernal
%equinox, the z axis points from the centre of the earth to geographic
%north pole. and y axis is in  the direction of the cross product of the
%two axes.

%in Sun Trackig frame x axis always points from earths center to the sun and z axis is perpendicular to orbit plane

%in Earth Orbital frame x axis points towards vernal eqinox and z axis is
%perpendicular to orbital plane

 

ORBITAL_PERIOD=365.256363; % in days

Time=input('enter time difference between current time and march 20th in days ');

Theta_SF_EOF=2*pi*Time/ORBITAL_PERIOD;% angle between x axes of sun tracking frame and earth orbital frame

Theta_EOF_ECIF=deg2rad(23.45); %constant angle between earths equitorial plane and earths orbital plane


%unit vector from earths center to sun in ECIF frame
v_Sun_vector_ECIF=[cos(Theta),cos(Theta_EOF_ECIF)*sin(Theta_SF_EOF),sin(Theta_EOF_ECIF)*sin(Theta_SF_EOF)];