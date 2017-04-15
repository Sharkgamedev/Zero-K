unitDef = {
  unitname                      = [[missiletower]],
  name                          = [[Hacksaw]],
  description                   = [[Burst Anti-Air Turret]],
  buildCostMetal                = 220,
  builder                       = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX      = 4,
  buildingGroundDecalSizeY      = 4,
  buildingGroundDecalType       = [[missiletower_aoplane.dds]],
  buildPic                      = [[missiletower.png]],
  canAttack                     = true,
  category                      = [[FLOAT]],
  collisionVolumeOffsets        = [[0 12 0]],
  collisionVolumeScales         = [[42 53 42]],
  collisionVolumeType	        = [[CylY]],
  corpse                        = [[DEAD]],

  customParams                  = {
    description_de = [[Flugabwehrraketenturm]],
    helptext       = [[The Hacksaw's twin missiles brutally punish any aircraft that enters their range, but take a considerable amount of time to reload, making them less than ideal against light targets.]],
    helptext_de    = [[Seine Zwillingsraketen schwer beschaedigen jedes Flugzeug in seine Reichweite, brauchen aber eine beachtliche Zeit zum Nachladen, was sie gegen leichtere Ziele nicht sehr effektiv macht.]],
  },

  explodeAs                     = [[SMALL_BUILDINGEX]],
  floater                       = true,
  footprintX                    = 3,
  footprintZ                    = 3,
  iconType                      = [[defenseskirmaa]],
  levelGround                   = false,
  maxDamage                     = 580,
  maxSlope                      = 18,
  minCloakDistance              = 150,
  noAutoFire                    = false,
  noChaseCategory               = [[FIXEDWING LAND SINK TURRET SHIP SATELLITE SWIM GUNSHIP FLOAT SUB HOVER]],
  objectName                    = [[missiletower.s3o]],
  script                        = [[missiletower.lua]],
  selfDestructAs                = [[SMALL_BUILDINGEX]],

  sfxtypes                      = {

    explosiongenerators = {
      [[custom:STORMMUZZLE]],
      [[custom:STORMBACK]],
    },

  },
  sightDistance                 = 500,
  useBuildingGroundDecal        = true,
  waterline						= 10,
  workerTime                    = 0,
  yardMap                       = [[ooooooooo]],

  weapons                       = {

    {
      def                = [[MISSILE]],
      badTargetCategory  = [[GUNSHIP]],
      onlyTargetCategory = [[FIXEDWING GUNSHIP]],
    },

  },


  weaponDefs                    = {

    MISSILE = {
      name                    = [[Homing Missiles]],
      areaOfEffect            = 24,
      burst                   = 2,
      burstrate               = 0.55,
      canattackground         = false,
      cegTag                  = [[missiletrailbluebig]],
      craterBoost             = 0,
      craterMult              = 0,
      cylinderTargeting       = 3,

	  customParams        	  = {
		isaa = [[1]],
		light_color = [[0.5 0.6 0.6]],
	  },

      damage                  = {
        default = 60.1,
        planes  = 600.1,
      },

      explosionGenerator      = [[custom:FLASH2]],
      fireStarter             = 70,
      flightTime              = 3,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 2,
	  leadLimit               = 0,
      model                   = [[wep_m_phoenix.s3o]],
      noSelfDamage            = true,
      range                   = 430,
      reloadtime              = 15,
      smokeTrail              = true,
      soundHit                = [[explosion/ex_med11]],
      soundStart              = [[weapon/missile/missile_fire3]],
      startVelocity           = 700,
      texture2                = [[AAsmoketrail]],
      tracks                  = true,
      turnRate                = 90000,
      turret                  = true,
      weaponAcceleration      = 200,
      weaponType              = [[MissileLauncher]],
      weaponVelocity          = 950,
    },

  },


  featureDefs                   = {

    DEAD  = {
      blocking         = true,
      featureDead      = [[HEAP]],
      footprintX       = 3,
      footprintZ       = 3,
      object           = [[missiletower_dead.s3o]],
    },


    HEAP  = {
      blocking         = false,
      footprintX       = 3,
      footprintZ       = 3,
      object           = [[debris3x3a.s3o]],
    },

  },

}

return lowerkeys({ missiletower = unitDef })
