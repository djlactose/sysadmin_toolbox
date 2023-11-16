echo "NOTE: When you change the password of a user other than yourself it will ask them to change it upon login."
echo ""
read -p "Enter the username for password change (leave blank to change your own): "
echo "\"$REPLY\""
if [ "$REPLY" = "" ]; then
    passwd
else
    passwd $REPLY
    chage -d 0 $REPLY
fi