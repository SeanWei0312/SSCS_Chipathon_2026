# SSCS Chipathon 2026 Project

This repository contains the working files for my SSCS Chipathon 2026 project. It is organized around the official Chipathon files, IC design, PCB design, simulation outputs, measurement results, Docker instructions, and project documentation.

## Upstream Repository

The official Chipathon files were cloned from:

[sscs-ose/sscs-chipathon-2026](https://github.com/sscs-ose/sscs-chipathon-2026)

## Project Structure

```text
.
├── 2026-sscs-chipathon/
│   ├── docs/
│   ├── examples/
│   ├── resources/
│   └── schedule/
├── Design_Files/
│   ├── IC Design/
│   │   ├── Schematic/
│   │   └── Layout/
│   └── PCB Design/
│       ├── Schematic/
│       └── Layout/
├── Measurement_Results/
│   ├── IC_Simulation/
│   ├── PCB_Simulation/
│   └── Test_Measurement/
├── Docker_Instructions.md
├── Project_Report.md
└── README.md
```

## Directory Guide

- `2026-sscs-chipathon/` - Official SSCS Chipathon 2026 files, examples, resources, and documentation cloned from [sscs-ose/sscs-chipathon-2026](https://github.com/sscs-ose/sscs-chipathon-2026).
- `Design_Files/IC Design/Schematic/` - IC schematics, symbols, design notes, and related source files.
- `Design_Files/IC Design/Layout/` - IC layout files, layout exports, DRC/LVS notes, and verification outputs.
- `Design_Files/PCB Design/Schematic/` - PCB schematic files, component notes, and design documentation.
- `Design_Files/PCB Design/Layout/` - PCB layout files, board outputs, manufacturing files, and design checks.
- `Measurement_Results/IC_Simulation/` - IC simulation testbenches, raw outputs, plots, and summaries.
- `Measurement_Results/PCB_Simulation/` - PCB-level simulation files, signal integrity checks, and analysis results.
- `Measurement_Results/Test_Measurement/` - Lab measurements, instrument captures, data files, plots, and post-processing notes.
- `Docker_Instructions.md` - Mac and Windows commands for starting, opening, checking, stopping, and deleting the Docker container.
- `Project_Report.md` - Main project report draft.

## Docker Instructions

Use `Docker_Instructions.md` to start the Chipathon Docker environment.

Main access options:

- TigerVNC Viewer: `localhost:5901`
- Web browser / noVNC: `http://localhost:80/?password=abc123`

Inside Docker, the shared design folder is:

```text
/foss/designs
```

## Suggested Workflow

1. Start Docker using `Docker_Instructions.md`.
2. Store source design files in the matching `Design_Files/` schematic or layout folder.
3. Save simulation outputs and plots in the matching `Measurement_Results/` simulation folder.
4. Save lab data and measurement plots in `Measurement_Results/Test_Measurement/`.
5. Update `Project_Report.md` whenever design decisions, simulation results, and measurement results change.

## Project Status

| Area | Status | Notes |
| --- | --- | --- |
| IC schematic | In progress | Add current design files and notes. |
| IC layout | Not started | Add layout files and verification results when available. |
| IC simulation | In progress | Save plots and simulation summaries in `Measurement_Results/IC_Simulation/`. |
| PCB schematic | Not started | Add schematic files and component decisions when available. |
| PCB layout | Not started | Add board files and checks when available. |
| PCB simulation | Not started | Save simulation outputs in `Measurement_Results/PCB_Simulation/`. |
| Measurement | Not started | Save lab results in `Measurement_Results/Test_Measurement/`. |
