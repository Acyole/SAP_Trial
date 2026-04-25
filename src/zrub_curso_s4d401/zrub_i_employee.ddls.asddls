//@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@AbapCatalog: {
    dataMaintenance: #RESTRICTED,
    viewEnhancementCategory: [#NONE]
  }
@EndUserText.label: 'CDS BASIC Employee'
@Metadata.ignorePropagatedAnnotations: true
define view entity zrub_I_Employee
  as select from zrub_employee
{
  key employee_id   as EmployeeId,
      first_name    as FirstName,
      last_name     as LastName,
      street        as Street,
      postal_code   as PostalCode,
      city          as City,
      country       as Country,      
      status        as Status,
      birth_date    as BirthDate,
      entry_date    as EntryDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      annual_salary as AnnualSalary,
      @EndUserText.label: 'Currency Key'
      currency_code as CurrencyCode
}
