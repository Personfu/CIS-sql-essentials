# Appendix A: Installing MySQL Software (Windows)

## Step 1: Download the official installer
1. Open your browser and go to https://dev.mysql.com/downloads/installer/.
2. Download the "MySQL Installer for Windows" (recommended version).
3. Save the installer to a known folder.
4. Use the `Developer Default` installation type to include MySQL Server, Workbench, Shell, and utilities.
5. Click `Next` and accept the license agreement.

---

## Step 2: Run the installer
1. Double-click the downloaded installer.
2. Select `Developer Default` and continue.
3. Click `Next` until installation begins.

## Step 3: Configure MySQL Server
1. Choose `Development Computer` for default settings.
2. Set a strong root password and store it securely.
3. Optionally create a named user account for your course work.
4. Keep port `3306` unless there is a port conflict.

## Step 4: Verify installation
1. Open MySQL Workbench.
2. Create a new connection using `localhost`, port `3306`, and the root password.
3. Test the connection.
4. In the SQL editor, run:
SELECT VERSION();
SELECT @@character_set_server;

## Troubleshooting
- If the installer fails, restart Windows and run the installer as administrator.
- If port `3306` is already in use, choose a free port and update the connection settings.
- If MySQL Workbench cannot connect, verify that the MySQL service is running in Windows Services.

---

For additional help, consult the MySQL documentation or the course support resources.