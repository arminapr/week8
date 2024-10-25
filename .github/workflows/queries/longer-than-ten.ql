/**
 * @description Find all files with more than ten lines
 * @kind problem
 * @id javascript/files-longer-than-ten-lines
 * @problem.severity recommendation
 */
import javascript

predicate isLongerThanTen(Function f) {
    f.getNumLines() > 10
}  

from Function f
where isLongerThanTen(f)
select f, "Found file with more than ten lines: " + f.getName()