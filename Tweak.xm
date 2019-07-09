//in reality, only one of these 3 functions should be necessary
//but I want to make sure this is as safe as possible

%hook IMBalloonPluginDataSource
-(id)_summaryText
{
	id ret = %orig;
	if (ret && ![ret isKindOfClass:[NSString class]])
		ret = @"";
	return ret;
}

-(id)_replaceHandleWithContactNameInString:(id)arg1
{
	if (arg1 && ![arg1 isKindOfClass:[NSString class]])
		arg1 = @"";
	return %orig;
}
%end
