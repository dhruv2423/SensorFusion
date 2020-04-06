viewer = HelperOrientationViewer;
for i = 1:1000
    [accel,gyro,mag] = readSensorDataMPU9250(imu);
    mag_ave = mean(mag);
    mag_unit = mag_ave./norm(mag_ave);
    
    acc_ave = mean(accel);
    acc_unit = acc_ave./norm(acc_ave);
    
    D = -acc_unit;
    E = cross(D,mag_unit);
    E = E./norm(E);
    N = cross(E,D);
    N = N./norm(N);
    
    C = [N',E',D'];
    Q = quaternion(dcm2quat(C));
    viewer(Q);
    pause(.1)
end