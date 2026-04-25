@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Consumption Employee'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
 serviceQuality: #D,
 sizeCategory:   #M,
 dataClass:      #MASTER
                    }

define view entity zrub_c_employee
  as select from zrub_I_Employee
{
  key EmployeeId,
      FirstName,
      LastName,
      Street,
      PostalCode,
      City,
      Country,
      Status,
      BirthDate,
      EntryDate,
      AnnualSalary,
      CurrencyCode
}
