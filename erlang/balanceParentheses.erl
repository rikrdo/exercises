%%%-------------------------------------------------------------------
%%% @author Richard
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. nov 2016 00:07
%%%-------------------------------------------------------------------
-module(balanceParentheses).
-author("Richard").

%% API
-export([run/1]).

run(TestString)->
	{analize(TestString,[]),TestString}.

analize([],[]) ->
	true
;
analize([],_) ->
	false
;
analize([H|Tail],Evaluate) ->
				if
					(H==40) or (H==60) or (H==91) or (H==123) ->
						analize(Tail,[H|Evaluate]);
					H==41 ->
						checkOpen(Evaluate,Tail,40);
					H==62 ->
						checkOpen(Evaluate,Tail,60);
					H==93 ->
						checkOpen(Evaluate,Tail,91);
					H==125 ->
						checkOpen(Evaluate,Tail,123);
					true ->
						analize(Tail,Evaluate)
				end.

checkOpen(Evaluate,Tail,Open)->
	if
		Evaluate==[] ->
			false;
		true->
			case head(Evaluate) of
				Open ->
					analize(Tail,(tl(Evaluate)));
				_ ->
					false
			end
	end.

head([H|_])	->	H.


