# tps

# todo

- player
  - statemanager
    - rolling
    - air_charge
      - add damage area
- environment
  - basic world with
    - grass
    - forest
    - boulders
    - hills
    - slopes
- graphics
  - concept art
    - worker ant
    - soldier ant
    - acid splitter ant
    - queen bodyguard ant
    - queen ant
    - rifle
  - retopolgy + uv + baking + texturing
    - main char
  - add graphics ingame
- enemies
  - implement a basic enemy
  - capsule shape
  - moving towards player
  - takes damage

# overview

- player - characterbody3d
  - meshinstance3d
  - collisonshape3d
  - camera_controller - node3d
    - camera3d
      - bullet_raycast
    - shapecast3d
  - state_manager - node3d
    - idle
    - movement
    - jump
    - air_charge
    - ...
  - animationplayer
  - ui (canvas - instantiated with editable children)
    - crosshair (control)
      - meshinstance2d
  - weapon_manager (node3d - instantiated)
    - audiostreamplayer3d

- air_charge_impact_articles - gupparticles3d


- exampleWeapon - node3d
  - meshinstance3d
  - animationplayer
  - bulletspawn - marker3d
- impact_articles - gpuparticles3d
  - draw passes: 1
  - pass1: quadmesh

# graphics

## concept art

### squirrel main char

* i want it to be fighter squirrel
* anime fantasy style but not too cute but with a kinda cute faze
* the main feature of the character will be that if it sprints and then jumps - it jumps high in the air - where it can float for a while and then it dashes to the ground creating an huge impact so the tail has to refeclt the ability to float in the air
* only one tail
* a bit bulkier, let me see the breast muscles and biceps
* the main weapon will be a (a bit bulkier) assault rifle in the style of a ACR/SCAR21/G36
* no background needed

Model: Z Image Turbo

```
Anthropomorphic squirrel warrior, male, bipedal, medium height, powerfully built — broad chest, defined biceps with visible cream/tan fur, stocky muscular frame. 
The biceps are bare fur colored cream/tan — a lighter color patch distinct from the chestnut-orange body fur. 
Broad rounded face, short muzzle, light chestnut-orange fur, cream/tan patch on muzzle and cheeks. NO neck. 
Large heavy-lidded eyes, thick furrowed brow, intense scowl. 
Small dark nose, small rounded tufted ears. 
Slow confident closed smirk — self-assured. Short wild spiky headfur. 
ONE single tail only — large, thick, oversized and voluminous, full bushy squirrel tail curving upward behind the body. 
Warm chestnut/amber-orange fur.

Bare fur lower body: groin, hips, waist, lower belly, inner thighs, knees, shins, ankles all fully exposed fur. Cream/tan fur on inner thighs and lower belly visible. Nothing covers crotch or between legs.

Chest armor: pitch black carbon plate with dark grey underlayer, rust-orange trim. Hard shell covers chest and upper belly only, stops cleanly 2 inches above navel. No downward extension.

Underarm armor: small pitch black carbon plates on each underarm / inner bicep area, covering the armpit down to mid-inner arm. Separate from chest plate. Rust-orange trim on edges.

Upper thigh armor: two small separate clusters of 2-3 stacked horizontal plates attached to front sides of chest plate. Each cluster covers only front top of each thigh, stops at mid-thigh. Large open gap between them exposes entire groin and inner thighs.

Foot armor: small black carbon plates on outer instep only. No knee, shin, or lower leg armor.

White background. Clean lineart, flat cel shading, Hearthstone/LoR card art style. Warm lighting, soft rim light from above.

NEGATIVE: no groin cover, no loincloth, no skirt, no belly plate, no crotch plate, no armor below mid-thigh, no greaves, no cuisses.
```

**favorites**
- [Details](https://www.seaart.ai/explore/detail/d76fl45e878c73cj0f80?pt=) - [Direct](https://image.cdn2.seaart.me/2026-04-01/d76fk6te878c739jsg20/b535d949b049b05036fe85ab334c611a_high.webp)
- [Details](https://www.seaart.ai/explore/detail/d77cfv5e878c738g1ld0?pt=) - [Direct](https://image.cdn2.seaart.me/2026-04-02/d77b6pde878c73c5p2ag/2e6e165b232dcc2a8e56ada3f78c26b0_high.webp)

**other versions**
- [Details](https://www.seaart.ai/create/image?id=d4kssode878c7387fae0&model_ver_no=ef24b47a8d618127c9342fd0635aedb9) - [Direct](https://image.cdn2.seaart.me/2026-04-01/d76fjgde878c739jns60/fa8ef0bbee128c4a5abc597b7d37e2b3_high.webp)
- [Details](https://www.seaart.ai/create/image?id=d4kssode878c7387fae0&model_ver_no=ef24b47a8d618127c9342fd0635aedb9) - [Direct](https://image.cdn2.seaart.me/2026-04-01/d76fm15e878c739k8bqg/125a63ba58d364bb3a59a3337e6bfef5_high.webp)
- [Details](https://www.seaart.ai/create/image?id=d4kssode878c7387fae0&model_ver_no=ef24b47a8d618127c9342fd0635aedb9) - [Direct](https://image.cdn2.seaart.me/2026-04-01/d76fakde878c73c6gs8g/e0597d336a97ec5cec37fbc2ee7c5da2_high.webp)
- [Details](https://www.seaart.ai/explore/detail/d73gl9de878c738mf1lg?pt=) - [Direct](https://image.cdn2.seaart.me/2026-03-27/d73g1dde878c739d84p0/f52deebf5c821bb8f7798921b9c3f04c_high.webp)
- [Details](https://www.seaart.ai/create/image?id=d4kssode878c7387fae0&model_ver_no=ef24b47a8d618127c9342fd0635aedb9) - [Direct](https://image.cdn2.seaart.me/2026-04-02/d775igde878c738n6j3g/b2138647e4dfb1c8dba6d0567af19aab_high.webp)
- [Details]() - [Direct]()


### ant

#### Worker Ant

All fours, pure melee rush. The "feel good to mow down" enemy. Fast, fragile, swarms in groups. Your ground-dash ability should one-shot clusters of these — that's the satisfying payoff loop.

Model: Z Image Turbo

```
Quadrupedal worker ant, all four legs on the ground, small wiry build,
low to the ground, fast feral posture.

Sleek dark chitinous exoskeleton — near-void dark grey with faint iridescent sheen.
No armor, no equipment. Segmented body — head, thorax, abdomen clearly readable.

Large compound eyes, solid glowing acid-yellow — no pupil, no iris, no visible eyeball structure, just blank glowing yellow orbs.

Short sharp mandibles pulled wide open in an aggressive snarl.
Inside the open mouth: exactly four small jagged teeth — two on top, two on bottom — with a visible gap in the middle. No other teeth.

Two short antennae angled forward aggressively.

Legs articulated and spindly but powerful at the haunches.
Expression is mindless aggression — pure instinct, no intelligence.

White background. Clean lineart, flat cel shading, Hearthstone/Legends of Runeterra card art style.
Low heroic silhouette, warmer lighting, soft rim light from above.

No human posture, no bipedal, no arms, no hands, no upright stance.
```

- [Details](https://www.seaart.ai/explore/detail/d7eem9de878c73bgncf0?pt) - [Direct](https://image.cdn2.seaart.me/2026-04-13/d7edlcle878c7398sseg/d19d060efbf131c55cd094b60feb3821_high.webp)
- [Details]() - [Direct]()
- [Details]() - [Direct]()
- [Details]() - [Direct]()
- [Details]() - [Direct]()

#### Soldier Ant

**on 4 feets like a centaur**

Model: Z Image Turbo

Stands upright on two legs, bigger and armored. Slower than workers but hits hard with a mandible bite or a small shield bash. Forces the player to think a bit instead of just sprinting through. Two or three of these mixed with workers already creates interesting encounters.

```
Soldier ant. Insectoid quadruped. Six total limbs: four walking legs on the ground, two arms.

CRITICAL BODY PLAN: This creature has a HUMAN-SIZED TORSO attached to the FRONT of an ant body. The torso is MUSCULAR, BROAD-CHESTED, and THICK. Think: a bodybuilder's  and shoulders mounted onto an ant chassis. The torso is NOT small. The torso is NOT ant-sized. The torso is LARGE and POWERFUL.

POSTURE: All four walking legs on the ground. The ant is low to the ground — belly parallel to surface. Abdomen extends behind. From the FRONT of the body, a muscular humanoid torso rises upward vertically, like a centaur. This torso has TWO ARMS.

LOWER BODY (ant part): Four thick articulated legs planted wide. Strong haunches. Spindled lower segments. Clawed tarsi. Posture coiled and ready.

UPPER BODY (humanoid part — THIS MUST BE LARGE AND MUSCULAR): A massive, thick . Broad shoulders twice the width of the ant's head. Visible pectoral muscles. Thick neck. Two heavily muscled arms with chitinous claw hands. This torso is NOT small. It dominates the front of the creature.

HEAD: Ant head directly above the muscular torso. Short sharp mandibles clamped shut. Large compound eyes, bright acid-yellow, cold and calculating. Two short antennae angled forward.

EXOSKELETON: Sleek dark chitin — near-void dark grey with faint iridescent sheen. The muscular torso is also covered in chitin, but the shape underneath is clearly a broad humanoid .

EXPRESSION: Disciplined aggression. Alert, professional.

White background. Clean lineart, flat cel shading, Hearthstone/Legends of Runeterra card art style. Warmer lighting, soft rim light from above.
```

- [Details](https://www.seaart.ai/explore/detail/d7f00cde878c73955opg?pt=) - [Direct]()

- [Details](https://www.seaart.ai/explore/detail/d7daecte878c73c4n4qg?pt=) - [Direct](https://image.cdn2.seaart.me/2026-04-11/d7da9i5e878c738kfjn0/d393ec2cee9b6279a028f262e77047f3_high.webp)
- [Details]() - [Direct]()
- [Details]() - [Direct]()
- [Details]() - [Direct]()

---

**on 2 feets**

Model: Z Image Turbo

```
Anthropomorphic soldier ant, bipedal, powerfully built —
wide thorax, thick forearms, hunched aggressive stance.
Small to medium height — compact and dense rather than towering,
closer to a short stocky brawler than a large heavy.

Uses rear two legs to stand —
the thighs are enormously thick and overdeveloped, almost comically muscular,
like tree trunks wrapped in chitin.
The feet are huge, wide and heavy — oversized flat stompers
that grip the ground with visible weight and authority.
This ant is built from the waist down like a powerlifter.
Low stable center of gravity, planted and immovable.

Middle pair of limbs serve as arms — thick armored brawler arms.
Front limbs are smaller and tucked.

Dark chitinous exoskeleton — near-void dark grey base.
Armor plating bolted over the thorax and shoulders in pitch black carbon panels
with rust-orange rivets and trim accents only —
mirroring a heavily armored warrior aesthetic.

Large compound eyes, acid-yellow.
Broad flat head, heavy mandibles — clamped tightly shut, mouth completely closed,
jaw locked firm, radiating brute confidence and silent menace.
No teeth visible, no open mouth.

Two antennae swept back like horns.
Abdomen tucked behind, not dominant.
Meaty clenched fists.
Slow confident footing — the bruiser who has won a lot of fights.

White background.
Clean lineart, flat cel shading, Hearthstone/Legends of Runeterra card art style,
heroic silhouette, warmer lighting, soft rim light from above.
```

- [Details](https://www.seaart.ai/explore/detail/d7daecte878c73c4n4qg?pt=) - [Direct](https://image.cdn2.seaart.me/2026-04-11/d7da9i5e878c738kfjn0/d393ec2cee9b6279a028f262e77047f3_high.webp)
- [Details]() - [Direct]()
- [Details]() - [Direct]()
- [Details]() - [Direct]()
- [Details]() - [Direct]()

https://www.seaart.ai/explore/detail/d7daecte878c73c4n4qg?pt=

#### Acid Spitter Ant

Stays back and lobs acid blobs in an arc — think mortar-style projectiles that leave a puddle. This is the enemy that forces you to use your aerial ability to reposition. It directly justifies your core mechanic: sprint-jump-float to dodge the puddles, then ground-slam onto the spitter. Perfect design synergy.

Model: Z Image Turbo

```
Anthropomorphic spitter ant, all four legs on the ground, low crouched stance.

The ant carries a grotesquely oversized integrated acid bladder on its back —
a huge, round, taut sac fused to the thorax, sitting like a backpack but biologically seamless,
slightly translucent, filled with luminous acid-green fluid
visibly sloshing inside, stretched membrane with pulsing green-lit veins running across it.
The bladder bulges high and rearward, clearly full and pressurized —
looks satisfyingly fragile, like one solid hit would make it explode violently.
The legs and head emerge cleanly from beneath and in front of the bladder,
which arches over the body like a living reservoir.

The ant is in a catapult launch pose —
rear legs are bent and braced wide, anchoring the body low to the ground.
Front legs are planted forward, stabilizing.
The head is craned sharply upward, neck fully extended, facing the sky —
mouth wide open, mandibles splayed, firing a globule of luminous green acid
upward in a high mortar arc from the mouth.

Compound eyes large and acid-yellow with a faint green inner glow,
rolling slightly upward following the arc of the spit.
Antennae swept back flat from the effort.

Dark chitinous exoskeleton — near-void dark grey with acid-green accent glow
along the bladder seams, the connection points to the body, and around the mouth.

White background. Clean lineart, flat cel shading, Hearthstone/Legends of Runeterra card art style, heroic silhouette, warmer lighting, soft rim light from above.
```

- [Details](https://www.seaart.ai/explore/detail/d7dak2le878c73flpvbg?pt) - [Direct](https://image.cdn2.seaart.me/2026-04-11/d7daejle878c738l9i1g/d2484926fd83dfd587e9eea24368ca0b_high.webp)
- [Details]() - [Direct]()
- [Details]() - [Direct]()
- [Details]() - [Direct]()
- [Details]() - [Direct]()

#### Queen's Guard (heavy / mini-boss)

One beefier enemy type — heavily armored, slow, used sparingly as a room gate or before the final boss. Doesn't need complex AI. Just a damage sponge that makes the player burn resources. Could carry an oversized weapon or have a charge attack.

Model: Z Image Turbo

```
Anthropomorphic queen's guard ant, bipedal, massive imposing frame — nearly twice the width of a normal ant, barrel thorax, thick trunk-like legs, immovable stance.

Uses rear two legs to stand firmly planted.

No exposed chitin visible anywhere — completely encased in armor from head to toe. Full heavy armor coverage: pitch black carbon plate panels bolted across the entire body including head, thorax, arms, legs. Rust-orange trim and heavy rivets throughout. Armor is extremely dark — near-void black, almost light-absorbing, with only the faintest weathered charcoal undertones and minimal rust-orange corrosion streaks. Edges of every armor plate are significantly darker — deep charcoal to near-black gradients at the rims, almost no light catching the borders.

Helmet-like full head casing with only narrow horizontal eye slits. No mandibles visible — mouth area is a solid sealed armored plate.

Two thick antennae snapped off and protruding outward through the sides of the helmet — broken stumps of chitin jutting out at jagged angles, piercing through the armor plating. The breaks are rough and splintered, not clean cuts.

Compound eyes small and deep-set behind the narrow armored slits — acid-yellow glow barely visible, cold and unreadable.

Middle limbs are enormous armored arms holding an oversized blunt weapon — a great mandible club or thick carved obsidian maul.

Front limbs are smaller, tucked against chest.

Expression is absolute stillness — not angry, not feral, just immovable duty. A wall in ant form.

Blunt, brutal silhouette — no sharp edges, all curves and mass, except for the jagged broken antennae stabs.

White background. Clean lineart, flat cel shading, Hearthstone/Legends of Runeterra card art style, heroic silhouette, warmer lighting, soft rim light from above. Armor edges remain dark despite rim light — rim light wraps softly across the center of plates but fades completely before reaching the borders.
```

- [Details](https://www.seaart.ai/explore/detail/d7edk7te878c73f9p58g?pt) - [Direct](https://image.cdn2.seaart.me/2026-04-13/d7ed85de878c73e3p5ng/30d74d3f6c224769207d958f6afdc24b_high.webp)
- [Details]() - [Direct]()
- [Details]() - [Direct]()
- [Details]() - [Direct]()
- [Details]() - [Direct]()

#### queen

**The Broodmother — Immobile Siege Commander**

```
Ant queen — Broodmother variant. Immobile, massive, territorial.

LOWER BODY: Enormous pulsating abdomen, swollen and segmented, resting on the ground like a siege engine — too heavy to lift. Abdomen is pale translucent grey-chitin with faint internal glow — visible clusters of round eggs and larvae moving inside, pressed against the membrane. Abdomen is at least three times wider than her thorax. Trailing from the rear: a thin wet organic tether or birth sac, not a stinger.

UPPER BODY: Anthropomorphic, regal, ancient. Massive broad thorax and shoulders, covered in layered dark grey chitin with rust-orange veining — not painted armor, but natural chitin that has grown in overlapping plates like old battle-worn carapace. Head is broad and flat, larger than soldier ants. Mandibles are long, curved, and crossed beneath her face like a ceremonial collar — clamped shut, not for biting.

EYES: Large compound eyes, but unlike other ants — these are DEEP BLOOD ORANGE, not acid-yellow. Glowing faintly but warmly, almost like embers. Intelligent, patient, calculating.

ARMS: Two thick arms, humanoid in proportion but chitinous. One arm is braced against the ground like a pillar. The other arm is raised, holding a freshly torn grub — pale white, curled, leaking luminous green fluid from its soft body.

ABDOMEN SURFACE: The abdomen has open soft seams along the underside where grubs occasionally emerge — not grossly explicit, but visibly organic and vulnerable. Several small grubs are already on the ground near her, twitching.

EXPRESSION: Not aggressive — ancient, tired, but absolutely lethal. The face of something that has outlived everything.

DETAILS: Antennae long and drooping, almost weary, tipped with faint orange glow. No armor — her body IS the armor. Several old cracks and healed scars across her thorax.

White background. Clean lineart, flat cel shading, Hearthstone/Legends of Runeterra card art style. Warmer lighting, soft rim light from above. Rim light catches the curve of her abdomen and the wet grub in her hand.

NEGATIVE: no wings, no stinger, no held weapon, no normal proportions, no bipedal walking stance, no jewelry, no crown, no throne.
```

**The Sovereign — Elegant Duellist**

```
Ant queen — Sovereign variant. Bipedal, slender, lethal.

POSTURE: Stands on her rear two legs — but unlike the brawler ant's dense powerlifter stance, the queen is TALL and SLENDER. Her legs are long, segmented, almost elegant — digitigrade reverse-jointed, ending in sharp clawed points. She stands on her toes like a bird of prey. Her thorax is narrow and elongated, almost wasp-like.

COLOR: Deep charcoal-black chitin with a faint burgundy-purple iridescent sheen in direct light — royal and cold. No rust-orange anywhere on her body. She is clean, dark, and beautiful in a terrifying way.

HEAD: Narrow and sharp, almost triangular. Mandibles are long, thin, and crossed tightly beneath her face — not aggressive, but ready. Eyes are BRIGHT PALE GOLD — almost white-yellow — narrow and focused.

WEAPON (integrated): Her LEFT forelimb is not a normal arm — it has evolved into a LIVING BONE SCYTHE. The entire limb from elbow to tip is a single curved blade of dark glossy chitin, serrated along the inner edge, needle-sharp at the point. The blade is slightly longer than her torso. Her RIGHT arm is a normal chitinous arm with three clawed fingers, held open and balanced.

ARMS: Right arm is raised in a duellist's guard — open claw, ready to parry or grab. Left arm (the scythe) is extended low and back, blade pointing behind her, ready to swing upward in a rising cut.

ANTENNAE: Long, swept back like twin ribbons, tipped with pale gold glow.

ABDOMEN: Small and tucked high — not bloated. She does not lay eggs anymore. She is a warrior queen, not a mother.

EXPRESSION: Cold, patient, intelligent. No emotion — just the stillness of a perfect predator.

DETAILS: No armor. Her chitin IS her armor. Several old battle scars — long healed cracks across her thorax and one missing claw on her right hand.

White background. Clean lineart, flat cel shading, Hearthstone/Legends of Runeterra card art style. Warmer lighting, soft rim light from above. Rim light catches the edge of the bone scythe and her mandibles.

NEGATIVE: no bloated abdomen, no eggs, no grubs, no rust-orange color, no heavy armor, no thick body, no open mouth, no wings, no stinger.
```

**The Symbiote Queen — Armored Caster**

```
Ant queen — Symbiote variant. Bipedal, heavily armored, organic.

BODY PLAN: Stands on two thick rear legs — not as dense as the brawler, but solid and planted. Her torso is humanoid but completely unrecognizable beneath a LIVING SYMBIOTIC ARMOR — a second organism that has fused to her chitin. The armor is thick, pulsating, slightly translucent dark chitin with BRIGHT ORANGE-PURPLE GLOWING VEINS running through it like circuitry. The veins pulse slowly — visible heartbeat rhythm.

HEAD: Her actual head is barely visible — the symbiote has grown a HELMET-LIKE CARAPACE over her face. Only her COMPOUND EYES are visible through two narrow slits — glowing HOT ORANGE (not yellow, not red). Her mandibles are completely hidden. Antennae have fused into the symbiote and now emerge as two thick, ridged horns curving backward.

UPPER BODY: The symbiote has grown a massive BULBOUS THORAX ARMOR — wider than her shoulders, sloping downward like a beetle's shell. The orange-purple veins are thickest here, converging on a single LARGE PULSING SAC on her right shoulder — this is the pheromone mortar.

LEFT ARM: Completely transformed — the symbiote has grown a MASSIVE LIVING SHIELD where her forearm should be. The shield is a curved, bulbous growth of dark chitin, almost spherical but flattened on the front, with a small ventral pore on the underside that leaks glowing orange fluid — the acid spitter.

RIGHT ARM: Thick, clawed, free — held open in a commanding gesture. Three fingers, each tipped with a curved black claw.

ABDOMEN: Tucked high and small — she has not reproduced in years. The symbiote has consumed most of her reproductive system.

LEGS: Thick, armored, digitigrade. The symbiote has grown small spike-like projections along the shins.

EXPRESSION: Impossible to read — her face is hidden. But her posture is COMMANDING — chest slightly forward, one foot planted ahead of the other, right arm raised like a general addressing an army.

DETAILS: The symbiote is slightly too large for her body — it bulges at the joints, looks heavy and uncomfortable. Several small parasitic tendrils connect from the armor into her actual chitin at the neck and wrists.

White background. Clean lineart, flat cel shading, Hearthstone/Legends of Runeterra card art style. Warmer lighting, soft rim light from above. Rim light should wrap across the curved shield and the bulbous thorax armor, but the glowing veins should be the primary light source in the shadows.

NEGATIVE: no separate shield prop, no weapon prop, no rust-orange trim, no black carbon armor, no rivets, no human-made armor, no throne, no eggs, no grubs.
```

### weapons

#### rifle

Model: Z Image Turbo

```
Oversized matte black assault rifle, ACR/SCAR/G36 hybrid, angular polymer body, darkened rail system, chunky foregrip, thick blackened barrel with muzzle brake. Near-black finish with minimal metallic sheen.

White background. Clean lineart, flat cel shading, Hearthstone/Legends of Runeterra card art style, heroic silhouette, warmer lighting, soft rim light from above.
```

- [Details](https://www.seaart.ai/explore/detail/d7f30u5e878c738kbk3g?pt=) - [Direct](https://image.cdn2.seaart.me/2026-04-14/d7f25tde878c73bjup00/5ec54ee411d899d86fcd750d36b7d600_high.webp)
- [Details]() - [Direct]()
- [Details]() - [Direct]()
- [Details]() - [Direct]()

#### hammer

Model: Z Image Turbo

```
Oversized war hammer, brutally simple. The haft is ABSURDLY LONG — three to four times longer than the hammer head is wide. Visually: the haft takes up 80% of the weapon's total height, the head only 20%. A tiny head perched on a comically long pole, yet still reads as heavy and crushing.

Dark stained hardwood haft, unnaturally straight and uniform, as thick as a shovel handle. Only the bottom third is wrapped in black leather for grip. The upper two-thirds is bare dark wood.

Hammer head is moderately sized (not tiny, but not enormous) — carved from near-black jagged obsidian or dark volcanic stone. Symmetrical blunt block on both sides. No beak, no spike, no point. Flat clean striking faces.

Two dark iron bands just below the head.

Butt cap: flat dark iron ring.

CRITICAL PROPORTIONS: If the hammer head is 1 unit tall, the haft is 5 to 6 units long. The haft should extend past the bottom of the frame or nearly touch the bottom edge. The weapon reads as intentionally, unnaturally stretched.

The hammer head is small relative to the haft. Emphasize the LENGTH. Draw the haft first, then put the head at the very top as an afterthought.

White background. Clean lineart, flat cel shading, Hearthstone/Legends of Runeterra card art style, heroic silhouette, warmer lighting, soft rim light from above.

NEGATIVE: no normal proportions, no short haft, no beak, no spike, no glowing elements, no chains, no skulls, no wear marks.
```

- [Details](https://www.seaart.ai/explore/detail/d7fojqte878c7399hmcg?pt=) - [Direct](https://image.cdn2.seaart.me/2026-04-15/d7fn07le878c73eh125g/7401eeb7249d235b2ae078d16882f3a3_high.webp)
- [Details]() - [Direct]()
- [Details]() - [Direct]()
- [Details]() - [Direct]()

#### spear

Model: Z Image Turbo

```
A medium-length war spear — not a pike, not a short javelin. Balanced for one-handed use behind a shield and overhand throwing. Total length roughly equal to a tall human's standing height.

Shaft: thick hexagonal haft of darkened oiled wood, wrapped in segments of blackened leather and rough cord grip just below the midpoint. No metal along the shaft — lightweight for throwing, but sturdy enough to brace against a charge.

Head: angular blackened steel, narrow leaf-shaped blade with a reinforced central ridge. Blade is moderately sized — not oversized like the hammer, not slender like an elf spear. Practical, brutal, military. The steel is near-black with faint charcoal wear marks. Minimal rust-orange corrosion near the socket.

Butt cap: small conical dark iron spike for planting into the ground or a secondary striking point.

Socket: reinforced black iron with two small rivets visible. Sits flush against the shaft — no frills, no decoration.

Silhouette: clean, sharp, dangerous. A middle ground between the rifle's angular polymer and the hammer's crushing mass.

White background. Clean lineart, flat cel shading, Hearthstone/Legends of Runeterra card art style, heroic silhouette, warmer lighting, soft rim light from above.

NEGATIVE: no barbs, no serrated edges, no glowing elements, no tassels or dangly bits, no oversized head, no split blade, no ornate filigree.
```

- [Details](https://www.seaart.ai/explore/detail/d7fp1fte878c73bo425g?pt=) - [Direct](https://image.cdn2.seaart.me/2026-04-15/d7fl3bte878c73etbspg/87a3caa56cf7b15191d9bc84ab11e96e_high.webp)

- [Details](https://www.seaart.ai/explore/detail/d7f37sde878c739va5l0?pt=) - [Direct](https://image.cdn2.seaart.me/2026-04-14/d7f35ide878c73b0l3kg/bce9e46ed23d19047f2535e03398b739_high.webp)
- [Details]() - [Direct]()
- [Details]() - [Direct]()

#### shield

```
A medium-sized war shield for one-handed use alongside a spear — not a massive tower shield, not a small buckler. Large enough to cover torso and shoulder, light enough to not tire the arm for overhand throwing.

Shape: slightly curved rectangular or elongated oval — vertical orientation, rounded top and bottom corners. Practical, not decorative.

Face: angled blackened steel plates riveted over a dark wooden core. The steel is near-black with faint charcoal wear marks — matching the spear's head. Minimal rust-orange corrosion near a few rivets, same as the spear's socket. No heavy rust, just faint traces.

Rivets: large dark iron, slightly domed, arranged in a simple functional grid — three across, four down.

Edge: wrapped in blackened rawhide or worn leather, slightly darker than the face. No metal rim.

Back (implied): leather arm straps and a padded black canvas backing. Not visible from front but affects silhouette — the shield has slight thickness.

Center: no boss, no emblem, no crest, no decoration. The face is flat and blank — a working shield, not a heraldic prop.

The shield's surface has subtle horizontal or diagonal gouges from old battles — shallow cuts in the steel, not rust.

Silhouette: clean, blunt, slightly battered. Middle ground between the spear's angular sharpness and the hammer's crushing mass.

White background. Clean lineart, flat cel shading, Hearthstone/Legends of Runeterra card art style, heroic silhouette, warmer lighting, soft rim light from above. The rim light wraps across the center of the shield face but fades before reaching the dark leather edge.

NEGATIVE: no spikes, no crest or emblem, no heraldry, no animal motifs, no gold or brass trim, no scalloped edges, no glowing elements, no tassels, no ornate filigree, no shield boss, no center dome.
```


- [Details](https://www.seaart.ai/explore/detail/d7fp1q5e878c73br8svg?pt=) - [Direct](https://image.cdn2.seaart.me/2026-04-15/d7fp0f5e878c73f0n740/19f522e95263bbe5e173222364614ed2_high.webp)
- [Details]() - [Direct]()
- [Details]() - [Direct]()
- [Details]() - [Direct]()


### props

#### trees


```
A single mesh of a squat, bulbous tree. Trunk swells dramatically near base. Canopy is a dense cluster of rounded overlapping leaf blobs with NO gaps visible from any angle — solid silhouette. Mesh must be fully enclosed with no open faces. Pivot point at very bottom center of trunk. Flat cel shading, clean lineart. Warm gray-brown trunk, deep muted teal-green canopy with lighter moss-green highlights. Soft warm rim light from above. White background.

MULTIMESH NOTES: Model from 4 equidistant angles should look nearly identical. Use simple collision shape — a tall cylinder or capsule. LOD0: 800-1200 triangles. LOD1: 300-500 triangles. LOD2: 100-150 triangles (single blob).
```

```
A single mesh of a narrow conical evergreen tree. Single straight trunk visible at bottom. Layers of jagged triangular foliage stacked vertically, each layer slightly wider than above. Solid silhouette with no gaps through the canopy. Pivot point at very bottom center of trunk. Flat cel shading. Dark charcoal-brown trunk, cool dark green-gray foliage with pale sage-green highlights. Soft warm rim light from above. White background.

MULTIMESH NOTES: Sharp conical silhouette must read from all angles. LOD0: 600-1000 triangles. LOD1: 200-300 triangles. LOD2: 50-80 triangles (simple cone).
```

```
A single mesh of a wide-canopy tree. Short thick trunk splits into three large horizontal branches. Canopy is broad and slightly flattened on top, made of many small rounded leaf clusters with no gaps. Pivot point at bottom center. Flat cel shading. Warm earthy brown trunk and branches, warm olive-green canopy with yellow-green highlights. Soft warm rim light from above. White background.

MULTIMESH NOTES: Canopy must be solid from below and above. LOD0: 1000-1500 triangles. LOD1: 400-600 triangles. LOD2: 120-180 triangles.
```

```
A single mesh of a leafless gnarled tree. Trunk twists violently. Sharp jagged branches reach upward like claws. No leaves, no canopy. Pivot point at bottom center. Flat cel shading. Ash-gray and pale charcoal trunk. Single faint warm rim light from above catching highest branch tips. White background.

MULTIMESH NOTES: Use this sparingly — it's a contrast piece. LOD0: 500-800 triangles. LOD1: 200-300 triangles. LOD2: 80-120 triangles.
```

```
A single mesh of a slender slightly curved palm tree. Trunk has horizontal ring scars. Top has tight cluster of 5-6 long arched sword-shaped fronds drooping outward. Pivot point at bottom center. Flat cel shading. Warm golden-brown trunk, yellow-green fronds with darker green undersides. Soft warm rim light from above catching frond arches. White background.

MULTIMESH NOTES: Fronds must be solid planes double-sided or thick enough to read from below. LOD0: 600-1000 triangles. LOD1: 250-400 triangles. LOD2: 100-150 triangles (star-shaped frond cluster).
```


#### rocks

```
A single mesh of a large angular boulder with sharp faceted planes and deep crevices. Silhouette is blocky and uneven. Pivot point at bottom center. Flat cel shading. Cool slate-gray base with warm charcoal shadows. Single prominent warm rim light from above hitting top-most flat surface. White background.

MULTIMESH NOTES: Rock meshes should be rotated randomly when placed. LOD0: 300-500 triangles. LOD1: 150-250 triangles. LOD2: 60-100 triangles.
```

```
A single mesh of a large smooth oval river stone with no sharp edges. Surface is featureless and softly curved. Pivot point at bottom center. Flat cel shading. Warm taupe-gray base with creamy beige highlight on top curve. Soft warm rim light from above. White background.

MULTIMESH NOTES: Perfect for stream beds and cave floors. LOD0: 200-300 triangles. LOD1: 100-150 triangles. LOD2: 40-60 triangles.
```

```
A single mesh of three flat disc-shaped stones stacked vertically like a small cairn. Each stone slightly offset. No gaps between stones — mesh is welded into one object. Pivot point at bottom center. Flat cel shading. Warm earthy brown-gray stones with subtle horizontal striations. Soft warm rim light from above hitting top stone. White background.

MULTIMESH NOTES: Use as single object, not separate stones. LOD0: 400-600 triangles. LOD1: 200-300 triangles. LOD2: 80-120 triangles.
```

```
A single mesh of a tall narrow vertical rock formation tapering to a blunt point. Sides are straight but uneven with two or three large vertical cracks. Pivot point at bottom center. Flat cel shading. Dark charcoal-gray with warm gray highlights on left face. Strong warm rim light from above grazing top point and left edge. White background.

MULTIMESH NOTES: Good for canyon edges and ant nest entrances. LOD0: 300-500 triangles. LOD1: 150-250 triangles. LOD2: 60-100 triangles.
```

```
A single mesh of a wide low table-like rock formation jutting horizontally. Top surface is relatively flat and broad. Bottom is uneven. Pivot point at bottom center. Flat cel shading. Warm sandy-brown base with pale cream-beige top surface. Soft warm rim light from above illuminating entire top surface. White background.

MULTIMESH NOTES: Good for stepping stones and ledges. LOD0: 250-400 triangles. LOD1: 120-200 triangles. LOD2: 50-80 triangles.
```

#### bushes

```
A single mesh of a large dense perfectly hemispherical bush. Surface is smooth continuous dome made of tightly packed small rounded leaf clusters with no gaps. Pivot point at bottom center. Flat cel shading. Deep forest-green base with bright lime-green highlight patches across top curve. Soft warm rim light from above illuminating entire crown. White background.

MULTIMESH NOTES: Solid dome — no transparency needed. LOD0: 300-500 triangles. LOD1: 150-250 triangles. LOD2: 50-80 triangles (single hemisphere).
```

```
A single mesh of a chaotic sprawling bush made of sharp angular jagged branch tips extending outward in all directions. No visible leaves. Pivot point at bottom center. Flat cel shading. Warm dusty brown branches with pale tan thorn tips. Soft warm rim light from above catching highest spikes. White background.

MULTIMESH NOTES: Aggressive silhouette — use near enemy spawns. LOD0: 400-600 triangles. LOD1: 200-300 triangles. LOD2: 80-120 triangles.
```

```
A single mesh of a wide flat ground-hugging bush spreading horizontally. Only a few inches tall but several feet wide. Surface is bumpy and uneven. Pivot point at bottom center (lowest point). Flat cel shading. Muted sage-green base with pale yellow-green highlight spots scattered across top. Soft warm rim light from above grazing highest bumps. White background.

MULTIMESH NOTES: Flattened silhouette — good for ground cover. LOD0: 300-500 triangles. LOD1: 150-250 triangles. LOD2: 60-100 triangles.
```

```
A single mesh of a loose irregularly shaped bush taller than wide. Branches visible at bottom giving way to scattered leaf clusters toward top. Silhouette is airy but still solid — no gaps large enough to see through. Pivot point at bottom center. Flat cel shading. Warm brown branches, dark olive-green leaves in shadow, warm yellow-green leaves in light. Soft warm rim light from above catching top leaves. White background.

MULTIMESH NOTES: Airy but opaque — use for variety. LOD0: 400-700 triangles. LOD1: 200-350 triangles. LOD2: 80-150 triangles.
```

```
A single mesh of a bush with two distinct rounded lobes side by side, like two hemispheres fused together. Shallow dip in middle of top silhouette. Pivot point at bottom center. Flat cel shading. Deep bottle-green base with pale mint-green highlights on top of each lobe. Soft warm rim light from above hitting both lobes evenly. White background.

MULTIMESH NOTES: Symmetrical but organic. LOD0: 350-550 triangles. LOD1: 180-280 triangles. LOD2: 70-110 triangles.
```

#### ball

```
A perfectly round ball of compacted dried earth and organic material, rolled by dung beetles in the ant world. The squirrel warrior collects these and uses them as disposable rolling targets.

CONSTRUCTION:
- Perfectly spherical
- Surface is rough and textured — made of thousands of compacted dirt granules
- No seams, no construction — completely natural

COLORS:
- Warm dried-earth brown — terracotta, umber, dusty tan
- No bright colors, no green (completely dried)

SURFACE DETAIL:
- Subtle granular texture
- Small cracks on the surface from drying
- One or two small pebbles embedded in the surface

SIZE:
- About the size of a cantaloupe or small melon

DAMAGE MARKINGS (for used targets):
- Shatters or cracks when shot — one side can be shown with impact crater
- Dust debris implied but not modeled

MOVEMENT:
- Rolls in straight lines when pushed
- Slower and heavier than the beetle or chitin ball
- Leaves a faint dust trail behind it

LIGHTING:
- Soft warm rim light from above
- Flat cel shading, clean lineart
- White background

NEGATIVE: no bright colors, no rubber, no spikes, no glowing, no organic matter (dried only), no mud (it's hard and dry).
```

```
A manufactured rolling target for shooting practice. A hollow sphere made of curved ant chitin plates riveted together.

Perfectly round. Assembled from 6-8 curved chitin plates harvested from ant shells. Plates are near-void dark grey with faint iridescent sheen — matching enemy ant exoskeleton. Heavy matte black iron rivets at each seam with rust-orange corrosion on rivet heads. No visible gaps between plates.

Surface has existing impact cracks and small dents from previous training sessions. Weighted slightly off-center internally so it rolls in unpredictable curves.

Soft warm rim light from above catching the top curve. Flat cel shading, clean lineart. Hearthstone/Legends of Runeterra card art style. White background.

NEGATIVE: no bright colors, no rubber, no visible seams, no glowing elements, no spikes, no visible interior.
```

#### dummy target

```
A training dummy built to resemble an ant soldier's upper body mounted on a post. Used by the squirrel warrior for weapon practice.

CONSTRUCTION:
- Central post: salvaged ant mandible or thick chitin leg bone — curved, tapered, dark grey with faint iridescent sheen, planted vertically into the ground
- Torso: hollowed-out ant thorax shell (worker ant size, not soldier) strapped to the post with rusted iron bands — dark chitinous exoskeleton texture preserved
- Head: empty ant head casing mounted on top, mandibles clamped shut, compound eyes removed leaving two empty dark sockets
- Arms (optional): two smaller ant leg segments bolted to the sides as swinging arm targets

DAMAGE MARKINGS:
- Deep impact cracks radiating across the chitin torso
- One entire side of the head casing shattered or missing
- Rust-orange corrosion on the iron bands and bolts
- Several shallow cut marks on the post

COLORS:
- Chitin: near-void dark grey with faint iridescent sheen (matching enemy ants)
- Iron bands: matte black with rust-orange corrosion at edges and rivets
- Post (if mandible bone): pale dirty bone-white with dark grey streaks

LIGHTING:
- Soft warm rim light from above catching the top of the head casing and the left side of the thorax
- The empty eye sockets remain pure black — no light inside

STYLE:
- Flat cel shading, clean lineart
- Hearthstone/Legends of Runeterra card art style
- White background

NEGATIVE: no burlap, no wood (except possibly the post if mandible bone isn't used), no rope, no sack, no straw, no medieval aesthetics, no face painted on, no target circles.
```

```
A training dummy built by the squirrel warrior from scrap materials and old equipment.

CONSTRUCTION:
- Central post: thick dark stained wooden pole (matching the war hammer haft) — straight, uniform, planted vertically
- Torso: discarded pitch black carbon chest plate (old damaged armor) bolted to the front of the post — missing its bottom section, cracked across the center
- Head: a salvaged ant helmet (empty) or a battered metal pot with two small holes cut for eyes — bolted to the top
- Shoulders: two curved rust-orange metal scraps bolted to the sides

DAMAGE MARKINGS:
- Deep impact dent in the center of the chest plate
- Multiple shallow cut marks across the wood
- One of the shoulder scraps is bent downward
- Rust-orange corrosion around every bolt

COLORS:
- Wood post: dark stained hardwood (warm dark brown)
- Chest plate: pitch black carbon with rust-orange trim edges
- Helmet: dark grey chitin or matte black metal
- Bolts and bands: matte black iron with rust-orange corrosion

LIGHTING:
- Soft warm rim light from above

STYLE:
- Flat cel shading, clean lineart
- Hearthstone/Legends of Runeterra card art style
- White background

NEGATIVE: no burlap, no sack, no straw, no rope, no face, no target circles, no cloth.
```

#### tree house

**Wall Piece (Flat)**

```
A single mesh of a flat wooden wall panel with no openings. Vertical planks tightly joined. Width is 2 units, height is 3 units. Top edge is straight. Bottom edge is straight. Left and right edges have snap points. Flat cel shading. Warm weathered brown-gray wood with darker plank lines. Soft warm rim light from above hitting top edge. White background.
```

**Wall with Circular Window**

```
A single mesh of a flat wooden wall panel with one small circular window cut through the center. Vertical planks tightly joined. Width is 2 units, height is 3 units. Top edge is straight. Bottom edge is straight. Left and right edges have snap points. The circular window has no glass - it is an open hole. Inner edge of the cut shows dark interior shadow. Flat cel shading. Warm weathered brown-gray wood with darker plank lines. Soft warm rim light from above hitting top edge. White background.
```


**Wall with Door Frame**

```
A single mesh of a flat wooden wall panel with a rectangular door opening at center bottom. Vertical planks tightly joined. Width is 2 units, height is 3 units. Top edge is straight. Bottom edge is straight. Left and right edges have snap points. The door opening is 1.5 units tall and 1 unit wide. No door mesh included (door is separate piece). Inner edges of the opening show dark interior shadow. Flat cel shading. Warm weathered brown-gray wood with darker plank lines. Soft warm rim light from above hitting top edge. White background.
```


**Roof Piece (Slanted)**

```
A single mesh of a slanted roof panel made of overlapping bark shingles. Width is 2.5 units (overhangs a 2-unit-wide wall by 0.25 units on each side). Depth (the slope distance from ridge to eave) is 2 units. Thickness is 0.2 units. Flat cel shading. Dark charcoal-brown shingles with subtle individual shingle lines. Soft warm rim light from above hitting the top edge. White background. Two of these panels can be combined at an angle to form a peaked roof.
```


**Roof Peak (Ridge Cap)**

```
A single mesh of a ridge cap for a peaked roof. Covers the seam where two slanted roof panels meet at the top. Length is 2.5 units to match roof panel width. Shape is like an inverted V or curved top covering the ridge line. Flat cel shading. Dark charcoal-brown wood matching the shingle color. Soft warm rim light from above. White background.
```


**Platform / Floor Piece**

```
A single mesh of a wooden floor platform. Wide horizontal planks running across the surface. Width is 2 units, depth is 2 units, thickness is 0.2 units. Bottom has visible support beams - two beams crossing underneath (one along each direction). Pivot point is at the bottom of the support beams (so platform sits on top of them). Flat cel shading. Top planks are warm brown-gray. Support beams are darker brown. Soft warm rim light from above hitting the top surface. White background.
```


**Railing Piece**

```
A single mesh of a wooden railing segment. Made of three horizontal logs stacked vertically, and two vertical posts at left and right ends. Fits along a platform edge of 2 units width. Total height of railing is 1 unit. Flat cel shading. Warm weathered brown wood. Soft warm rim light from above hitting the top rail and the tops of both vertical posts. White background.
```


**Rope Ladder**

```
A single mesh of a hanging rope ladder. Two vertical ropes running the full length. 6 wooden rungs spaced evenly between the ropes. Ladder length from top hook to bottom is 4 units. Top has two iron hooks for mounting onto a platform edge or beam. Flat cel shading. Vertical ropes are pale tan. Wooden rungs are warm brown. Iron hooks are matte black. Soft warm rim light from above. White background.
```


**Wall Hook (Interior)**

```
A single mesh of a simple iron wall hook for interior use. Single peg protruding outward from a small round base plate. Two rivets visible on the base plate. Flat cel shading. Base plate and peg are matte black iron with subtle rust-orange corrosion at the rivet edges. Soft warm rim light from above. White background.
```

#### ant nest

**Tunnel Straight (2m length)**

```
A single mesh of a straight tunnel section. Circular or slightly oval cross-section. Inner walls are smooth compacted dark earth with subtle horizontal scratch marks from digging. Both ends are open with matching rim diameter for snapping. Pivot point at center. Flat cel shading. Warm deep brown with darker umber shadows in deepest recesses. Soft warm ambient light (no direct rim light inside tunnel). White background.

MODULAR NOTES: Length is 2 units. Inner diameter is 2 units. Outer diameter is 2.4 units (wall thickness 0.2 units).
```

**Tunnel Curve (90 degrees)**

```
A single mesh of a curved tunnel section that bends 90 degrees. Circular cross-section. Inner walls are smooth compacted dark earth. The inner wall of the curve (the shorter side) is slightly smoother than the outer wall. Both ends are open circular openings with inner diameter of 2 units, outer diameter of 2.4 units (wall thickness 0.2 units). The arc length from end to end is 2 units. Flat cel shading. Warm deep brown with darker umber shadows in deepest recesses. Soft warm ambient light (no direct rim light inside tunnel). White background.
```


**Tunnel T-Junction**

```
A single mesh of a three-way tunnel junction. A straight tunnel continues through, and a third tunnel branches off at 90 degrees from the center point. All three openings are circular with inner diameter of 2 units, outer diameter of 2.4 units. Inner walls are smooth compacted dark earth with subtle horizontal scratch marks. Flat cel shading. Warm deep brown with darker umber shadows. Soft warm ambient light. White background.
```


**Tunnel Cross (Four-way)**

```
A single mesh of a four-way tunnel intersection. Two tunnels crossing at 90 degrees through the center. All four openings are circular with inner diameter of 2 units, outer diameter of 2.4 units. Inner walls are smooth compacted dark earth. Flat cel shading. Warm deep brown with darker umber shadows. Soft warm ambient light. White background.
```


**Tunnel Slope (Ramp)**

```
A single mesh of a straight tunnel section where the floor is angled upward at 30 degrees relative to the ceiling. Length from end to end is 2 units. Circular cross-section with inner diameter of 2 units, outer diameter of 2.4 units. Both ends are open circular openings. The floor has subtle claw-grip texture lines running along the slope direction. Inner walls are smooth compacted dark earth. Flat cel shading. Warm deep brown with darker umber shadows. Soft warm ambient light. White background.
```


**Main Chamber (Empty)**

```
A single mesh of a large open chamber. Roughly oval shape with domed ceiling. Floor is flat. Three circular tunnel openings positioned on the walls, each with inner diameter of 2 units. Chamber dimensions: width 6 units, depth 5 units, height 4 units. No objects or props inside - completely empty. Flat cel shading. Walls are warm deep brown with subtle horizontal strata bands. Soft warm ambient light. White background.
```


**Nursery Chamber (with Eggs)**

```
A single mesh of a large open chamber. Roughly oval shape with domed ceiling. Floor is flat. Three circular tunnel openings in the walls, each with inner diameter of 2 units. Chamber dimensions: width 4 units, depth 4 units, height 3 units. The floor has a cluster of 8 large ant eggs modeled as part of the mesh (welded to floor, not separate objects). Eggs are smooth oval shapes, each roughly 0.5 units long. Flat cel shading. Chamber walls are warm deep brown with subtle horizontal strata bands. Eggs are pale creamy yellow with warm beige highlights. Soft warm ambient light. White background.
```


**Storage Chamber (Food Cache)**

```
A single mesh of a large open chamber. Roughly oval shape with domed ceiling. Floor is flat. Three circular tunnel openings in the walls, each with inner diameter of 2 units. Chamber dimensions: width 4 units, depth 3 units, height 3 units. The back wall has a cache of items modeled as part of the mesh (welded, not separate objects): three large seeds (golden-brown, each 0.4 units), two dried mushrooms (pale tan, cap shape), and one small generic skull (bone-white, rodent-sized). Flat cel shading. Chamber walls are warm deep brown with subtle horizontal strata bands. Soft warm ambient light. White background.
```


**Surface Mound Exterior**

```
A single mesh of a large low dome-shaped anthill rising from flat ground. Surface made of thousands of small soil granules modeled as texture/bump, not individual spheres. One large central entrance hole at base (diameter 2 units, matching tunnel opening). Two smaller vent holes higher up. Mound dimensions: width 6 units, height 2.5 units at center. Pivot point at bottom center. Flat cel shading. Warm reddish-brown and terracotta soil. Entrance hole is pure black. Soft warm rim light from above hitting top of mound and vent hole rims. White background.

NEGATIVE: no grass, no sticks.
```


**Mound Entrance Piece**

```
A single mesh of the transition piece between surface mound and underground tunnel. Upper half is mound soil with entrance hole. Lower half is tunnel opening matching diameter. Pivot point at center of tunnel opening. Flat cel shading. Top: warm reddish-brown soil. Bottom: warm deep brown tunnel interior. Entrance hole rim has subtle soil granules. White background.
```





### terrain tiling textures

#### grass

```
A seamless square tile of dense short grass viewed from directly above (top-down orthographic view). Grass covers 100% of the frame with no visible dirt. Individual blades are short, blunt, and barely distinguishable at this scale — reads as a soft textured carpet of muted olive-green with subtle brightness variation. No single blade stands out. No flowers, no patches, no weeds. Designed to tile perfectly edge to edge with no visible seams. Flat cel shading, clean lineart, macro texture scale. Hearthstone/Legends of Runeterra card art style. Soft warm lighting from directly above, even illumination across the entire tile. White background.

NEGATIVE: no individual blades visible as distinct shapes, no shadows from blades, no flowers, no dirt patches, no seams, no edge cropping.
```

#### earth

```
A seamless square tile of compacted dirt and loose topsoil viewed from directly above. Surface shows small cracks, scattered tiny pebbles (each no larger than 2 pixels), and subtle uneven contours. No grass, no roots, no rocks larger than pebbles. Designed to tile perfectly edge to edge. Warm browns and umber tones — deep reddish-brown shadows, lighter clay-brown highlights. Flat cel shading, clean lineart. Hearthstone/Legends of Runeterra card art style. Soft warm lighting from directly above, even illumination.

NEGATIVE: no grass, no stones larger than pebbles, no footprints, no seams, no edge cropping.
```

```
A seamless square tile of a well-worn dirt path viewed from directly above. Surface is flatter and smoother than raw earth, with subtle packed grooves running horizontally across the tile suggesting foot traffic direction. Lighter dusty brown base with darker compacted streaks. No grass growing through. Designed to tile perfectly edge to edge horizontally and vertically. Flat cel shading, clean lineart. Hearthstone/Legends of Runeterra card art style. Soft warm lighting from directly above.

NEGATIVE: no grass, no rocks, no puddles, no footprints (just generalized wear), no seams.
```

```
A seamless square tile of small angular gravel and crushed stone viewed from directly above. Surface is completely covered in fragments — no bare soil visible. Each stone fragment is a flat cel-shaded polygon shape in cool slate-gray and warm charcoal tones. No single stone larger than a thumbnail at this scale. Designed to tile perfectly edge to edge. Flat cel shading, clean lineart. Hearthstone/Legends of Runeterra card art style. Soft warm lighting from directly above.

NEGATIVE: no soil, no sand, no moss, no single dominant stone, no seams.
```

#### water

```
Flat cel-shaded water surface for third-person shooter terrain.

VISUAL STYLE:
- Opaque surface (no transparency to geometry below)
- Single solid teal-blue base color: RGB 30, 140, 150
- Bright cyan-white wavy highlight lines that move across the surface
- No reflections of environment
- No refraction
- No foam at edges

ANIMATION:
- Two layers of scrolling wave lines moving in opposite directions
- Wave lines are sharp cel-shaded strokes, not smooth gradients
- Wave line color: RGB 180, 240, 250
- Wave line thickness: 2-4 pixels at 1080p equivalent
- Animation speed: slow, calm (not churning)

SHORELINE BEHAVIOR:
- Hard edge where water meets land
- No transparency fade at edges
- No foam or whitewater

LIGHTING:
- Responds to same warm rim light from above as other assets
- Rim light creates a pale amber glow on the far edge of water bodies

NEGATIVE: no transparency, no reflections, no refraction, no foam, no ripples (only wave lines), no caustics, no depth darkening.
```



# licenses

magazine out: https://pixabay.com/de/sound-effects/film-spezialeffekte-gun-magazine-out-384504/
pistol reload: https://pixabay.com/de/sound-effects/film-spezialeffekte-1911-reload-6248/
bullet hole: https://opengameart.org/content/bullet-decal