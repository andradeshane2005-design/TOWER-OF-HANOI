# Emerald Royal Hanoi

A responsive Tower of Hanoi game with an emerald, pearl-white, midnight-black and champagne-gold royal theme.

## Project files

- `index.html` — screens and semantic UI.
- `style.css` — responsive visual system, mode styling and animations.
- `game.js` — rules, recursive JavaScript solver, audio, timer, settings, leaderboard and local multiplayer.
- `solver.pl` — genuine recursive SWI-Prolog implementation.

## Run the game (browser-only)

1. Install [Visual Studio Code](https://code.visualstudio.com/) if you do not already have it.
2. Create or extract the `Emerald-Royal-Hanoi` folder.
3. Open VS Code → **File → Open Folder** → select `Emerald-Royal-Hanoi`.
4. Open `index.html` in Chrome, Edge, Firefox or another modern browser. You can double-click `index.html` in File Explorer, or use the VS Code **Live Server** extension.
5. Press **ENTER THE ROYAL GAME** once to unlock browser audio.
6. Select a realm, configure player(s), disks and source/destination towers, then begin.

Normal gameplay is offline and does not need PHP, a database, a backend or a server. Google Fonts are imported for typography; the browser uses fallback fonts if offline.

## SWI-Prolog installation and solver test

1. Visit [SWI-Prolog downloads](https://www.swi-prolog.org/download/stable) and install the Windows 64-bit installer.
2. Open **SWI-Prolog** or the SWI-Prolog terminal.
3. Change directory to the project folder, or load the file using its full path:

```prolog
?- consult('C:/path/to/Emerald-Royal-Hanoi/solver.pl').
?- hanoi(3, a, c, b, Moves).
?- length(Moves, Count).
```

The result should contain seven moves. For nine disks it should contain 511 moves.

You can also run the convenience predicate:

```prolog
?- solve_hanoi(3, a, c, b).
```

## Important: browser solver status

The game currently uses **JavaScript Solver · Active (Fallback)** in the browser. This is intentional and transparent: a `.pl` file cannot execute directly in an ordinary browser page, and this project does not bundle a verified SWI-Prolog WebAssembly runtime. The JavaScript solver uses the same recursive algorithm and supports any selected source and destination. The Prolog file is genuine, runnable SWI-Prolog code and can be tested separately as shown above. Do not interpret the browser fallback label as Prolog WASM being active.

## How to play

- Click a tower to select its top disk; click another tower to move it.
- You can also drag the top disk to a different tower.
- A larger disk may never be placed on a smaller disk.
- Select any distinct source and destination tower before starting.
- `1`, `2`, `3`: select Towers A, B, C.
- `U`: undo (single-player only).
- `H`: hint (single-player only).
- `Space`: pause/resume.
- Single-player timer starts on the first valid move.
- In local multiplayer, each player gets an independent board, move count and timer. The next player's clock starts only after pressing **I'M READY**.
- Auto-play is a practice tool. An auto-play-only finish is not saved as a personal victory. A partially assisted manual finish is marked Assisted and is excluded from the leaderboard by default.

## Modes and settings

- EASY — Emerald Garden, 3 disks.
- HARD — Royal Emerald, 5 disks.
- DIFFICULT — Dark Forest Royalty, 7 disks.
- EXPERT — Midnight Emerald, 9 disks.
- Disk count can be set from 3 to 10.
- Settings for audio, particles, reduced motion, timer visibility, default disks, scoring and assisted leaderboard eligibility persist in localStorage.
- The leaderboard is local to the browser profile and device.

## Customization

- **Theme colors:** edit CSS custom properties at the top of `style.css`.
- **Disk appearance:** edit `.disk`, `.mode-hard .disk`, `.mode-difficult .disk` and `.mode-expert .disk`.
- **Tower appearance:** edit `.pole`, `.tower`, `.base` and `.peg-label`.
- **Background:** edit the `body` gradients and `.ambient-*` styles in `style.css`.
- **Animations:** edit CSS keyframes and transitions; the reduced-motion media query is at the bottom.
- **Music and sound:** adjust note arrays in `startMusic()` and tone definitions in `sound()` / `tone()` in `game.js`.
- **Disk defaults:** edit `MODES` and `DEFAULTS` in `game.js`.
- **Auto-play speed:** adjust the delay formula in `startAuto()` or use the speed slider in-game.

## Current implementation notes

- Implemented: all four mode cards and mode-specific disk treatments; arbitrary peg selection; 3–10 disks; move validation; click and drag controls; undo; hint; auto-play; pause; single player; 2–4 local multiplayer; per-player timers and move counts; both scoring criteria; efficiency; local leaderboard; settings persistence; Web Audio sound effects and synthesized ambience; falling particles; responsive layouts and keyboard controls.
- Prolog: `solver.pl` contains the real recursive algorithm. Browser integration with SWI-Prolog WASM is not bundled; browser gameplay uses the explicitly labelled JavaScript fallback.
- Mode-card hover preview is a visual hover treatment with realm ambience; it does not run a separate miniature puzzle simulation.
- Background ambience is synthesized from Web Audio tones rather than recorded music files. Browsers require the first user gesture to enable audio.
- Local multiplayer is pass-and-play on one device, not network multiplayer.

## Data and privacy

Settings and leaderboard entries are stored in this browser's localStorage. Clearing site data or using another browser profile will not carry those records over. The game does not send player names or scores to a server.
