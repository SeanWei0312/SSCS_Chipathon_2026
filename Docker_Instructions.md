# SSCS Chipathon 2026 Docker Instructions

This document explains how to use the SSCS Chipathon 2026 Docker environment.

## Mac Instructions

### Project Location

On your Mac, the main project folder is:

```bash
~/eda/designs/SSCS_Chipathon_2026
```

Inside Docker, the same folder appears as:

```bash
/foss/designs/SSCS_Chipathon_2026
```

Files saved under `/foss/designs/SSCS_Chipathon_2026` are saved directly on your Mac in `~/eda/designs/SSCS_Chipathon_2026`.

### Start Chipathon Docker

Run:

```bash
cd ~/eda/designs/SSCS_Chipathon_2026/2026-sscs-chipathon/resources/IIC-OSIC-TOOLS
./start_chipathon_vnc.sh
```

Then open this in your browser:

```text
http://localhost:80/?password=abc123
```

### Check Running Containers

Run:

```bash
docker ps
```

This shows only currently running containers.

### Check All Containers

Run:

```bash
docker ps -a
```

This shows both running and stopped containers.

### Stop Chipathon Docker

Run:

```bash
docker stop iic-osic-tools_chipathon_xvnc_uid_501
```

Closing the browser does not stop Docker. The browser is only the VNC viewer.

### Stop All Running Containers

Run:

```bash
docker stop $(docker ps -q)
```

Use this only if you want to stop all running Docker containers.

### Remove All Stopped Containers

Run:

```bash
docker container prune
```

Then type:

```text
y
```

This removes stopped containers. It does not delete project files stored in:

```bash
~/eda/designs/SSCS_Chipathon_2026
```

### GitHub Sync Reminder

Docker saves files to the Mac folder, but it does not automatically push to GitHub.

Run these commands to sync your work:

```bash
cd ~/eda/designs/SSCS_Chipathon_2026
git status
git add .
git commit -m "update chipathon design"
git push
```

### Daily Workflow

1. Start Docker with `start_chipathon_vnc.sh`.
2. Work inside `/foss/designs/SSCS_Chipathon_2026`.
3. Stop Docker with `docker stop`.
4. Commit and push changes to GitHub.

## Windows Instructions

Windows instructions will be added later.
