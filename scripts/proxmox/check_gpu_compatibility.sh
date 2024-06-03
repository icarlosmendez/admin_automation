#!/bin/bash

# * /******************************************************************/
# * Copyright         : <2024> <Everybody>
# * File Name         : <check_gpu_compatibility.sh>
# * Description       : <Check hardware for AI workload suitability>
# *                    
# * Revision History  :
# * Date		Author 			Comments
# * ------------------------------------------------------------------
# * 05/11/2024	<iCarlosMendez>	<Insprired by new knowledge>
# *
# * /******************************************************************/

# ##################################################### #
# Context

# Purpose: Check existing hardware (CPU/GPU) to see if it is capable of running AI workloads before some eager beaver spends blood sweat and tears, trying to get their machine set up to power local LLM's.

# Prerequisites:
# The desire to run local LLM's.


# Function to check CPU flags
check_cpu_flags() {
    required_flags=("sse" "sse2" "avx" "avx2")
    cpu_flags=$(grep -m 1 -o 'sse\|sse2\|avx\|avx2' /proc/cpuinfo | sort | uniq)

    for flag in "${required_flags[@]}"; do
        if ! echo "$cpu_flags" | grep -q "$flag"; then
            echo "Missing required CPU flag: $flag"
            return 1
        fi
    done
    return 0
}

# Function to check ROCm compatibility (AMD GPU)
check_rocm_compatibility() {
    if lspci | grep -i 'amd' | grep -i 'vga' > /dev/null; then
        echo "AMD GPU detected."
        if check_cpu_flags; then
            echo "This system is capable of running AMD GPU-based workloads (ROCm)."
        else
            echo "This system is not capable of running AMD GPU-based workloads due to missing CPU instruction sets."
        fi
    else
        echo "No AMD GPU detected."
    fi
}

# Function to check CUDA compatibility (Nvidia GPU)
check_cuda_compatibility() {
    if lspci | grep -i 'nvidia' | grep -i 'vga' > /dev/null; then
        echo "Nvidia GPU detected."
        if check_cpu_flags; then
            echo "This system is capable of running Nvidia GPU-based workloads (CUDA)."
        else
            echo "This system is not capable of running Nvidia GPU-based workloads due to missing CPU instruction sets."
        fi
    else
        echo "No Nvidia GPU detected."
    fi
}

# Check CPU instruction sets
echo "Checking CPU instruction sets..."
if check_cpu_flags; then
    echo "Required CPU instruction sets are present."
else
    echo "Required CPU instruction sets are missing. This system may not be capable of running modern GPU-based workloads."
fi

# Check for AMD GPU compatibility
echo "Checking AMD GPU compatibility..."
check_rocm_compatibility

# Check for Nvidia GPU compatibility
echo "Checking Nvidia GPU compatibility..."
check_cuda_compatibility

echo "Hardware compatibility check complete."
