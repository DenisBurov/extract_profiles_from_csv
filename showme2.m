function plott = showme2(data, lambda, mode)
fieldName = ['lambda' num2str(lambda)];
AbsZ = real(data.(fieldName).z2);% + data.(fieldName).z2 + data.(fieldName).z3); %choose components
xUnique = unique(data.(fieldName).x);
yUnique = unique(data.(fieldName).y);
X = reshape(data.(fieldName).x, length(yUnique), length(xUnique));
Y = reshape(data.(fieldName).y, length(yUnique), length(xUnique));
AbsZ = reshape(AbsZ, length(yUnique), length(xUnique));
if strcmp(mode, 'surf') %use as an argument "mode" if you want a surf plot
    figure
    surf(X, Y, (AbsZ));
    xlabel('x');
    ylabel('y');
    zlabel('B, T');
    title(['\lambda = ' num2str(lambda)]);
elseif strcmp(mode, 'profile') %use as an argument "mode" if you want a profile plot
    % prompt = 'Select slice y = [0, 100]: ';
    y_fixed = 50 %select slice
    % figure
    % Find the row index that matches y_fixed
    [~, rowIndex] = min(abs(Y(:,1) - y_fixed));
    % Extract the profile from AbsZ
    z_profile = AbsZ(rowIndex, :);
    % Plot the profile
    plot(X(rowIndex, :)/10, z_profile./max(z_profile), LineWidth=2);
    grid on
    xlabel('X, cm');
    ylabel('Re[B_x], a.u.');
    % title(['Profile at Y = ', num2str(y_fixed)]);
end
end