# MonthlyWindowsUpdate
The purpose of this program is to solve the problem of Windows forcing the computer to update and restart at inconvenient times
1. Creates a scheduled task in Windows that checks for Windows updates on the first day of each month and stops when the computer is shut down next
2. The task asks for user confirmation before running so the user can opt to not check for updates that month

# Limitations
Only tested on windows 10 64-bit

# To Run
Either:
1. Run custom_win_update.bat as Administrator (other files must be in the same directory) OR
2. Run custom_win_update.exe as Administrator. (standalone, does not need other files)
