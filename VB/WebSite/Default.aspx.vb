#Region "#usings"
Imports DevExpress.Web.ASPxScheduler
Imports System
Imports System.Data.SqlClient
#End Region ' #usings

Partial Public Class _Default
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
	End Sub

	Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
		 ASPxScheduler1.Start = New DateTime(2008, 07, 13)
	End Sub
	#Region "#appointmentrowinserted"
	Protected Sub ASPxScheduler1_AppointmentRowInserted(ByVal sender As Object, ByVal e As ASPxSchedulerDataInsertedEventArgs)
		Dim connection As New SqlConnection(CarsSchedulingDataSource.ConnectionString)
'INSTANT VB NOTE: The variable id was renamed since Visual Basic does not handle local variables named the same as class members well:
		Dim id_Conflict As Object = Nothing
		connection.Open()
		Try
			Using cmd As New SqlCommand("SELECT IDENT_CURRENT('CarScheduling')", connection)
				id_Conflict = Convert.ToInt32(cmd.ExecuteScalar())
			End Using
			e.KeyFieldValue = id_Conflict
		Finally
			connection.Close()
		End Try
	End Sub
	#End Region ' #appointmentrowinserted
End Class
