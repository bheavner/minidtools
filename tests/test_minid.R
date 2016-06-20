library(minid)
library(RUnit)
#-------------------------------------------------------------------------------

printf <- function(...) print(noquote(sprintf(...)))
#-------------------------------------------------------------------------------

runTests <- function()
{
   test_constructor()
   test_getCreator()

} # runTests
#-------------------------------------------------------------------------------

test_constructor <- function()
{
   printf("--- test_constructor")

   checkException(minid(), silent=TRUE)  # should fail with no ctor argument

   demo.id <- "ark:/99999/fk4mp58v5t"
   minid <- minid(demo.id)
   checkEquals(is(minid), "minid")

} # test_constructor
#-------------------------------------------------------------------------------

test_getCreator <- function()
{
   printf("--- test_getCreator")
   demo.id <- "ark:/99999/fk4mp58v5t"
   minid <- minid(demo.id)
   checkEquals(getCreator(minid), "Ben Heavner")

} # test_getCreator
#-------------------------------------------------------------------------------

