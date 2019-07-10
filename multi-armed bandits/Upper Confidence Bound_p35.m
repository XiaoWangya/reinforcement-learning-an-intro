clc;clear;
q_s = normrnd(0,1,[1,10])
N = 10000;%number of iteration
q_n = q_s;
q_m = q_s;
v = 1
c=2;
explore = 0.9
%% average sample
ac_reward = zeros(1,N);%calculate accumulated reward
action_value = zeros(1,10);%the estimated action value
q_value = zeros(1,10);%accumulated reward responding to each action
action_choose = zeros(1,10);
re_t = zeros(1,N);
for i = 1:N
    increment= normrnd(0,0.01,[1,10]);
    %q_n = q_n+increment;%nonstationary
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
    reward = normrnd(q_n(action),1);
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
    as(k) = sum(re_t(1:k))/k;%average reward
end
subplot(1,2,1)
plot(as,'k-')
hold on
%% UBC
ac_reward_sz = zeros(1,N);%calculate accumulated reward
action_value = zeros(1,10);%the estimated action value
q_value = zeros(1,10);%accumulated reward responding to each action
action_choose = zeros(1,10);
re_t = zeros(1,N);
for i = 1:N
    increment= normrnd(0,0.01,[1,10]);
    %q_m = q_m+increment;
    if rand <=explore
        if i<=10
            action = i;
        else
            action = find(max(up)==up);
        end
    else
        if i<=10
            action = i;
        else
            action = randi([1,10],1);
        end
    end
    action_choose(action)=action_choose(action)+1;
    reward = normrnd(q_m(action),1);
    re_t(i) = reward;%reward at time i    
    q_value(action)=q_value(action)+reward;
    action_value = q_value./action_choose;
    up = action_value+c*sqrt(log(i)./action_choose);
    if i>=2
        ac_reward_sz(1,i) = ac_reward_sz(1,i-1)+reward;
    else
        ac_reward_sz(1,i) = reward;
    end
end
for k = 1:N
    sz(k) = sum(re_t(1:k))/k;%average reward
end
plot(sz,'b-')
%% Plot
xlabel('step')
ylabel('average reward')
legend('average rewarde','UCB')
subplot(1,2,2)
plot(ac_reward,'-k');
hold on
plot(ac_reward_sz,'-b');
xlabel('step')
ylabel('accumulated reward')
legend('average rewarde','UCB')


