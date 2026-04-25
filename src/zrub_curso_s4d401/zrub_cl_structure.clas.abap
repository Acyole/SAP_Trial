CLASS zrub_cl_structure DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zrub_cl_structure IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA person TYPE zrub_person.
    DATA person1 TYPE zrub_person_include.
    DATA person2 TYPE zrub_person_include_2.

************************ person ****************************
* Só funciona assim:
    person-name-first_name     = 'Dictionary'.
    person-name-last_name      = 'ABAP'.
    person-address-street      = 'Dietmar-Hopp-Allee 16'.
    person-address-postal_code = '69190'.
    person-address-city        = 'Walldorf'.
    person-address-country     = 'DE'.

************************ person1 ***************************
    person1-name-first_name     = 'Dictionary'.
    person1-name-last_name      = 'ABAP'.
    person1-address-street      = 'Dietmar-Hopp-Allee 16'.
    person1-address-postal_code = '69190'.
    person1-address-city        = 'Walldorf'.
    person1-address-country     = 'DE'.

* or -------------------------------------------------------

    person1-first_name          = 'Direto - Dictionary'.
    person1-last_name           = 'Direto - ABAP'.
    person1-street              = 'Direto - Dietmar-Hopp-Allee 16'.
    person1-postal_code         = '69190'.
    person1-city                = 'Direto - Walldorf'.
    person1-country             = 'DE'.

************************ person2 ***************************
* Só funciona assim:
    person2-first_name          = 'Dictionary'.
    person2-last_name           = 'ABAP'.
    person2-street              = 'Dietmar-Hopp-Allee 16'.
    person2-postal_code         = '69190'.
    person2-city                = 'Walldorf'.
    person2-country             = 'DE'.

  ENDMETHOD.

ENDCLASS.
