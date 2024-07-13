# Free Vibration Simulation using Newmark's Algorithm

Course AE233-Vibrations

This repository contains a MATLAB script to simulate the free vibration response of a single-degree-of-freedom (SDOF) system with different damping ratios using Newmark's algorithm.

## Overview

The script performs the following tasks:
1. Initializes the system parameters including mass, natural frequency, initial conditions, and damping ratios.
2. Uses Newmark's algorithm to simulate the system's response over a specified duration and time step.
3. Plots the displacement and velocity responses for different damping ratios.

## Parameters

- `m`: Mass of the system (kg)
- `wn`: Natural frequency of the system (rad/s)
- `zeta_values`: Array of damping ratios to be simulated
- `x0`: Initial displacement (m)
- `v0`: Initial velocity (m/s)
- `duration`: Total simulation time (s)
- `dt`: Time step (s)

## Newmark's Algorithm

Newmark's algorithm is an integration method used to solve differential equations of motion. The script uses the following parameters for Newmark's method:
- `beta = 0.25`
- `gamma = 0.5`

## Output

The script generates two plots:
1. Displacement response over time for different damping ratios.
2. Velocity response over time for different damping ratios.

## Usage

1. Clone the repository to your local machine.
2. Open MATLAB and navigate to the directory containing the script.
3. Run the script to perform the simulation and generate the plots.