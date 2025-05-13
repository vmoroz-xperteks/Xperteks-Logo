#fill some forms
[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
[Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] | Out-Null

#furnish the toast XML
[xml]$ToastTemplate = @"
<toast duration="long">
  <visual>
    <binding template="ToastGeneric">
      <text>Your computer requires a reboot.</text>
      <text placement="attribution">User Notification</text>
      <image placement="hero" src="file://C:/ProgramData/CentraStage/Packages/f97b4bb0-2cb0-45f1-9169-630f2da340fa#/hero.png"/>
      <image id="1" placement="appLogoOverride" hint-crop="circle" src="file://C:/ProgramData/CentraStage/Brand/primaryLogo.png"/>
        <group>
            <subgroup>
                <text hint-style="body" hint-wrap="true">Xperteks support has installed important updates  on your computer. Please reboot your computer to allow the installation to complete.</text>
            </subgroup>
        </group>
    </binding>
  </visual>
<actions><action content="Restart now" arguments="ToastReboot:\\" activationType="protocol" /></actions>
</toast>
"@
$ToastXml = [Windows.Data.Xml.Dom.XmlDocument]::New()
$ToastXml.LoadXml($ToastTemplate.OuterXml)
$ToastMessage = [Windows.UI.Notifications.ToastNotification]::New($ToastXML)
[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("dRMMNotifier").Show($ToastMessage)
