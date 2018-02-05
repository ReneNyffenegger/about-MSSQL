select
  serverproperty('BuildClrVersion'                        ) BuildClrVersion,
  serverproperty('Collation'                              ) Collation,
  serverproperty('CollationID'                            ) CollationID,
  serverproperty('ComparisonStyle'                        ) ComparisonStyle,
  serverproperty('ComputerNamePhysicalNetBIOS'            ) ComputerNamePhysicalNetBIOS,
  serverproperty('Edition'                                ) Edition,
  serverproperty('EditionID'                              ) EditionID,
  serverproperty('EngineEdition'                          ) EngineEdition,
  serverproperty('FilestreamShareName'                    ) FilestreamShareName,
  serverproperty('FilestreamConfiguredLevel'              ) FilestreamConfiguredLevel,
  serverproperty('FilestreamEffectiveLevel'               ) FilestreamEffectiveLevel,
  serverproperty('HadrManagerStatus'                      ) HadrManagerStatus,
  serverproperty('InstanceDefaultLogPath'                 ) InstanceDefaultLogPath,
  serverproperty('InstanceName'                           ) InstanceName,
  serverproperty('IsAdvancedAnalyticsInstalled'           ) IsAdvancedAnalyticsInstalled,
  serverproperty('IsClustered'                            ) IsClustered,
  serverproperty('IsFullTextInstalled'                    ) IsFullTextInstalled,
  serverproperty('IsHadrEnabled'                          ) IsHadrEnabled,
  serverproperty('IsIntegratedSecurityOnly'               ) IsIntegratedSecurityOnly,
  serverproperty('IsLocalDB'                              ) IsLocalDB,
  serverproperty('IsPolybaseInstalled'                    ) IsPolybaseInstalled,
  serverproperty('IsSingleUser'                           ) IsSingleUser,
  serverproperty('IsXTPSuported'                          ) IsXTPSuported,
  serverproperty('LCID'                                   ) LCID,
  serverproperty('LicenseType'                            ) LicenseType,
  serverproperty('MachineNmae'                            ) MachineNmae,
  serverproperty('NumLicenses'                            ) NumLicenses,
  serverproperty('ProcessID'                              ) ProcessID,
  serverproperty('ProductBuild'                           ) ProductBuild,
  serverproperty('ProductBuildType'                       ) ProductBuildType,
  serverproperty('ProductLevel'                           ) ProductLevel,
  serverproperty('ProductMajorVersion'                    ) ProductMajorVersion,
  serverproperty('ProductMinorVersion'                    ) ProductMinorVersion,
  serverproperty('ProductUpdateLevel'                     ) ProductUpdateLevel,
  serverproperty('ProductUpdateReference'                 ) ProductUpdateReference,
  serverproperty('ProductVersion'                         ) ProductVersion,
  serverproperty('ResourceLastUpdateDateTime'             ) ResourceLastUpdateDateTime,
  serverproperty('ResourceVersion'                        ) ResourceVersion,
  serverproperty('ServerName'                             ) ServerName,
  serverproperty('SqlCharSet'                             ) SqlCharSet,
  serverproperty('SqlCharSetName'                         ) SqlCharSetName,
  serverproperty('SqlSortOrder'                           ) SqlSortOrder,
  serverproperty('SqlSortOrderName'                       ) SqlSortOrderName

go