+++
title = "Gravity simulation"
draft = false
date = "2016-10-29T08:31:46Z"
thumbnail = "img/gravity.png"

+++

I have always been fascinated by gravity simulations, and I have vivid memories of 
small simulators where you would create celestial bodies and watch them in motion.

As I wanted to see what the fuss was about [TypeScript](https://www.typescriptlang.org/), I decided to make a simple gravity
simulator featuring planets. My goal was to simulate trajectories of around a dozen bodies in real-time, in
the browser.

Everything is based on Newton's [second law](https://en.wikipedia.org/wiki/Newton's_laws_of_motion#Newton.27s_second_law):
```
∑F = m.a = m.dv/dt
```

To know the gravitational forces exerced by the planets on one another, we use
[Newton's law of universal gravitation](https://en.wikipedia.org/wiki/Newton's_law_of_universal_gravitation#Modern_form).
The force between the masses 1 (of mass m1) and 2 (of mass m2) is  
```
F = m1.m2.G / d²
```
`d` being the distance between 1 and 2 and `G` the [gravitational constant](https://en.wikipedia.org/wiki/Gravitational_constant).

# Naive solution (Euler integration)

At the time *t*, I compute `∑F` applied on any planet `m` by summing the 
influences of all other planets on `m` using the law of universal gravitation. Given the mass of
the celestial body, I can deduce its acceleration:
```
a = ∑F/a
```
I only have to add the acceleration to the current velocity `v` of the planet to get the velocity `v'` at time *t+1*. 

The biggest problem with this approach is that it does not conserve energy: two bodies should be attracted, 
pass each other (I do not implement collisions for the moment), go further apart until the attraction bring them back again, pass each other, etc.

However with this method, they just get a massive speed boost as they get closer and then, (free energy !) 
they go at Lightspeed far from each other.

As you can imagine I was pretty disappointed by the result. After some research, it turns out that the web is pretty 
much full of people attempting the same project. This lead me to a better algorithm. 

# Velocity Velvet solution

This solution is the one implemented in the code, and do not have this problem. You can find a great
post about it in this [gamedev thread](http://gamedev.stackexchange.com/questions/15708/how-can-i-implement-gravity)

# Demo time !

You can find the code [here](https://github.com/Blizarre/gravity/), and a demonstration [here](/projects/gravity/index.html).

The demonstration is pretty simple for the moment, but I will definitely add features over the next weeks.
