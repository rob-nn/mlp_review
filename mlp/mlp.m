clear; close all; clc;
nn = create_NN(2, 6, 1, @sigmoid, @sigmoid_derivative, @sigmoid_cost_function);
t = create_training(nn, 0.001, 0.2, 2700, -1, -1);
pat = xor_pattern(nn.ni -1);

[nn, J, iteration] = train(nn, t, pat);

out = [];
for item = 1:size(pat,1)
		ao = feed_forward(nn, pat(item, 1:end-1));
		out = [out; ao];
end


out = [out, out > 0.5, pat(:, end)];
out = [out, out(:,end-1) == out(:,end)];

out
e = J(1,end)
iteration
figure();
plot(J);
