#import <Flipswitch/Flipswitch.h>

%hook FLASHFlashController
-(void)flashButtonTapped:(id)button {
	%orig();

	// update flipswitch state
	NSString *flashlightSwitchIdentifier = @"com.a3tweaks.switch.flashlight";
	FSSwitchPanel *fsp = [FSSwitchPanel sharedPanel];

	FSSwitchState state = [fsp stateForSwitchIdentifier:flashlightSwitchIdentifier];
	switch (state) {
		case FSSwitchStateOff:
			[fsp setState:FSSwitchStateOn forSwitchIdentifier:flashlightSwitchIdentifier];
			break;
		case FSSwitchStateOn:
		default:
			[fsp setState:FSSwitchStateOff forSwitchIdentifier:flashlightSwitchIdentifier];
			break;
	}
}
%end