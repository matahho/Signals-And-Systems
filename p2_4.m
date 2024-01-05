

function [alpha , beta] = p2_4(x, y)
        
    if length(x) ~= length(y)
        error('Input vectors x and y must have the same length.');
    end
    
    alpha = rand();
    beta = rand();

    learning_rate = 0.01;
    num_iterations = 100000;

    for iter = 1:num_iterations

        y_pred = alpha * x + beta;
        
        error = y_pred - y;
        

        alpha = alpha - learning_rate * (2 / length(x)) * sum(error .* x);
        beta = beta - learning_rate * (2 / length(x)) * sum(error);
        
        cost = sum(error.^2) / (2 * length(x));
        fprintf('Iteration %d: Cost = %f\n', iter, cost);
    end

    fprintf('Final Slope (m) = %f\n', alpha);
    fprintf('Final Intercept (b) = %f\n', beta);



end


