# Bats Test #
[![Build Status](https://travis-ci.com/eprislac/bats-test.svg?branch=master)](https://travis-ci.com/eprislac/bats-test)
No, this has nothing to do with Batman or the small furry flying rodents.
It has everything to do with a problem I've been facing at work, lately.
You see, we have a large collection of legacy shell scripts that run the backbone of our operation. Up until now, these scripts have not been subject to much scrutiny, intimidating as they are to anyone but the gnarliest of neckbeards.

If you're like me, you needed no more to feel the cringe from that statement than to read the word 'legacy'. Legacy code... nebulous, esoteric, and much worse, poorly documented. I was tasked with editing one of these and creating a new filter for another, and was unhappily informed that we had no way to test these other than to install them on the production server and see if they worked. As these scripts were meant to parse requests for sales support and deliver leads to the appropriate slaes associate, it would do quite a bit of damage to have potentially bad code running on our server. I thought back to the way we write ruby and js code... we're always looking to test and lint the hell out of it before we put it into production. Why weren't we doing the same with our bash scripts?

The most obvious answer to that was "nobody thought about it"
How many of us actually do think about testing our shell scripts? I have several I've written for my own benefit that I just set and forget, and to my shame, I realized I'd never thought to test or lint them as I would a Rails module or React component. Then, realizing that I had indeed just now thought about it, I decided to see if anyone else had. Big surprise, of course they did.

## BATS #
My first step was to find a testing library. I wanted to find something simple that worked the way Jest did in JS,
and my first hit ended up knocking it out of the park. [BATS](https://github.com/sstephenson/bats) by @sstephenson was everything I'd hoped for... I could now get either check/X or TAP-compatible reporting from a test suite, exactly as I could from Jest and the test format was almost as simple to learn. Best of all, it's not even really that dependent on Bash.. and in fact, I was running it in Zsh on my mac. Too cool.

## ShellCheck #
With my testing library squared away, I endeavored to find a linter to compliment my newly acquired test suite. Enter [ShellCheck](https://www.shellcheck.net/). Shellcheck is not only available via dpkg, apt-get and homebrew, but they have a web-based version for pasting in scripts, auto-correct, editor integration, and comes pre-installed on TravisCI. I ran it against one of our filter scripts, and was totally stoked at all the issues it was able to pick up on... and clear up right away.



