# FNF LCPS NEVER BLOCKED

Personal offline Chromebook copy of Friday Night Funkin' v0.8.6. Your way.

## Download and play

[Download the latest low-memory HTML](https://github.com/LCP-Git-Hub/lcps-never-blocked-fnf/releases/latest/download/FNF-LCPS-All-in-One.html) (about 974 MB).

1. Save **FNF-LCPS-All-in-One.html** in **Downloads** and open it with Chrome.
2. Click **Choose this game HTML** and select that same HTML file from Downloads.
3. Click **Play offline**, then the game's **Touch Here to Play** screen.

Select the HTML once each time you open it. Keep it in place while playing. No extraction, installation, separate asset folder, or internet connection is needed after downloading. The release's **Source code** ZIP contains repository files; download the HTML asset to play.

## Low-memory update — October 27, 2026

The launcher reads requested assets directly from the selected HTML on disk. It no longer parses the whole embedded payload or keeps roughly 730 MB of compressed game data in RAM. Assets decompress one at a time, and temporary image and download Blob URLs are released after loading. High-DPI rendering is disabled.

This addresses startup memory pressure and temporary copies accumulating between songs. Switching between Tutorial, Bopeebo, and Spookeez passed offline in one Chrome session with a 384 MB JavaScript heap limit, with no page errors or missing files. This is not a measurement of total game RAM, and it is not a Chromebook hardware test. Low-memory devices can still run out of memory from decoded textures and audio.

Includes the custom LCPS title logo and intro card. Browser tab title: **Prodigy Education**.

## Controls

Arrow keys / WASD: notes. Enter: select. Escape: back or pause. + / -: volume. 0: mute.

## Troubleshooting

- **Asked to choose the HTML:** this is intentional. It lets the game read assets from disk instead of holding the entire payload in memory.
- **Wrong-file message:** select this updated HTML, not an older release or the checksum.
- **Song takes time to load:** only the requested files are read and expanded. Keep the HTML in Downloads while playing.
- **Still crashes:** close other tabs and apps before playing. The original game can still require substantial graphics and audio memory.
- **Blocked by administrator:** offline packaging does not disable managed-device policies or monitoring.

## Updating a release from Windows

Install the official [GitHub CLI](https://cli.github.com/), run `gh auth login`, and run `./Publish.ps1` in this repository folder. Keep the game HTML beside the repository folder, or provide `-GamePath`. The script verifies its SHA-256 checksum, checks write access, updates the release notes, and uploads the HTML, checksum, and instructions.

## Credits and rights

Original game: The Funkin' Crew Inc.

- [Official v0.8.6 release](https://github.com/FunkinCrew/Funkin/releases/tag/v0.8.6)
- [Official browser game](https://ninja-muffin24.itch.io/funkin)
- [Newgrounds](https://www.newgrounds.com/portal/view/770371)

Original license notices remain included in the game. See [ASSET-LICENSE.txt](ASSET-LICENSE.txt) for the original proprietary asset notice. This is an unofficial customization.
