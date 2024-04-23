function complex_vector = make_complex_vector(a)
    % Combine real and imaginary parts to create complex vector
    complex_vector = complex(a(:,end-1), a(:,end));
end
