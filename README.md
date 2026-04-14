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

### weapons

#### rifle

```
Oversized matte black assault rifle, ACR/SCAR/G36 hybrid, angular polymer body, darkened rail system, chunky foregrip, thick blackened barrel with muzzle brake. Near-black finish with minimal metallic sheen.

White background. Clean lineart, flat cel shading, Hearthstone/Legends of Runeterra card art style, heroic silhouette, warmer lighting, soft rim light from above.
```

- [Details](https://www.seaart.ai/explore/detail/d7f30u5e878c738kbk3g?pt=) - [Direct](https://image.cdn2.seaart.me/2026-04-14/d7f25tde878c73bjup00/5ec54ee411d899d86fcd750d36b7d600_high.webp)
- [Details]() - [Direct]()
- [Details]() - [Direct]()
- [Details]() - [Direct]()

#### hammer

```
Oversized war hammer, brutally simple. Unnaturally long haft — far longer than any practical weapon, exaggerated and surreal, like a cartoon or tarot card weapon. The haft is thick, dark stained hardwood wrapped in black leather along the lower grip zone only. The upper two-thirds of the haft is bare dark wood, unnaturally straight and uniform.

Hammer head is massive — carved from near-black jagged obsidian or dark volcanic stone, not polished iron. The stone has a matte, slightly granular surface with faint ashy grey undertones and minimal rust-orange streaks.

Hammer head shape: symmetrical blunt block on both sides. No beak, no spike, no point. Just a rectangular or slightly tapered crushing block. Both striking faces are flat and clean — unmarked, fresh.

Shaft reinforced with two dark iron bands wrapped around the haft just below the head. No metal elsewhere on the shaft.

Butt cap: simple flat dark iron ring, no spike.

Silhouette: surreal and top-heavy. The hammer head is a massive dark block. The haft extends far downward past where a normal weapon would end — unnaturally long, creating a strange elegant line beneath a brutal crushing head.

White background. Clean lineart, flat cel shading, Hearthstone/Legends of Runeterra card art style, heroic silhouette, warmer lighting, soft rim light from above.

NEGATIVE: no beak, no spike, no point on the hammer head, no glowing elements, no ornate details, no chains, no skulls, no wrap above the lower grip, no polished metal surfaces, no wear marks or chips.
```

- [Details]() - [Direct]()
- [Details]() - [Direct]()
- [Details]() - [Direct]()
- [Details]() - [Direct]()

#### spear

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

- [Details](https://www.seaart.ai/explore/detail/d7f37sde878c739va5l0?pt=) - [Direct](https://image.cdn2.seaart.me/2026-04-14/d7f35ide878c73b0l3kg/bce9e46ed23d19047f2535e03398b739_high.webp)
- [Details]() - [Direct]()
- [Details]() - [Direct]()
- [Details]() - [Direct]()



# licenses

magazine out: https://pixabay.com/de/sound-effects/film-spezialeffekte-gun-magazine-out-384504/
pistol reload: https://pixabay.com/de/sound-effects/film-spezialeffekte-1911-reload-6248/
bullet hole: https://opengameart.org/content/bullet-decal