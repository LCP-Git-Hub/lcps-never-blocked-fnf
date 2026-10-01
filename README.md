# FNF LCPS Offline

Personal offline Chromebook copy of Friday Night Funkin' v0.8.6, with the requested LCPS title logo and intro card.

## Download and play

Open this repository's **Releases** page and download **FNF-LCPS-All-in-One.html**. The file is approximately 974 MB. On a Chromebook, save it in Downloads, open it with Chrome, wait for loading, and click **Play offline**. All game data is embedded in the file.

The game HTML is a release attachment, not a normal Git file. GitHub blocks ordinary Git files larger than 100 MiB; release attachments can be under 2 GiB.

## Publish from Windows

Keep this folder next to `FNF-LCPS-All-in-One.html` and its `.sha256` file. Install the official GitHub CLI from https://cli.github.com/ and run `gh auth login`. Then run `./Publish.ps1` from PowerShell in this folder. The script creates a **private** repository under your signed-in account and attaches the HTML to release `offline-v0.8.6`.

Sign into the same GitHub account on your Chromebook to download a private release.

## Credits and rights

Original game: The Funkin' Crew Inc.
Official release: https://github.com/FunkinCrew/Funkin/releases/tag/v0.8.6
Official browser game: https://ninja-muffin24.itch.io/funkin

The original game assets are proprietary. The included asset notice says they may not be publicly distributed by anyone but the copyright owner. Keep this personal transfer repository private. Original license notices remain embedded in the HTML.

This offline file does not disable managed-device policies or monitoring.
