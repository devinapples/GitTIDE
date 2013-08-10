#!/system/bin/sh
clear

echo "Super Awesome Terminal IDE Installer"
echo "===================================="
#Create Default Folder Paths
echo "     Creating Needed Folders..."
mkdir -p ~/My_Programming
mkdir -p ~/My_Programming/Config
mkdir -p ~/.ssh
echo ""

echo "     Creating GitSSH..."
# Here Document for the ssh "alias"
cat << 'EOF' > ~/My_Programming/Config/GitShell
#!/system/bin/sh
exec ssh -i ~/.ssh/id_rsa "$@"
EOF
chmod 777 ~/My_Programming/Config/GitShell
echo ""

echo "     Configuring bashrc..."
echo "export GIT_SSH=/data/data/com.spartacusrex.spartacuside/files/My_Programming/Config/GitShell" >> ~/.bashrc
echo ""

echo "     Generating SSH Keys with DropBear:"
dropbearkey -t rsa -f ~/.ssh/id_rsa
echo""

echo "     Saving Public SSH key to ~/.ssh/id_rsa.pub"
dropbearkey -y -f ~/.ssh/id_rsa | grep "^ssh-rsa" >> ~/.ssh/id_rsa.pub
echo ""

echo "     Placing Key on SDCARD"
cp ~/.ssh/id_rsa.pub /sdcard/key.pub
echo ""
echo "     To view your key (e.g. to be able to paste it to get hub) open the following link with the Internet Browser:"
echo "          file:///sdcard/key.pub"
echo ""
echo "FIN"
