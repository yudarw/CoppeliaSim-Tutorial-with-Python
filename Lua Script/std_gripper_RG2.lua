function sysCall_init()
    modelBase=sim.getObject('.')
    motorHandle=sim.getObject('./openCloseJoint')
end


function sysCall_actuation()
    local activity=sim.readCustomDataBlock(modelBase,'activity')
    if activity then
        activity=sim.unpackTable(activity)
    else
        activity={velocity=0,force=0}
    end

    sim.setJointTargetForce(motorHandle,activity.force)
    sim.setJointTargetVelocity(motorHandle,activity.velocity)
end
