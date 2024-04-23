clear all
file_paths = {'lambda=0.2.csv', 'lambda=0.4.csv', 'lambda=0.6.csv', 'lambda=1.0.csv'};
data = [];
for file_index = 1:numel(file_paths)
    % Read the data from the current file
    data = csvread(['C:\Users\middl\Documents\CST\two_decoupled_loops\1cm_lambdas\' file_paths{file_index}], 1, 3);
    if file_index == 1
        Bx02 = [data(:,1)+15  data(:,2)  data(:,3) data(:,4)]; % the +15 part is just for centering the plots at zero
        By02 = [data(:,1)+15  data(:,2)  data(:,5) data(:,6)];
        Bz02 = [data(:,1)+15  data(:,2)  data(:,7) data(:,8)];
        Bx02 = sortrows(Bx02, [1,2]);
        By02 = sortrows(By02, [1,2]);
        Bz02 = sortrows(Bz02, [1,2]);

        Bx02fcomp = make_complex_vector(Bx02); 
        By02fcomp = make_complex_vector(By02);
        Bz02fcomp = make_complex_vector(Bz02);

    elseif file_index == 2
        Bx04 = [data(:,1)+15  data(:,2)  data(:,3) data(:,4)];
        By04 = [data(:,1)+15  data(:,2)  data(:,5) data(:,6)];
        Bz04 = [data(:,1)+15  data(:,2)  data(:,7) data(:,8)];
        Bx04 = sortrows(Bx04, [1,2]);
        By04 = sortrows(By04, [1,2]);
        Bz04 = sortrows(Bz04, [1,2]);


        Bx04fcomp = make_complex_vector(Bx04);
        By04fcomp = make_complex_vector(By04);
        Bz04fcomp = make_complex_vector(Bz04);

        

    elseif file_index == 3
        Bx06 = [data(:,1)+15  data(:,2)  data(:,3) data(:,4)];
        By06 = [data(:,1)+15  data(:,2)  data(:,5) data(:,6)];
        Bz06 = [data(:,1)+15  data(:,2)  data(:,7) data(:,8)];
        Bx06 = sortrows(Bx06, [1,2]);
        By06 = sortrows(By06, [1,2]);
        Bz06 = sortrows(Bz06, [1,2]);

        Bx06fcomp = make_complex_vector(Bx06);
        By06fcomp = make_complex_vector(By06);
        Bz06fcomp = make_complex_vector(Bz06);


    elseif file_index == 4
        Bx1 = [data(:,1)+20+15  data(:,2)  data(:,3) data(:,4)];
        By1 = [data(:,1)+20+15  data(:,2)  data(:,5) data(:,6)];
        Bz1 = [data(:,1)+20+15  data(:,2)  data(:,7) data(:,8)];

        Bx1 = sortrows(Bx1, [1,2]);
        By1 = sortrows(By1, [1,2]);
        Bz1 = sortrows(Bz1, [1,2]);


        Bx1fcomp = make_complex_vector(Bx1);
        By1fcomp = make_complex_vector(By1);
        Bz1fcomp = make_complex_vector(Bz1);
        
    end
end

cook_data.lambda02.x = Bx02(:,1); %struct object containing ALL the data
cook_data.lambda02.y = Bx02(:,2);
cook_data.lambda02.z = Bx02fcomp;
cook_data.lambda02.z2 = By02fcomp;
cook_data.lambda02.z3 = Bz02fcomp;


cook_data.lambda04.x = Bx04(:,1);
cook_data.lambda04.y = Bx04(:,2);
cook_data.lambda04.z = Bx04fcomp;
cook_data.lambda04.z2 = By04fcomp;
cook_data.lambda04.z3 = Bz04fcomp;

cook_data.lambda06.x = Bx06(:,1);
cook_data.lambda06.y = Bx06(:,2);
cook_data.lambda06.z = Bx06fcomp;
cook_data.lambda06.z2 = By06fcomp;
cook_data.lambda06.z3 = Bz06fcomp;

cook_data.lambda1.x = Bx1(:,1);
cook_data.lambda1.y = Bx1(:,2);
cook_data.lambda1.z = Bx1fcomp;
cook_data.lambda1.z2 = By1fcomp;
cook_data.lambda1.z3 = Bz1fcomp;


figure
hold on
showme2(cook_data, '02', 'profile')
showme2(cook_data, '04', 'profile')
showme2(cook_data, '06', 'profile')
showme2(cook_data, '1', 'profile')
legend('\lambda = 0.2','\lambda = 0.4','\lambda = 0.6','\lambda = 1')


