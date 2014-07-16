#! /bin/bash

# Create a Qt Creator project file from a lego source/product.
# You should do a "set_lego_product product_name" or "lego product_name" first,
# build the # project, then run this script.

set +u
if [ -z "$LEGO_PRODUCT" ]; then
    echo "Run 'lego product_name' first"
    exit 1
fi
if [ ! -d $LEGO_OUTPUT/include ]; then
    echo "Output include files not found. Perform an initial 'make' first"
    exit 1
fi

PROJNAME=$LEGO_ROOT/$LEGO_PRODUCT
if [ ! -z "$1" ]; then
    PROJNAME=$LEGO_ROOT/$1_$LEGO_PRODUCT
fi
cd $LEGO_ROOT
find proprietary opensource thirdparty products/$LEGO_PRODUCT \
    $LEGO_OUTPUT/include -type f -iname '*.cpp' -or -iname '*.h' -or \
    -iname 'Makefile' -or -iname '*.mk' -or -iname '*.sh'-or \
    -iname '*.cfg' -or -iname '.config' -or -iname '*.menu'> $PROJNAME.files
find proprietary opensource thirdparty $LEGO_OUTPUT/include \
    $LEGO_OUTPUT/thirdparty-include -type d > $PROJNAME.includes
echo "[General]" > $PROJNAME.creator
echo "// ADD PREDEFINED MACROS HERE!" > $PROJNAME.config
echo '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE QtCreatorProject>
<!-- Written by QtCreator 3.0.1, 2014-07-03T14:59:55. -->
<qtcreator>
 <data>
  <variable>ProjectExplorer.Project.ActiveTarget</variable>
  <value type="int">0</value>
 </data>
 <data>
  <variable>ProjectExplorer.Project.EditorSettings</variable>
  <valuemap type="QVariantMap">
   <value type="bool" key="EditorConfiguration.AutoIndent">true</value>
   <value type="bool" key="EditorConfiguration.AutoSpacesForTabs">false</value>
   <value type="bool" key="EditorConfiguration.CamelCaseNavigation">true</value>
   <valuemap type="QVariantMap" key="EditorConfiguration.CodeStyle.0">
    <value type="QString" key="language">Cpp</value>
    <valuemap type="QVariantMap" key="value">
     <value type="QByteArray" key="CurrentPreferences">CppGlobal</value>
    </valuemap>
   </valuemap>
   <valuemap type="QVariantMap" key="EditorConfiguration.CodeStyle.1">
    <value type="QString" key="language">QmlJS</value>
    <valuemap type="QVariantMap" key="value">
     <value type="QByteArray" key="CurrentPreferences">QmlJSGlobal</value>
    </valuemap>
   </valuemap>
   <value type="int" key="EditorConfiguration.CodeStyle.Count">2</value>
   <value type="QByteArray" key="EditorConfiguration.Codec">UTF-8</value>
   <value type="bool" key="EditorConfiguration.ConstrainTooltips">false</value>
   <value type="int" key="EditorConfiguration.IndentSize">4</value>
   <value type="bool" key="EditorConfiguration.KeyboardTooltips">false</value>
   <value type="bool" key="EditorConfiguration.MouseNavigation">true</value>
   <value type="int" key="EditorConfiguration.PaddingMode">1</value>
   <value type="bool" key="EditorConfiguration.ScrollWheelZooming">true</value>
   <value type="int" key="EditorConfiguration.SmartBackspaceBehavior">0</value>
   <value type="bool" key="EditorConfiguration.SpacesForTabs">false</value>
   <value type="int" key="EditorConfiguration.TabKeyBehavior">2</value>
   <value type="int" key="EditorConfiguration.TabSize">4</value>
   <value type="bool" key="EditorConfiguration.UseGlobal">true</value>
   <value type="int" key="EditorConfiguration.Utf8BomBehavior">1</value>
   <value type="bool" key="EditorConfiguration.addFinalNewLine">true</value>
   <value type="bool" key="EditorConfiguration.cleanIndentation">true</value>
   <value type="bool" key="EditorConfiguration.cleanWhitespace">true</value>
   <value type="bool" key="EditorConfiguration.inEntireDocument">false</value>
  </valuemap>
 </data>
 <data>
  <variable>ProjectExplorer.Project.PluginSettings</variable>
  <valuemap type="QVariantMap"/>
 </data>
 <data>
  <variable>ProjectExplorer.Project.Target.0</variable>
  <valuemap type="QVariantMap">
   <value type="QString" key="ProjectExplorer.ProjectConfiguration.DefaultDisplayName">Desktop</value>
   <value type="QString" key="ProjectExplorer.ProjectConfiguration.DisplayName">Desktop</value>
   <value type="QString" key="ProjectExplorer.ProjectConfiguration.Id">{81937c6a-1a31-4884-bac6-d3fb4897f25b}</value>
   <value type="int" key="ProjectExplorer.Target.ActiveBuildConfiguration">0</value>
   <value type="int" key="ProjectExplorer.Target.ActiveDeployConfiguration">0</value>
   <value type="int" key="ProjectExplorer.Target.ActiveRunConfiguration">0</value>
   <valuemap type="QVariantMap" key="ProjectExplorer.Target.BuildConfiguration.0">
    <value type="QString" key="ProjectExplorer.BuildConfiguration.BuildDirectory">'$LEGO_PRODUCT_DIR'</value>
    <valuemap type="QVariantMap" key="ProjectExplorer.BuildConfiguration.BuildStepList.0">
     <valuemap type="QVariantMap" key="ProjectExplorer.BuildStepList.Step.0">
      <valuelist type="QVariantList" key="GenericProjectManager.GenericMakeStep.BuildTargets">
       <!--
	<value type="QString">all</value>
	-->
      </valuelist>
      <value type="bool" key="GenericProjectManager.GenericMakeStep.Clean">false</value>
      <value type="QString" key="GenericProjectManager.GenericMakeStep.MakeArguments"></value>
      <value type="QString" key="GenericProjectManager.GenericMakeStep.MakeCommand"></value>
      <value type="bool" key="ProjectExplorer.BuildStep.Enabled">true</value>
      <value type="QString" key="ProjectExplorer.ProjectConfiguration.DefaultDisplayName">Make</value>
      <value type="QString" key="ProjectExplorer.ProjectConfiguration.DisplayName"></value>
      <value type="QString" key="ProjectExplorer.ProjectConfiguration.Id">GenericProjectManager.GenericMakeStep</value>
     </valuemap>
     <value type="int" key="ProjectExplorer.BuildStepList.StepsCount">1</value>
     <value type="QString" key="ProjectExplorer.ProjectConfiguration.DefaultDisplayName">Build</value>
     <value type="QString" key="ProjectExplorer.ProjectConfiguration.DisplayName"></value>
     <value type="QString" key="ProjectExplorer.ProjectConfiguration.Id">ProjectExplorer.BuildSteps.Build</value>
    </valuemap>
    <valuemap type="QVariantMap" key="ProjectExplorer.BuildConfiguration.BuildStepList.1">
     <valuemap type="QVariantMap" key="ProjectExplorer.BuildStepList.Step.0">
      <valuelist type="QVariantList" key="GenericProjectManager.GenericMakeStep.BuildTargets">
       <value type="QString">clean</value>
      </valuelist>
      <value type="bool" key="GenericProjectManager.GenericMakeStep.Clean">true</value>
      <value type="QString" key="GenericProjectManager.GenericMakeStep.MakeArguments"></value>
      <value type="QString" key="GenericProjectManager.GenericMakeStep.MakeCommand"></value>
      <value type="bool" key="ProjectExplorer.BuildStep.Enabled">true</value>
      <value type="QString" key="ProjectExplorer.ProjectConfiguration.DefaultDisplayName">Make</value>
      <value type="QString" key="ProjectExplorer.ProjectConfiguration.DisplayName"></value>
      <value type="QString" key="ProjectExplorer.ProjectConfiguration.Id">GenericProjectManager.GenericMakeStep</value>
     </valuemap>
     <value type="int" key="ProjectExplorer.BuildStepList.StepsCount">1</value>
     <value type="QString" key="ProjectExplorer.ProjectConfiguration.DefaultDisplayName">Clean</value>
     <value type="QString" key="ProjectExplorer.ProjectConfiguration.DisplayName"></value>
     <value type="QString" key="ProjectExplorer.ProjectConfiguration.Id">ProjectExplorer.BuildSteps.Clean</value>
    </valuemap>
    <value type="int" key="ProjectExplorer.BuildConfiguration.BuildStepListCount">2</value>
    <value type="bool" key="ProjectExplorer.BuildConfiguration.ClearSystemEnvironment">true</value>
    <valuelist type="QVariantList" key="ProjectExplorer.BuildConfiguration.UserEnvironmentChanges">' \
	> $PROJNAME.creator.user
    echo '     <value type="QString">PATH='$PATH'</value>' >> $PROJNAME.creator.user
    env | grep '^LEGO_' | while read e; do
        echo '     <value type="QString">'$e'</value>' >> $PROJNAME.creator.user
    done
    echo '    </valuelist>
    <value type="QString" key="ProjectExplorer.ProjectConfiguration.DefaultDisplayName">Default</value>
    <value type="QString" key="ProjectExplorer.ProjectConfiguration.DisplayName">Default</value>
    <value type="QString" key="ProjectExplorer.ProjectConfiguration.Id">GenericProjectManager.GenericBuildConfiguration</value>
   </valuemap>
   <value type="int" key="ProjectExplorer.Target.BuildConfigurationCount">1</value>
   <valuemap type="QVariantMap" key="ProjectExplorer.Target.DeployConfiguration.0">
    <valuemap type="QVariantMap" key="ProjectExplorer.BuildConfiguration.BuildStepList.0">
     <value type="int" key="ProjectExplorer.BuildStepList.StepsCount">0</value>
     <value type="QString" key="ProjectExplorer.ProjectConfiguration.DefaultDisplayName">Deploy</value>
     <value type="QString" key="ProjectExplorer.ProjectConfiguration.DisplayName"></value>
     <value type="QString" key="ProjectExplorer.ProjectConfiguration.Id">ProjectExplorer.BuildSteps.Deploy</value>
    </valuemap>
    <value type="int" key="ProjectExplorer.BuildConfiguration.BuildStepListCount">1</value>
    <value type="QString" key="ProjectExplorer.ProjectConfiguration.DefaultDisplayName">Deploy locally</value>
    <value type="QString" key="ProjectExplorer.ProjectConfiguration.DisplayName"></value>
    <value type="QString" key="ProjectExplorer.ProjectConfiguration.Id">ProjectExplorer.DefaultDeployConfiguration</value>
   </valuemap>
   <value type="int" key="ProjectExplorer.Target.DeployConfigurationCount">1</value>
   <valuemap type="QVariantMap" key="ProjectExplorer.Target.PluginSettings"/>
   <valuemap type="QVariantMap" key="ProjectExplorer.Target.RunConfiguration.0">
    <valuelist type="QVariantList" key="Analyzer.Valgrind.AddedSuppressionFiles"/>
    <value type="bool" key="Analyzer.Valgrind.Callgrind.CollectBusEvents">false</value>
    <value type="bool" key="Analyzer.Valgrind.Callgrind.CollectSystime">false</value>
    <value type="bool" key="Analyzer.Valgrind.Callgrind.EnableBranchSim">false</value>
    <value type="bool" key="Analyzer.Valgrind.Callgrind.EnableCacheSim">false</value>
    <value type="bool" key="Analyzer.Valgrind.Callgrind.EnableEventToolTips">true</value>
    <value type="double" key="Analyzer.Valgrind.Callgrind.MinimumCostRatio">0.01</value>
    <value type="double" key="Analyzer.Valgrind.Callgrind.VisualisationMinimumCostRatio">10</value>
    <value type="bool" key="Analyzer.Valgrind.FilterExternalIssues">true</value>
    <value type="int" key="Analyzer.Valgrind.LeakCheckOnFinish">1</value>
    <value type="int" key="Analyzer.Valgrind.NumCallers">25</value>
    <valuelist type="QVariantList" key="Analyzer.Valgrind.RemovedSuppressionFiles"/>
    <value type="int" key="Analyzer.Valgrind.SelfModifyingCodeDetection">1</value>
    <value type="bool" key="Analyzer.Valgrind.Settings.UseGlobalSettings">true</value>
    <value type="bool" key="Analyzer.Valgrind.ShowReachable">false</value>
    <value type="bool" key="Analyzer.Valgrind.TrackOrigins">true</value>
    <value type="QString" key="Analyzer.Valgrind.ValgrindExecutable">valgrind</value>
    <valuelist type="QVariantList" key="Analyzer.Valgrind.VisibleErrorKinds">
     <value type="int">0</value>
     <value type="int">1</value>
     <value type="int">2</value>
     <value type="int">3</value>
     <value type="int">4</value>
     <value type="int">5</value>
     <value type="int">6</value>
     <value type="int">7</value>
     <value type="int">8</value>
     <value type="int">9</value>
     <value type="int">10</value>
     <value type="int">11</value>
     <value type="int">12</value>
     <value type="int">13</value>
     <value type="int">14</value>
    </valuelist>
    <value type="int" key="PE.EnvironmentAspect.Base">2</value>
    <valuelist type="QVariantList" key="PE.EnvironmentAspect.Changes"/>
    <value type="QString" key="ProjectExplorer.CustomExecutableRunConfiguration.Arguments"></value>
    <value type="QString" key="ProjectExplorer.CustomExecutableRunConfiguration.Executable"></value>
    <value type="bool" key="ProjectExplorer.CustomExecutableRunConfiguration.UseTerminal">false</value>
    <value type="QString" key="ProjectExplorer.CustomExecutableRunConfiguration.WorkingDirectory">%{buildDir}</value>
    <value type="QString" key="ProjectExplorer.ProjectConfiguration.DefaultDisplayName">Custom Executable</value>
    <value type="QString" key="ProjectExplorer.ProjectConfiguration.DisplayName"></value>
    <value type="QString" key="ProjectExplorer.ProjectConfiguration.Id">ProjectExplorer.CustomExecutableRunConfiguration</value>
    <value type="uint" key="RunConfiguration.QmlDebugServerPort">3768</value>
    <value type="bool" key="RunConfiguration.UseCppDebugger">true</value>
    <value type="bool" key="RunConfiguration.UseCppDebuggerAuto">false</value>
    <value type="bool" key="RunConfiguration.UseMultiProcess">false</value>
    <value type="bool" key="RunConfiguration.UseQmlDebugger">false</value>
    <value type="bool" key="RunConfiguration.UseQmlDebuggerAuto">true</value>
   </valuemap>
   <value type="int" key="ProjectExplorer.Target.RunConfigurationCount">1</value>
  </valuemap>
 </data>
 <data>
  <variable>ProjectExplorer.Project.TargetCount</variable>
  <value type="int">1</value>
 </data>
 <data>
  <variable>ProjectExplorer.Project.Updater.FileVersion</variable>
  <value type="int">15</value>
 </data>
</qtcreator>' >> $PROJNAME.creator.user

echo "Created Qt Creator project file $PROJNAME.creator"
