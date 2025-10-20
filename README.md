# LanSchool Cleanup and Silent Reinstall Script

## Overview

The LanSchool Student software does not properly remove its registry entries during uninstallation, which can cause issues during reinstalls or configuration resets. This batch script automates the complete cleanup and reinstallation process, ensuring all residual LanSchool registry keys—both 64-bit and 32-bit (even those that can repopulate)—are deleted before a silent reinstall.

## Purpose

* Fully remove LanSchool registry keys from both 64-bit and 32-bit registry hives.
* Prevent residual or “ghost” registry entries that reappear after uninstallation.
* Reinstall LanSchool Student silently without user interaction or requiring a restart.
* Enable reliable, fast reinstalls on managed or lab devices.

## How It Works

1. **Registry Cleanup:**
   The script deletes LanSchool entries from both `HKLM` and `HKCU` registry paths, including:

   * `HKLM\SOFTWARE\LanSchool`
   * `HKLM\SOFTWARE\WOW6432Node\LanSchool`
   * Associated MSI installer product keys
     This ensures a completely clean state before reinstallation.

2. **Silent Reinstallation:**
   After cleanup, the script launches the LanSchool Student MSI installer using Windows Installer (`msiexec`) in quiet mode:

   ```
   msiexec /i "Student.msi" CHANNEL=30 /qn /norestart
   ```

   This installs the application silently (`/qn`), sets the channel to 30, and skips rebooting for faster remote deployment.

## Requirements

* Administrative privileges (Run as Administrator)
* Access to the LanSchool **Student.msi** installer
* Windows operating system (supports x86 and x64)

## Usage

1. Place the batch file and **Student.msi** in the same directory or update the script path accordingly.
2. Right-click the batch file and choose **Run as administrator**.
3. The script will:

   * Remove all existing LanSchool registry keys
   * Reinstall LanSchool Student silently
   * Display a confirmation message when complete

## Notes

* No restart is required after execution.
* Ideal for managed devices, classrooms, or labs that require quick and repeatable reinstalls.
* Prevents registry-related errors commonly encountered during manual reinstalls.

## Example Output

```
Registry keys deleted.
Installation initiated silently.
Press any key to continue . . .
```
