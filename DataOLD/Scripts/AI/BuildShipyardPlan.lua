-- $Id: //depot/Projects/StarWars_Expansion/Run/Data/Scripts/AI/UpgradeStarbasePlan.lua#1 $
--/////////////////////////////////////////////////////////////////////////////////////////////////
--
-- (C) Petroglyph Games, Inc.
--
--
--  *****           **                          *                   *
--  *   **          *                           *                   *
--  *    *          *                           *                   *
--  *    *          *     *                 *   *          *        *
--  *   *     *** ******  * **  ****      ***   * *      * *****    * ***
--  *  **    *  *   *     **   *   **   **  *   *  *    * **   **   **   *
--  ***     *****   *     *   *     *  *    *   *  *   **  *    *   *    *
--  *       *       *     *   *     *  *    *   *   *  *   *    *   *    *
--  *       *       *     *   *     *  *    *   *   * **   *   *    *    *
--  *       **       *    *   **   *   **   *   *    **    *  *     *   *
-- **        ****     **  *    ****     *****   *    **    ***      *   *
--                                          *        *     *
--                                          *        *     *
--                                          *       *      *
--                                      *  *        *      *
--                                      ****       *       *
--
--/////////////////////////////////////////////////////////////////////////////////////////////////
-- C O N F I D E N T I A L   S O U R C E   C O D E -- D O   N O T   D I S T R I B U T E
--/////////////////////////////////////////////////////////////////////////////////////////////////
--
--              $File: //depot/Projects/StarWars_Expansion/Run/Data/Scripts/AI/UpgradeStarbasePlan.lua $
--
--    Original Author: James Yarrow
--
--            $Author: Andre_Arsenault $
--
--            $Change: 37816 $
--
--          $DateTime: 2006/02/15 15:33:33 $
--
--          $Revision: #1 $
--
--/////////////////////////////////////////////////////////////////////////////////////////////////

require("pgevents")

-- Tell the script pooling system to pre-cache this number of scripts.
ScriptPoolCount = 16

function Definitions()
	DebugMessage("%s -- In Definitions", tostring(Script))
	
	Category = "Build_Shipyard"
	IgnoreTarget = true
	TaskForce = {
	{
		"BaseForce",
		"NewRepublic_Shipyard_Level_One | NewRepublic_Shipyard_Level_Two | NewRepublic_Shipyard_Level_Three | NewRepublic_Shipyard_Level_Four |"..
		"Empire_Shipyard_Level_One | Empire_Shipyard_Level_Two | Empire_Shipyard_Level_Three | Empire_Shipyard_Level_Four |"..
		"Holdout_Shipyard_Level_One | Holdout_Shipyard_Level_Two | Holdout_Shipyard_Level_Three | Holdout_Shipyard_Level_Four |"..
		"Zsinj_Shipyard_Level_One | Zsinj_Shipyard_Level_Two | Zsinj_Shipyard_Level_Three | Zsinj_Shipyard_Level_Four |"..
		"Greater_Maldrood_Shipyard_Level_One | Greater_Maldrood_Shipyard_Level_Two | Greater_Maldrood_Shipyard_Level_Three | Greater_Maldrood_Shipyard_Level_Four |"..
		"Eriadu_Shipyard_Level_One | Eriadu_Shipyard_Level_Two | Eriadu_Shipyard_Level_Three | Eriadu_Shipyard_Level_Four |"..
		"Pentastar_Shipyard_Level_One | Pentastar_Shipyard_Level_Two | Pentastar_Shipyard_Level_Three | Pentastar_Shipyard_Level_Four |"..
		"Imperial_Proteus_Shipyard_Level_One | Imperial_Proteus_Shipyard_Level_Two | Imperial_Proteus_Shipyard_Level_Three | Imperial_Proteus_Shipyard_Level_Four |"..
		"Hapan_Shipyard_Royal | Hapan_Shipyard_Thane | Hapan_Shipyard_Maluri |"..
		"Hapan_Shipyard_Corr | Hapan_Shipyard_Requud | Hapan_Shipyard_Galney | Hapan_Shipyard_AlGray |"..
		"Chiss_Shipyard_Level_One | Chiss_Shipyard_Level_Two | Chiss_Shipyard_Level_Three | Chiss_Shipyard_Level_Four |"..
		"EotH_Shipyard_Level_One | EotH_Shipyard_Level_Two | EotH_Shipyard_Level_Three | EotH_Shipyard_Level_Four |"..
		"CSA_Shipyard_Level_One | CSA_Shipyard_Level_Two | CSA_Shipyard_Level_Three | CSA_Shipyard_Level_Four |"..
		"Yevetha_Shipyard_Level_One | Yevetha_Shipyard_Level_Two | Yevetha_Shipyard_Level_Three | Yevetha_Shipyard_Level_Four |"..
		"Hutt_Shipyard_Level_One | Hutt_Shipyard_Level_Two | Hutt_Shipyard_Level_Three | Hutt_Shipyard_Level_Four = 1"
	}
	}

	DebugMessage("%s -- Done Definitions", tostring(Script))
end

function BaseForce_Thread()
	DebugMessage("%s -- In BaseForce_Thread.", tostring(Script))
	
	BaseForce.Set_As_Goal_System_Removable(false)
	AssembleForce(BaseForce)
	
	BaseForce.Set_Plan_Result(true)
	DebugMessage("%s -- BaseForce done!", tostring(Script));
	ScriptExit()
end

function BaseForce_Production_Failed(tf, failed_object_type)
	DebugMessage("%s -- Abandonning plan owing to production failure.", tostring(Script))
	ScriptExit()
end