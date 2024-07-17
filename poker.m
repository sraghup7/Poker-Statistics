prompt = "How many iterations? "; 
N = input(prompt) 
%Number of iterations.
cards=0:19;%array of numbers from 0 to 19
rank=rem(cards,5);%rank array consist of 4 sets of {0,1,2,3,4}
% rank array is equivalent to a set of 4x5 deck.
one_pairs = 0;%initialize number of one pairs
two_pairs = 0;%initialize number of two pairs
three_of_a_kinds = 0;%initialize number of three of a kind
four_of_a_kinds = 0;%initialize number of four of a kind 
tic 
parfor j=1:1:N %initialing loop. parfor uses parallel computing for quick 
simulation time.
 shuffled_deck=rank(randperm(length(rank)));% shuffling the deck of cards
 hand=shuffled_deck(1:5);%selecting first 5 cards of this random deck
 L=histcounts(hand);%frequency of numbers in the hand
 max_freq=0; 
 max_freq=max(L)%The maximum of L array
 C=unique(hand);%array consisting of all unique elements of the hand
 m=length(C);%number of unique elements in "hand" array
 if (m==4 && max_freq==2) %testing for one pair
one_pairs = one_pairs+1; 
continue
 end
 if(m==3 && max_freq==2)%testing for two pair
 two_pairs = two_pairs+1; 
 continue
 end
 if(max_freq==3 && m==3)%testing for Three of a kind
 three_of_a_kinds = three_of_a_kinds+1; 
 continue
 end
 if (max_freq==4)%testing for Four of a kind
 four_of_a_kinds =four_of_a_kinds+1; 
 continue
 end
end 
X = [‘the runtime is’,num2str(toc),’ seconds’] 
Prob_4_kind= four_of_a_kinds/N; 
fprintf('Probability of 4 of a kind is %f.\n',Prob_4_kind); 
Prob_3_kind= three_of_a_kinds/N; 
fprintf('Probability of 3 of a kind is %f.\n',Prob_3_kind); 
Prob_2pair= two_pairs/N; 
fprintf('Probability of two pair is %f.\n',Prob_2pair); 
Prob_1pair= one_pairs/N; 
fprintf('Probability of one pair is %f.\n',Prob_1pair); 
disp(X)