/**
 * @description Find all tests that call a function named "pressActionKey"
 * @kind problem
 * @id javascript/tests-calling-pressActionKey
 * @problem.severity recommendation
 */
import javascript

predicate callsPressActionKey(FunctionCall call) {
    call.getTarget().getName() = "pressActionKey"
}

from Function test, FunctionCall call
where test.getName().regexpMatch("test.*") and callsPressActionKey(call) and call.getEnclosingFunction() = test
select test, "Found test calling 'pressActionKey': " + test.getName()