require("pgevents")

function Definitions()
	DebugMessage("%s -- In Definitions", tostring(Script))

	Category = "Build_Capital"
	IgnoreTarget = true
	TaskForce = {
	{
		"StructureForce",
		"Empire_Capital | PA_Capital | Maldrood_Capital | Eriadu_Capital | NewRep_Capital | Rancor_Base | ZE_Capital_Alternate | CSA_Capital | EOTH_Capital | Hapan_Capital | Hutt_Capital = 1"
	}
	}

	DebugMessage("%s -- Done Definitions", tostring(Script))
end

function StructureForce_Thread()
	DebugMessage("%s -- In StructureForce_Thread.", tostring(Script))
	
	Purge_Goals(PlayerObject)
	
	StructureForce.Set_As_Goal_System_Removable(false)
	AssembleForce(StructureForce)
	
	StructureForce.Set_Plan_Result(true)
	
	--Clean out MajorItem budget
	Budget.Flush_Category("MajorItem")
	DebugMessage("%s -- StructureForce done!", tostring(Script));
	ScriptExit()
end

function StructureForce_Production_Failed(tf, failed_object_type)
	DebugMessage("%s -- Abandonning plan owing to production failure.", tostring(Script))
	ScriptExit()
end
