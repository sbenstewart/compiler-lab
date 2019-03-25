%option noyywrap
%{
	
	#include <bits/stdc++.h>
	using namespace std;
	#define pb push_back 
	vector < pair<string,pair<string,string> > > a;
	string s,intt = "int",floatt = "float",chart = "char", doublet = "double",idt ="id"; 
%}
alpha [a-zA-Z]+
%s START
%s COPY
%s TRAVEL
%%
<INITIAL>"int "  	{s=intt;BEGIN START;}
<INITIAL>";"		{BEGIN INITIAL;}
<INITIAL>"float " 	{s=floatt;BEGIN START;}
<INITIAL>"char " 	{s=chart;BEGIN START;}
<INITIAL>"double " 	{s=doublet;BEGIN START;}
<INITIAL>"for"		{s="for";a.pb(make_pair("keyword",make_pair(s,"1000")));BEGIN INITIAL;}
<INITIAL>"while"	{s="while";a.pb(make_pair("keyword",make_pair(s,"1000")));BEGIN INITIAL;}
<START>","		{BEGIN START;}
<START>";"		{BEGIN INITIAL;}
<START>{alpha}	{a.pb(make_pair(idt,make_pair(yytext,s)));BEGIN START;}

%%
int main()
{
	yylex();
	for(int x=0;x<a.size();x++)
		cout<<a[x].first<<" "<<a[x].second.first<<" "<<a[x].second.second<<"\n";
	return 0;
}
