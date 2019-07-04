//in reality, only one of these 3 functions should be necessary
//but I want to make sure this is as safe as possible

%hook IMBalloonPluginDataSource
-(id)_summaryText
{
	id ret = %orig;
	if (![ret isKindOfClass:[NSString class]])
		ret = @"";
	return ret;
}

-(id)_replaceHandleWithContactNameInString:(id)arg1
{
	if (![arg1 isKindOfClass:[NSString class]])
		arg1 = @"";
	return %orig;
}
%end

%hook UIResponder
-(void)doesNotRecognizeSelector:(SEL)selector
{
	if (!sel_isEqual(selector, @selector(__im_handleIdentifiers)))
		%orig;
}
%end