---
layout: default
nav_exclude: true
title: "S01 — Professor Knot Visits the Enzyme"
parent: Professor Knot Stories
grand_parent: Tutorials
nav_order: 1
---

# S01 — Professor Knot Visits the Enzyme

*Vera Knot attends a biochemistry seminar. Otto comes along for the coffee. Dr Felix was already there.*

---

The seminar room was on the fourth floor of a building that smelled of solvent and ambition. Marina had invited Vera, which was unusual, because Marina rarely invited anyone to anything she considered settled science — and enzyme mechanisms, in her view, were about as settled as things got.

"You said you thought you could explain why P450 works," Marina said, by way of introduction, as Vera sat down. "I want to see you try."

Otto was already in the back row, thermos open, notebook on his knee.

"Cytochrome P450," Vera said, unwinding her scarf. "Iron centre. D4h symmetry when the oxygen is bound, approximately. The resting state is Fe³⁺. It takes an electron, becomes Fe²⁺. Binds oxygen. Gets oxidised to Fe⁴⁺. Performs the hydroxylation. Resets."

"That's correct," Marina said. "Everyone knows that."

"What everyone knows," Vera said pleasantly, "is the *what*. I'm interested in the *why it has to be that sequence and not some other sequence*."

She took a piece of string from her coat pocket and laid it on the table.

---

### The state space

"Think of each oxidation state of the iron as a point," Vera said. "Fe³⁺ is one point. Fe²⁺ is another. Fe⁴⁺=O is a third. The transitions between them — gaining or losing an electron, binding a ligand — are edges between those points."

"That's just a reaction graph," said Marina. "Biochemists have been drawing those since the 1950s."

"Exactly," said Vera. "Except I want to label the points differently."

She picked up a marker and wrote on the whiteboard:

$$\text{Fe}^{3+}:\ (n_\text{tot}, \mathbf{v}, \mathbf{s}) = (5,\ (0,1),\ (0,+1))$$
$$\text{Fe}^{2+}:\ (n_\text{tot}, \mathbf{v}, \mathbf{s}) = (6,\ (1,1),\ (-1,+1))$$
$$\text{Fe}^{4+}\text{=O}:\ (n_\text{tot}, \mathbf{v}, \mathbf{s}) = (4,\ (1,0),\ (+1,0))$$

"What are those?" Marina asked.

"The orbit-occupancy state," Vera said. "How many d-electrons in total, how far each irreducible representation is from half-fill, and which side of half-fill it is on. It is a complete description of the iron centre at the topological level — nothing about rates, nothing about geometry, just the symmetry structure of the electron distribution."

"I proved last week," said Vera, "that no two distinct iron centres ever map to the same triple. It is injective. It is, in a precise sense, a fingerprint."

From the back row, Otto said: "She did prove it. All 32 point groups. I checked the script."

---

### The programme

"Now," Vera said. She picked up the string and made a loop. "The P450 catalytic cycle is this loop. It starts at Fe³⁺, goes through Fe²⁺, through Fe⁴⁺=O, performs the hydroxylation, and returns to Fe³⁺. Net change: zero. The enzyme ends where it started."

"That's what a catalyst does," Marina said.

"Yes. And in the language I care about, that is a **1-cycle** — a closed path on the state graph with no boundary." Vera set the loop of string on the table. "A cycle whose cohomology class is trivial. The programme resets. H¹ is zero."

Marina looked at the loop of string. "You're saying the enzyme works because its reaction cycle is topologically trivial."

"I'm saying the enzyme works *when* its reaction cycle is topologically trivial. When it is not — when something blocks the reset — the cycle has a non-trivial H¹ class. An obstruction. And the enzyme is inhibited."

There was a pause.

"Carbon monoxide binds the Fe²⁺ state," Marina said slowly. "It locks the iron there. The cycle cannot continue."

"Yes," said Vera. "CO is a TWIST-blocker. It freezes the iron in a state where the TWIST opcode — the spin-state change — cannot fire. The cycle has an obstruction. H¹ is non-trivial. The enzyme stops."

She picked up the string again and pulled it taut, so the loop could not close.

"*That*," she said, "is why CO is toxic."

---

### The selection rules

Dr Felix had been sitting in the corner, which Marina had not noticed. He was at an angle to the room that made it unclear when he had arrived.

"The interesting question," he said, without looking up from whatever he was reading, "is not whether the cycle closes. It is what determines which transitions are allowed in the first place."

"Selection rules," Vera said.

"Obviously. The transition from Fe³⁺ to Fe²⁺ is a FLIP: one electron added to one irreducible representation. The transition from Fe²⁺ to Fe⁴⁺=O is a TWIST: electrons move between irreps with no net change in count. These are not the same kind of event. They transform differently under the site symmetry group."

He set down his reading.

"The Wigner-Eckart theorem," he said. "The matrix element of any transition factorises into a group-theory part and a physics part. The group-theory part tells you whether the transition is allowed at all — zero or one. The physics part tells you how fast. The ISA computes the first. DFT computes the second. They are orthogonal pieces of information."

Marina had been a biophysicist for long enough to find this irritating. "So you're telling me that fifty years of computational chemistry — millions of CPU-hours of DFT calculations — were computing the second factor, and nobody noticed that the first factor was parameter-free."

"They noticed pieces of it," Felix said, returning to his reading. "Racah noticed it for spectroscopy in 1942. Marcus noticed it for electron transfer in 1956. Nobody connected them."

"Until now," Vera said mildly.

---

### What Otto thinks about all this

At some point during the preceding exchange, Otto had refilled his thermos — chaga tea, brewed from the fungus that grows on birch trees, dark and slightly bitter — and moved to the front row. Marina noticed the smell: earthy, faintly resinous, nothing like coffee.

"The part I find interesting," he said, "is the temperature."

"The enzyme works at 310 Kelvin," Marina said. "Body temperature."

"Yes. And the reason it works at 310 Kelvin and not at 4 Kelvin or 1000 Kelvin is that at 310 Kelvin, the Boltzmann weight for the TWIST transition is approximately one." He wrote in his notebook:

$$\beta \cdot \Delta E_\text{TWIST} \approx 1 \quad \text{at } T = 310\text{ K}$$

"At zero temperature, the TWIST opcode cannot fire — the spin-state change is thermally inaccessible. At very high temperature, all opcodes fire equally and the programme has no directionality." He looked up. "The enzyme operates in the sweet spot where the topology *and* the thermodynamics align. The programme is allowed by the selection rules, and it is accessible by the Boltzmann weights."

Marina looked at the thermos. "Why would you sum over all possible states rather than just finding the best one?"

Otto picked up the thermos and held it for a moment. "Because the best one is not always typical." He poured. "This is chaga. It is better than any of its individual components. You cannot understand it by finding the dominant ingredient and ignoring the rest. You have to sum." He set the cup down. "That is what a partition function is. A weighted sum over everything that could happen, which tells you what *will* happen on average. The enzyme is not in its lowest-energy state. It is in its typical state. The two are not the same."

"That," said Vera, without looking up from her string, "is the most thermodynamic thing I have ever heard anyone say about tea."

"That's the Forge layer," Vera added, looking up now. "β is the parameter that connects topology to kinetics."

"I call it the inverse temperature," Otto said. "But yes."

---

### What Marina takes away

After the seminar, Marina walked back to her lab and stood for a while looking at the enzyme structures pinned above her bench.

Vera had not told her anything she did not already know, in one sense. She knew the P450 cycle. She knew about CO inhibition. She knew about spin-state changes.

What she had not known — or had not said in those words — was that these were three aspects of one thing: a programme on a state space, with selection rules that determine what is allowed, Boltzmann weights that determine what fires, and cohomology that determines whether the programme can reset.

She pulled a paper from the stack on her desk. Extremophile P450, isolated from a hydrothermal vent organism. Active at 353 Kelvin. Unusually resistant to CO inhibition.

She picked up her phone.

"Vera," she said. "I have an enzyme that might be doing something different with its H¹. Can you look at it?"

---

*The mathematics behind this episode: Papers 488, 491, 502, 503.*
*The orbit-occupancy state (n_total, v, s) is defined in Paper 502, Theorem 1.*
*The Wigner-Eckart factorisation is Paper 502, Theorem 3.*
*The β-weighted programme (Forge ISA) is Paper 503.*
*CO as TWIST-blocker is Patent 15, Claim 3.*
