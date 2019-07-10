clc;clear;
q_s = normrnd(0,1,[1,10])
N = 10000;%number of iteration
for j = 0:10
    explore = j/10%explore rate from 0 to 1
    ac_reward = zeros(1,N);%calculate accumulated reward
    action_value = zeros(1,10);%the estimated action value
    q_value = zeros(1,10);%accumulated reward responding to each action
    action_choose = zeros(1,10);
    re_t = zeros(1,N);
    for i = 1:N
        if rand <=explore
            if i<=10
                action = i;
            else
                action = find(max(action_value)==action_value);
            end
        else
            if i<=10
                action = i;
            else
                action = randi([1,10],1);
            end
        end
        action_choose(action)=action_choose(action)+1;
        reward = normrnd(q_s(action),1);
        re_t(i) = reward;%reward at time i
        q_value(action)=q_value(action)+reward;
        action_value = q_value./action_choose;
        if i>=2
            ac_reward(1,i) = ac_reward(1,i-1)+reward;
        else
            ac_reward(1,i) = reward;
        end
    end
    for k = 1:N
        kk(k) = sum(re_t(1:k))/k;%average reward
    end
    plot(kk)
    hold on
end


legend('0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0')

