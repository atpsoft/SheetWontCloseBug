# SheetWontCloseBug

This is an example of a bug where a sheet will not close when dismissing it
if a menu is open.

If you run this app on a device (it doesn't happen in the simulator)

then tap "Open Sheet"
then tap "Select Day"
then tap "Tap to Dismiss"
the sheet won't close.

if you skip the "Select Day" step, or you select a Day, so the menu closes,
then the "Tap to Dismiss" works as expected.
