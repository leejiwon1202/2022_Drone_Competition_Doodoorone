clear();

% 드론 객체 선언
droneObj = ryze();

% 이륙
takeoff(droneObj);
pause(3);

% 1. roll 제어 (왼쪽으로 1m만큼, 0.2m/s의 속도로 이동)
moveleft(droneObj, 'Distance', 1, 'Speed', 0.2);
pause(0.5);

% 2. yaw 제어 (45도 회전)
turn(droneObj, deg2rad(45));
pause(0.5);

% 3. pitch 제어 (앞으로 루트 2m만큼, 0.2m/s의 속도로 이동)
moveforward(droneObj, 'Distance', sqrt(2), 'Speed', 0.2);
pause(0.5);

% 4. yaw 제어 (135도 회전)
turn (droneObj, deg2rad(135));
pause(0.5);

% 5. pitch 제어 (앞으로 1m만큼, 0.2m/s의 속도로 이동)
moveforward(droneObj, 'Distance', 1, 'Speed', 0.2);
pause(0.5);

% 착륙
land(droneObj);