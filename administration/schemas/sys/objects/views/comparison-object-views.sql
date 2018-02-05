--
-- Setting sqlcmdmaxvartypewidth to 0 so as to not limit
-- the number of characters that are returned by object_definition().
-- This scripting variable could also be set with sqlcmd's option -y.
--
:setvar sqlcmdmaxvartypewidth 0


print "sys.all_objects"   ; select object_definition(object_id('sys.all_objects'   ))
print "sys.objects"       ; select object_definition(object_id('sys.objects'       ))
print "sys.sysobjects"    ; select object_definition(object_id('sys.sysobjects'    ))
print "sys.system_objects"; select object_definition(object_id('sys.system_objects'))