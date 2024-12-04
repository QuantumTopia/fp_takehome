# README

* Notes:
*   Booking cancellation, event removal, not showing events that have passed and 
*       relevant tests have not been added.
*
*   Basic form validations have not been implemented such as data types and valid 
*       values. Form error display does not work.
*
*   The concurrent user booking problem is solved with a pessimistic lock through 
*       transaction on bookings model/table. This is not ideal as other users cant
*       even view events while a booking is ongoing, the lock needs to be changed 
*       to at worst lock the rows associated with the specific event being booked.
*
*   Caching: there is basic caching added to the list of services provided by the 
*       app. Ideally, segments of the info on for example event info page can be 
*       cached.
*
*   Testing: only basic proof of concept tests have been added, lots of tests to
*       add, some of which are non-exhaustively described in the relevant test files.
*       Integration/smoked tests should be added for use-case paths.
*
*   TDD: a lot of trial and error when setting up the project as I have no set up
*       a fresh rails project before, so TDD approach was not efficient, which
*       can be seen from the git commit history.

# fp_takehome
