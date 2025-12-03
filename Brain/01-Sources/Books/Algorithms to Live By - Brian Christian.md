# Algorithms to Live By - [[Brian Christian]] and [[Thomas Griffiths]]
## [[Optimal Stopping]]

When you are hiring, scouting houses to buy, options to consider — when should you stop looking?

To get the best possible outcome you would need to consider every single option, but then often it’s already too late — you’ve rejected interview candidates, houses were sold and/or options expired.

You stop looking too early, you don’t know if someone better isn’t going to come along.

You stop too late, you might have passed on the best candidate already.

Mathematically — you should stop looking after evaluating 37% of all the options you’re willing to look at. After the 37% option — if anything/anyone comes along who is better than everyone else before you should make the decision.

## [[Explore vs Exploit]]

_When should you be exploring new options and when should you start settling for the best option you already know?_

**Regret Minimisation Framework** — when you look back on your life when you’re 80 what will you regret least.

**Exploring** — when we talk about decision making, we always only consider the single highest pay-off on our single decision, but in the long term it’s way more efficient to first explore your options, before exploiting the highest pay-off decision, so you’re sure you’re exploiting the right decision

**Ageing** — Deepest insight about later life is that you can exploit knowledge acquired over decades — life should get better over time

## Sorting

[[Sorting]] is one of the most fundamental problems that computers are solving for us.

**Bubble sort + Insertion sort** — are the most common, least efficient sorting, when you put the book in alphabetically against a shelf of books, there is a billion different permutations and options

**Mergesort** — is the next best thing, when you compare two sets against each other and sort each time, then compare them against the next set

**Bucketsort** — is the most efficient, fastest way of a ‘close’ enough solution, putting things into buckets/classifying — of course that depends how well you choose your buckets

**Single elimination** — is a terrible way to rank, ie sports teams — all it tells you is the 1st place, but all other places in the ranking are not truly representative

**Round robin** — gives you full information, but also requires the most effort as everyone plays everyone

**Bracket tournaments** — are the most efficient way of ranking, they are a combination of a bucket- and mergesort

## Caching / Forgetting

Is a crucial part for computers, human memory, as well as organising data or your papers on your desk.

**[[Random]] eviction** — is actually not half bad, as the most important things keep getting back in

**First In, First Out ([[FIFO]])** — it’s essentially a queue kicking the oldest things out of the memory

**Least Recently Used (LRU)** — evicting the item that’s gone the longest untouched (so technically a pile of papers on your desk, is an efficient way of organising paper if you put the latest always on top)

Ideally, you have a couple different caches which are organised by category, so you shorten the path of access and don’t have to wade through all information every time.

## The Human [[Mind]]

The human mind does not run out of space, storage is unlimited, but the problem is one of organisation. We have an infinite capacity for memories, but we have only a finite amount of time in which to search for them.

Researcher showed that by accumulating more knowledge, we’re getting slower at accessing it. We’re not forgetting, we’re remembering — we’re becoming archives — which need organisation and are hard to access.

## [[Scheduling]]

Scheduling is a fundamental productivity problem.

## School of Thoughts

**Getting Things Done ([[GTD]])** — immediately do any task of two minutes or less once it comes to mind

**Eat that Frog** — beginning with the most difficult task

**Now Habit** — first scheduling social and leisure time then work

**Wait** — deliberately _not_ doing things right away

## Getting Things Done ([[GTD]])

You want to get as many things done as fast as possible?

Imagine you have a 4 day project and a 1 day project. If you deliver the 1. project on Thursday (4 days lapsed) and the second on Friday (1 day lapsed). The client will have waited 4+5 = 9 days, if you do it the other way around the client will have waited 1+5 = 6 days. The _sum of completion times_ is shorter and you saved the client 3 wait days, even though it was a full work week for you either way.

**Shortest Processing Time** — always do the quickest task you can

## [[Overfitting]]

Too much information, options, research is harmful. There is wisdom in deliberately thinking less and settling for second best solutions.

## Relaxation

Considering every possible option and finding the absolute optimal solution can take forever. Constraint relaxation helps you make decisions by consciously setting constraints / benchmarks which are good enough. Once achieved you can still expand them and aim higher.

## [[Game Theory]]

### Leveling

[[Poker]] players call it ‘leveling’.

-   Level one is ‘I know’.
-   Two is ‘you know that I know’.
-   Three, ‘I know that you know that I know’ etc

You only ever want to play one level above your opponent.

### [[Prisoner’s Dilemma]]
There usually is an incentive to cheat.

### [[Tragedy of Commons]]
Cheating is easy and nobody will notice, and it’s not going to make a difference in the grand scheme of things. Problem is — everyone thinks that way and everyone cheats ie Global Warming.

## Competition

Competitions kills holidays — in Silicon Valley companies started giving unlimited vacations. The problem is everyone wants to take one less day than their peer to show loyalty and their ambition. It is a classic race to 0 — so nobody ends up taking any holidays.

## Conclusion

Outcomes make news headlines — indeed, they make the world we live in — so it’s easy to become fixated on them. But processes are what we have control over.

If we wind up stuck in an intractable scenario, remember that heuristic, approximations, and strategic use of randomness can help you find workable solutions.

> Sometimes ‘good enough’, really is good enough.

People prefer constrained decisions, rather than open ended ones — it helps them make decisions faster and more confidently.