<%@ Page Language="VB" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>
<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>
<%@ Register Assembly="DevExpress.XtraScheduler.v13.1.Core, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraScheduler" TagPrefix="cc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="CarsSchedulingDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:XtraCarsConnectionString %>" DeleteCommand="DELETE FROM [CarScheduling] WHERE [ID] = @ID" InsertCommand="INSERT INTO [CarScheduling] ([CarId], [UserId], [Status], [Subject], [Description], [Label], [StartTime], [EndTime], [Location], [AllDay], [EventType], [RecurrenceInfo], [ReminderInfo], [Price]) VALUES (@CarId, @UserId, @Status, @Subject, @Description, @Label, @StartTime, @EndTime, @Location, @AllDay, @EventType, @RecurrenceInfo, @ReminderInfo, @Price)" SelectCommand="SELECT * FROM [CarScheduling]" UpdateCommand="UPDATE [CarScheduling] SET [CarId] = @CarId, [UserId] = @UserId, [Status] = @Status, [Subject] = @Subject, [Description] = @Description, [Label] = @Label, [StartTime] = @StartTime, [EndTime] = @EndTime, [Location] = @Location, [AllDay] = @AllDay, [EventType] = @EventType, [RecurrenceInfo] = @RecurrenceInfo, [ReminderInfo] = @ReminderInfo, [Price] = @Price WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="CarId" Type="String" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="Status" Type="Int32" />
                <asp:Parameter Name="Subject" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Label" Type="Int32" />
                <asp:Parameter Name="StartTime" Type="DateTime" />
                <asp:Parameter Name="EndTime" Type="DateTime" />
                <asp:Parameter Name="Location" Type="String" />
                <asp:Parameter Name="AllDay" Type="Boolean" />
                <asp:Parameter Name="EventType" Type="Int32" />
                <asp:Parameter Name="RecurrenceInfo" Type="String" />
                <asp:Parameter Name="ReminderInfo" Type="String" />
                <asp:Parameter Name="Price" Type="Double" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="CarId" Type="String" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="Status" Type="Int32" />
                <asp:Parameter Name="Subject" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Label" Type="Int32" />
                <asp:Parameter Name="StartTime" Type="DateTime" />
                <asp:Parameter Name="EndTime" Type="DateTime" />
                <asp:Parameter Name="Location" Type="String" />
                <asp:Parameter Name="AllDay" Type="Boolean" />
                <asp:Parameter Name="EventType" Type="Int32" />
                <asp:Parameter Name="RecurrenceInfo" Type="String" />
                <asp:Parameter Name="ReminderInfo" Type="String" />
                <asp:Parameter Name="Price" Type="Double" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="CarsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:XtraCarsConnectionString %>"
            SelectCommand="SELECT [ID], [Model] FROM [Cars]"></asp:SqlDataSource>
        
        <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server" AppointmentDataSourceID="CarsSchedulingDataSource"
            ResourceDataSourceID="CarsDataSource" 
            OnAppointmentRowInserted="ASPxScheduler1_AppointmentRowInserted" 
            ActiveViewType="Timeline" GroupType="Resource">         
            <Storage>
                <Appointments ResourceSharing="True" >
                    <Mappings AppointmentId="ID" End="EndTime" Start="StartTime" Subject="Subject"
                    Description="Description" Location="Location" AllDay="AllDay"
                    Type="EventType" RecurrenceInfo="RecurrenceInfo" ReminderInfo="ReminderInfo"
                    Label="Label" Status="Status" ResourceId="CarId" />
                    <CustomFieldMappings>
                        <dxwschs:ASPxAppointmentCustomFieldMapping Member="Price" Name="Price" />                        
                    </CustomFieldMappings>
                </Appointments>
                <Resources>
                    <Mappings ResourceId="ID" Caption="Model" />                    
                </Resources>
                
            </Storage>
            <Views>
                <WorkWeekView>
                    <TimeRulers>
                        <cc1:TimeRuler>
                        </cc1:TimeRuler>
                    </TimeRulers>                    
                </WorkWeekView>
                <DayView ResourcesPerPage="3">
                    <TimeRulers>
                        <cc1:TimeRuler>
                        </cc1:TimeRuler>
                    </TimeRulers>
                    <DayViewStyles ScrollAreaHeight="400px">
                    </DayViewStyles>
                </DayView>
                <MonthView NavigationButtonVisibility="Always" ResourcesPerPage="3">
                </MonthView>
                <TimelineView ResourcesPerPage="3">
                    <Scales>
                        <cc1:TimeScaleYear Enabled="False" />
                        <cc1:TimeScaleQuarter Enabled="False" />
                        <cc1:TimeScaleMonth />
                        <cc1:TimeScaleWeek />
                        <cc1:TimeScaleDay />
                        <cc1:TimeScaleHour Enabled="False" />
                        <cc1:TimeScaleFixedInterval Enabled="False" />
                    </Scales>
                    <AppointmentDisplayOptions AppointmentAutoHeight="True" />
                </TimelineView>
            </Views>
        </dxwschs:ASPxScheduler>
    
    </div>
    </form>
</body>
</html>
