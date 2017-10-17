package Sample

import org.scalatest.FunSuite

class ATest extends FunSuite {
  test("Ensure that we can test a method on the A Object") {
    assert(A.returnFoo() == "foo")
  }
}
