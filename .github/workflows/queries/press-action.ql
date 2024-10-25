/**
 * @description Find all tests that call a function named "pressActionKey"
 * @kind problem
 * @id javascript/tests-calling-pressActionKey
 * @problem.severity recommendation
 */
import javascript

predicate callsPressActionKey(Expr call) {
    exists(CallExpression callExpr |
        callExpr = call and
        callExpr.getTarget().getName() = "pressActionKey"
    )
}

from Function test, Expr call
where test.getName().regexpMatch("test.*") and callsPressActionKey(call) and call.getEnclosingFunction() = test
select test, "Found test calling 'pressActionKey': " + test.getName()