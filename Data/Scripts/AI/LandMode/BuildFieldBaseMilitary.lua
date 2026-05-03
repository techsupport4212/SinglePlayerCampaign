require("pgevents")

-- Build a field base.

function Definitions()
	
	Category = "Build_Field_Base"
	TaskForce = {
	{
		"MainForce"					
		,"TaskForceRequired"
		,"UC_Rebel_Field_Military_Base | UC_Teradoc_Field_Military_Base | UC_Zsinj_Field_Military_Base | UC_EotH_Field_Military_Base | UC_Corporate_Sector_Field_Military_Base | UC_Eriadu_Field_Military_Base | UC_Pentastar_Field_Military_Base | UC_Hapes_Field_Galney_Base | UC_Hutt_Cartels_Field_Military_Base = 1"
	}
	}

end

function MainForce_Thread()
	-- Build the task force
	-- Blocking shouldn't be necessary, but we'll use it to ease watching the script
	MainForce.Set_Plan_Result(true)
	BlockOnCommand(MainForce.Build_All())
	ScriptExit()
end



